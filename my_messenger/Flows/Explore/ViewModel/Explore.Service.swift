//
//  Explore.Service.swift
//  my_messenger
//
//  Created by Титов Кирилл Иванович on 12.11.2023.
//

import Combine
import Foundation

protocol ExploreServiceProtocol {
	/// Request cats data
	/// - Parameter page: pagination page
	/// - Returns: requested model
	func catsRequest(page: Int) -> AnyPublisher<[Explore.TestViewModel], Never>
	/// Request dogs data
	/// - Parameter page: pagination page
	/// - Returns: requested model
	func dogsRequest(page: Int) -> AnyPublisher<[Explore.TestViewModel], Never>
	/// Request foxes data
	/// - Parameter page: pagination page
	/// - Returns: requested model
	func foxesRequest(page: Int) -> AnyPublisher<[Explore.TestViewModel], Never>
}

extension Explore {
	final class Service: ExploreServiceProtocol {
		func catsRequest(page: Int) -> AnyPublisher<[Explore.TestViewModel], Never> {
			Just([]).eraseToAnyPublisher()
		}

		func dogsRequest(page: Int) -> AnyPublisher<[Explore.TestViewModel], Never> {
			Just([]).eraseToAnyPublisher()
		}

		func foxesRequest(page: Int) -> AnyPublisher<[Explore.TestViewModel], Never> {
			Just([]).eraseToAnyPublisher()
		}
	}
}

final class MockApi: ExploreServiceProtocol {
	// cats api
	func catsRequest(page: Int) -> AnyPublisher<[Explore.TestViewModel], Never> {
		let publisher1 = Just(
			(1...15).map { index in Explore.TestViewModel(name: "😺 page: \(page) index: \(index)") }
		).delay(for: .milliseconds(1300), scheduler: DispatchQueue.global(qos: .background))
			.eraseToAnyPublisher()
		return publisher1
	}

	// dogs api
	func dogsRequest(page: Int) -> AnyPublisher<[Explore.TestViewModel], Never> {
		let publisher1 = Just(
			(1...15).map { index in Explore.TestViewModel(name: "🐶 page: \(page) index: \(index)") }
		).delay(for: .milliseconds(1300), scheduler: DispatchQueue.global(qos: .background))
			.eraseToAnyPublisher()
		return publisher1
	}

	// fox api
	func foxesRequest(page: Int) -> AnyPublisher<[Explore.TestViewModel], Never> {
		let publisher1 = Just(
			(1...15).map { index in Explore.TestViewModel(name: "🦊 page: \(page) index: \(index)") }
		).delay(for: .milliseconds(1300), scheduler: DispatchQueue.global(qos: .background))
			.eraseToAnyPublisher()
		return publisher1
	}
}
