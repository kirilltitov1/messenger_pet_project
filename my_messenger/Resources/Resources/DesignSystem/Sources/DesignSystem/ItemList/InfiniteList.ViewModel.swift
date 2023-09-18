//
//  File.swift
//  
//
//  Created by Титов Кирилл Иванович on 03.10.2023.
//

import Foundation
import Combine
import SwiftUI

extension InfiniteList {
	final class ViewModel {

		enum Actions: Equatable {
			case tapOnRaw
			case requestMoreRawsIfNeedIt(index: Int)
			case requestItems

			var value: Int? {
				switch self {
				case .requestMoreRawsIfNeedIt(let index):
					return index
				default:
					return nil
				}
			}
		}

		enum State: Equatable {
			case idle
			case endOfScroll
			case loadingMoreRaws
			case action(Actions)
			case failure
		}

		final class Input: ObservableObject  {
			var action: PassthroughSubject<Actions, Never> = .init()
		}

		final class Output: ObservableObject {
			@Published var raws: [AnyView] = []
			@Published var state: State = .idle

			@Published fileprivate var totalItemsAvailable: Int = 0
			@Published fileprivate var itemsLoadedCount: Int = 0
			@Published fileprivate var page = 0
		}

		private var delegate: InfiniteListDelegate
		private let cancelBag: CancelBag
		private let itemsFromEndThreshold: Int = 15

		init(
			delegate: InfiniteListDelegate,
			cancelBag: CancelBag
		) {
			self.delegate = delegate
			self.cancelBag = cancelBag
		}

		func transform(input: Input) -> Output {
			let output = Output()

			input.action
				.filter {
					if case .requestMoreRawsIfNeedIt = $0 { return true }
					return false
				}.map { _ in .loadingMoreRaws }
				.assign(to: \.state, on: output)
				.store(in: cancelBag)

			input.action
				.compactMap {
					if case let .requestMoreRawsIfNeedIt(index) = $0 { return index }
					return nil
				}.filter { [weak self] in
					guard let self = self else { return false }
					return self.thresholdMeet(output.itemsLoadedCount, $0) &&
					self.moreItemsRemaining(output.itemsLoadedCount, output.totalItemsAvailable)
				}.map { _ in .action(.requestItems) }
				.assign(to: \.state, on: output)
				.store(in: cancelBag)

			input.action
				.filter {
					if case .requestItems = $0 { return true }
					return false
				}.sink { [weak self] _ in
					guard let self = self else { return }
					output.page += 1
					output.state = .loadingMoreRaws
					self.delegate.requestItems(page: output.page)
						.sink {
							output.totalItemsAvailable = $0.count
							output.raws.append(contentsOf: $0)
							output.itemsLoadedCount = output.raws.count
							output.state = .idle
						}
						.store(in: self.cancelBag)
				}.store(in: cancelBag)

			return output
		}
	}
}

private extension InfiniteList.ViewModel {
	/// Determines whether we have meet the threshold for requesting more items.
	private func thresholdMeet(_ itemsLoadedCount: Int, _ index: Int) -> Bool {
		return (itemsLoadedCount - index) == itemsFromEndThreshold
	}

	/// Determines whether there is more data to load.
	private func moreItemsRemaining(_ itemsLoadedCount: Int, _ totalItemsAvailable: Int) -> Bool {
		return itemsLoadedCount < totalItemsAvailable
	}
}
