//
//  Explore.ViewModel.swift
//  my_messenger
//
//  Created by Kirill Titov on 26.10.2023.
//

import DesignSystem
import Foundation
import SwiftUI
import Combine

extension Explore {
	final class ViewModel: ObservableObject {

		public var cancelBag: CancelBag = CancelBag()

		let loadMoreData: PassthroughSubject<Int, Never> = .init()

		let infinitiListViewModel: InfiniteList.ViewModel<[Explore.TestViewModel]>

		let totalItemsAvailable: Int = 100

		var tag: Int = 1
		var name: String = "Explore"
		var tabBarImageName: String = "newspaper"
		@Published var data = [Explore.TestViewModel]()

		init() {
			self.infinitiListViewModel = .init(
				data: $data,
				loadMoreData: loadMoreData,
				totalItemsAvailable: totalItemsAvailable
			)
			setup()
		}

		func setup() {
			loadMoreData
				.flatMap(requestItemsData)
				.receive(on: DispatchQueue.main)
				.sink { [weak self] in
					self?.data.append(contentsOf: $0)
				}
				.store(in: cancelBag)
		}


		func requestItemsData(page: Int) -> AnyPublisher<[Explore.TestViewModel], Never> {
			let publisher1 = Just(
				(1...15).map { index in Explore.TestViewModel(name: "page: \(page) index: \(index)") }
			).delay(for: .milliseconds(1300), scheduler: DispatchQueue.global(qos: .background))
				.eraseToAnyPublisher()
			return publisher1
		}
	}
}

extension Explore.ViewModel {
//: ViewModelProtocol {

	/// State of sign in view
	enum State: Equatable {
		/// user edit his data
		case idle
		/// sign in fail
		case failure
	}

	final class Input {

//		func loadMoreData(page: Int) {
//			return requestItemsData(page: page)
//		}

		/// load page: Int
//		let loadMoreData: PassthroughSubject<Int, Never> = .init()
	}

	final class Output {
	}

//	func transform(
//		input: Input,
//		cancelBag: CancelBag
//	) -> Output {
//		let output = Output()
//
//		input.loadMoreData
//			.flatMap(input.requestItemsData)
//			.receive(on: DispatchQueue.main)
//			.sink {
//				output.data.append(contentsOf: $0)
//			}
//			.store(in: cancelBag)
//		input.action.compactMap {
//			if case let .loadMore(page) = $0 { return page }
//			return nil
//		}.map(requestItems(page:))
//			.sink { eewfw in
//
//		}
//
//		return output
//	}
}

extension Explore.ViewModel.Input {
	func requestItemsData(page: Int) -> AnyPublisher<[Explore.TestViewModel], Never> {
		let publisher1 = Just(
			(1...15).map { index in Explore.TestViewModel(name: "page: \(page) index: \(index)") }
		).delay(for: .milliseconds(1300), scheduler: DispatchQueue.global(qos: .background))
			.eraseToAnyPublisher()
		return publisher1
	}

	func requestItems(page: Int) -> AnyPublisher<[Explore.TestViewModel], Never> {
		let publisher1 = Just(
			(1...15).map { index in Explore.TestViewModel(name: "page: \(page) index: \(index)") }
		).delay(for: .milliseconds(1300), scheduler: DispatchQueue.global(qos: .background))
			.eraseToAnyPublisher()
		return publisher1
	}
}
