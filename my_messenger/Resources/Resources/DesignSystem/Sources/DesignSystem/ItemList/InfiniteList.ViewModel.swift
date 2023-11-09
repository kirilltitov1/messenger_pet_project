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

		enum Action: Equatable {
			case tapOnRaw(index: Int)
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
			case action(Action)
			case failure
		}

		final class Input<Data>: ObservableObject
		where Data: RandomAccessCollection, Data.Element: Hashable {
			private(set) var action: PassthroughSubject<Action, Never> = .init()
			private(set) var loadMore: ((Int) -> (AnyPublisher<[AnyView], Never>))
			private(set) var loadMoreData: PassthroughSubject<Int, Never>

			init(
				loadMore: (@escaping (Int) -> AnyPublisher<[AnyView], Never>),
				loadMoreData: PassthroughSubject<Int, Never>
			) {
				self.loadMore = loadMore
				self.loadMoreData = loadMoreData
			}
		}

		final class Output<Data>: ObservableObject
		where Data: RandomAccessCollection, Data.Element: Hashable {
			@Binding var data: Data
			@Published var raws: [ItemRaw] = []
			@Published var state: State = .idle

			@Published fileprivate private(set) var totalItemsAvailable: Int
			@Published fileprivate var itemsLoadedCount: Int = 0
			@Published fileprivate var page = 0

			private var cancellable: AnyCancellable?

			init(
				data: Binding<Data>,
				totalItemsAvailable: Int
			) {
				self._data = data
				self.totalItemsAvailable = totalItemsAvailable
			}
		}

		private weak var cancelBag: CancelBag?
		private static let itemsFromEndThreshold: Int = 15

		init(
			cancelBag: CancelBag
		) {
			self.cancelBag = cancelBag
		}

		func transform<Data>(
			totalItemsAvailable: Int,
			data: Binding<Data>,
			input: Input<Data>
		) -> Output<Data>
		where Data: RandomAccessCollection, Data.Element: Hashable {
			let output = Output<Data>(
				data: data,
				totalItemsAvailable: totalItemsAvailable
			)

			guard let cancelBag = cancelBag else { return output }

			input.action
				.compactMap {
					if case let .requestMoreRawsIfNeedIt(index) = $0 { return index }
					return nil
				}.filter {
					InfiniteList.ViewModel.thresholdMeet(output.itemsLoadedCount, $0) &&
					InfiniteList.ViewModel.moreItemsRemaining(output.itemsLoadedCount, output.totalItemsAvailable)
				}.sink { _ in
					input.action.send(.requestItems)
				}.store(in: cancelBag)

//			input.action
//				.filter {
//					if case .requestItems = $0 { return true }
//					return false
//				}.sink { [cancelBag] _ in
//					output.page += 1
//					output.state = .loadingMoreRaws
//					input.loadMore(output.page)
//						.receive(on: DispatchQueue.main)
//						.sink { loadedRaws in
//							output.raws.append(contentsOf: loadedRaws.map(ItemRaw.init(raw:)))
//							output.itemsLoadedCount = output.raws.count
//							output.state = .idle
//						}
//						.store(in: cancelBag)
//				}.store(in: cancelBag)

			input.action
				.filter {
					if case .requestItems = $0 { return true }
					return false
				}.sink { _ in
					output.page += 1
//					output.state = .loadingMoreRaws
					input.loadMoreData.send(output.page)
						
//					input.loadMore(output.page)
//						.receive(on: DispatchQueue.main)
//						.sink { loadedRaws in
//							output.raws.append(contentsOf: loadedRaws.map(ItemRaw.init(raw:)))
//							output.itemsLoadedCount = output.raws.count
//							output.state = .idle
//						}
//						.store(in: cancelBag)
				}.store(in: cancelBag)

			input.action
				.compactMap {
					if case let .tapOnRaw(index) = $0 { return index }
					return nil
				}.sink { _ in
					
				}.store(in: cancelBag)

			return output
		}
	}
}

private extension InfiniteList.ViewModel {
	/// Determines whether we have meet the threshold for requesting more items.
	private static func thresholdMeet(_ itemsLoadedCount: Int, _ index: Int) -> Bool {
		return (itemsLoadedCount - index) == InfiniteList.ViewModel.itemsFromEndThreshold
	}

	/// Determines whether there is more data to load.
	private static func moreItemsRemaining(_ itemsLoadedCount: Int, _ totalItemsAvailable: Int) -> Bool {
		return itemsLoadedCount < totalItemsAvailable
	}
}
