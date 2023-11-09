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
	final class ViewModel {}
}

extension Explore.ViewModel: ViewModelProtocol {

	/// State of sign in view
	enum State: Equatable {
		/// user edit his data
		case idle
		/// sign in fail
		case failure
	}

	final class Input: ObservableObject {
		private(set) lazy var loadMore: ((Int) -> (AnyPublisher<[AnyView], Never>)) = { [weak self] in
			guard let self = self else { return Just([]).eraseToAnyPublisher() }
			return self.requestItems(page: $0)
		}

//		func loadMoreData(page: Int) {
//			return requestItemsData(page: page)
//		}

		/// load page: Int
		let loadMoreData: PassthroughSubject<Int, Never> = .init()
	}

	final class Output: ObservableObject {
		var tag: Int = 1
		var name: String = "Explore"
		var tabBarImageName: String = "newspaper"
		@Published var items: [AnyView] = []
		@Published var data = [Explore.TestViewModel]()
		@Published var state: State = .idle
	}

	func transform(
		input: Input,
		cancelBag: CancelBag
	) -> Output {
		let output = Output()

		input.loadMoreData
			.flatMap(input.requestItemsData)
			.assign(to: \.data, on: output)
			.store(in: cancelBag)
//		input.action.compactMap {
//			if case let .loadMore(page) = $0 { return page }
//			return nil
//		}.map(requestItems(page:))
//			.sink { eewfw in
//
//		}

		return output
	}
}

extension Explore.ViewModel.Input: InfiniteListDelegate {
	func requestItemsData(page: Int) -> AnyPublisher<[Explore.TestViewModel], Never> {
		let publisher1 = Just(
			(1...15).map { page in Explore.TestViewModel(name: "\(page)") }
		).delay(for: .milliseconds(1300), scheduler: DispatchQueue.global(qos: .background))
			.eraseToAnyPublisher()
		return publisher1
	}

	func requestItems(page: Int) -> AnyPublisher<[AnyView], Never> {
		let publisher1 = Just([
			AnyView(Text("\(page)")),
			AnyView(Text("\(page)")),
			AnyView(Text("\(page)")),
			AnyView(Text("\(page)")),
			AnyView(Text("\(page)")),
			AnyView(Text("\(page)")),
			AnyView(Text("\(page)")),
			AnyView(Text("\(page)")),
			AnyView(Text("\(page)")),
			AnyView(Text("\(page)")),
			AnyView(Text("\(page)")),
			AnyView(Text("\(page)")),
			AnyView(Text("\(page)")),
			AnyView(Text("\(page)")),
			AnyView(Text("\(page)"))
		]).delay(for: .milliseconds(1300), scheduler: DispatchQueue.global(qos: .background))
			.eraseToAnyPublisher()
//		let publisher2 = Just([
//			AnyView(Text("111111")),
//			AnyView(Text("222222")),
//			AnyView(Text("333333")),
//			AnyView(Text("444444")),
//			AnyView(Text("555555")),
//			AnyView(Text("111111")),
//			AnyView(Text("222222")),
//			AnyView(Text("333333")),
//			AnyView(Text("444444")),
//			AnyView(Text("555555")),
//			AnyView(Text("111111")),
//			AnyView(Text("222222")),
//			AnyView(Text("333333")),
//			AnyView(Text("444444")),
//			AnyView(Text("555555")),
//			AnyView(Text("111111")),
//			AnyView(Text("222222")),
//			AnyView(Text("333333")),
//			AnyView(Text("444444")),
//			AnyView(Text("555555")),
//			AnyView(Text("111111")),
//			AnyView(Text("222222")),
//			AnyView(Text("333333")),
//			AnyView(Text("444444")),
//			AnyView(Text("555555"))
//		]).eraseToAnyPublisher()
//		return Publishers.Merge(
//			publisher1
////			publisher2
//		).eraseToAnyPublisher()
		return publisher1
	}
}
