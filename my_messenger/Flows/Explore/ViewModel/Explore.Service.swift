//
//  Explore.Service.swift
//  my_messenger
//
//  Created by Титов Кирилл Иванович on 12.11.2023.
//

import Combine
import Foundation
import ServiceLocator

protocol AnimalServiceProtocol {
	/// Request cats data
	/// - Parameter page: pagination page
	/// - Returns: requested model
	func catsRequest(page: Int) -> AnyPublisher<[Explore.AnimalViewModel], Never>
	/// Request dogs data
	/// - Parameter page: pagination page
	/// - Returns: requested model
	func dogsRequest(page: Int) -> AnyPublisher<[Explore.AnimalViewModel], Never>
	/// Request foxes data
	/// - Parameter page: pagination page
	/// - Returns: requested model
	func foxesRequest(page: Int) -> AnyPublisher<[Explore.AnimalViewModel], Never>
}

extension Explore {
	final class AnimalService: AnimalServiceProtocol {
		func catsRequest(page: Int) -> AnyPublisher<[Explore.AnimalViewModel], Never> {
			Empty().eraseToAnyPublisher()
		}

		func dogsRequest(page: Int) -> AnyPublisher<[Explore.AnimalViewModel], Never> {
			Empty().eraseToAnyPublisher()
		}

		func foxesRequest(page: Int) -> AnyPublisher<[Explore.AnimalViewModel], Never> {
			Empty().eraseToAnyPublisher()
		}
	}
}

final class MockAnimalApi: AnimalServiceProtocol {
	// cats api
	func catsRequest(page: Int) -> AnyPublisher<[Explore.AnimalViewModel], Never> {
		let publisher1 = Just(
			(1...15).map { index in Explore.AnimalViewModel(name: "😺 page: \(page) index: \(index)") }
		).delay(for: .milliseconds(1300), scheduler: DispatchQueue.global(qos: .background))
			.eraseToAnyPublisher()
		return publisher1
	}

	// dogs api
	func dogsRequest(page: Int) -> AnyPublisher<[Explore.AnimalViewModel], Never> {
		let publisher1 = Just(
			(1...15).map { index in Explore.AnimalViewModel(name: "🐶 page: \(page) index: \(index)") }
		).delay(for: .milliseconds(1300), scheduler: DispatchQueue.global(qos: .background))
			.eraseToAnyPublisher()
		return publisher1
	}

	// fox api
	func foxesRequest(page: Int) -> AnyPublisher<[Explore.AnimalViewModel], Never> {
		let publisher1 = Just(
			(1...15).map { index in Explore.AnimalViewModel(name: "🦊 page: \(page) index: \(index)") }
		).delay(for: .milliseconds(1300), scheduler: DispatchQueue.global(qos: .background))
			.eraseToAnyPublisher()
		return publisher1
	}
}

extension MockAnimalApi: ServiceProtocol {
	static var service: MockAnimalApi {
		if let service: MockAnimalApi = ServiceLocator.service() {
			return service
		}

		let service = MockAnimalApi()
		ServiceLocator.addService(service)
		return service
	}

	func clear() {}

	func remove() {
		ServiceLocator.removeService(self)
	}
}
