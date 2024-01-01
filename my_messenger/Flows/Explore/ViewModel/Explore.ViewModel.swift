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

		enum HeaderSection: String, Equatable, CaseIterable {
			case cats
			case dogs
			case foxes
		}

		public let cancelBag: CancelBag = CancelBag()

		let loadMoreData: PassthroughSubject<Void, Never> = .init()
		let refresh: PassthroughSubject<Void, Never> = .init()
		let rowAction: PassthroughSubject<AnimalViewModel, Never> = .init()
		let serviceApi: AnimalServiceProtocol

		let totalItemsAvailable: Int = 100

		let tag: Int = 1
		let name: String = "Explore"
		let tabBarImageName: String = "newspaper"

		@Published var data: [Explore.AnimalViewModel] = []
		@Published var page: Int = 1
		@Published var headerSection: HeaderSection = .cats
		@Published var isLoading: Bool = false

		init() {
			self.serviceApi = MockAnimalApi.service

			setupBindings()

			loadMoreData.send(())
		}

		private func setupBindings() {
			$headerSection
				.sink { [weak self] _ in
					self?.refresh.send(())
				}
				.store(in: cancelBag)

			loadMoreData
				.receive(on: DispatchQueue.main)
				.sink { [weak self] in
					guard let self = self else { return }
					self.isLoading = true
					self.requestItemsData(page: self.page, providerType: headerSection)
						.receive(on: DispatchQueue.main)
						.sink { [weak self] data in
							guard let self = self else { return }
							self.data += data
							self.isLoading = false
							self.page += 1
						}.store(in: self.cancelBag)
				}.store(in: cancelBag)

			rowAction
				.sink { item in
					print(item)
				}.store(in: cancelBag)

			refresh
				.receive(on: DispatchQueue.main)
				.sink { [weak self] providerType in
					guard let self = self else { return }
					page = 1
					data = []
					loadMoreData.send(())
				}.store(in: cancelBag)
		}
	}
}

// MARK: - MOCK
extension Explore.ViewModel {
	func requestItemsData(page: Int, providerType: HeaderSection?) -> AnyPublisher<[Explore.AnimalViewModel], Never> {
		guard let providerType = providerType else { return Empty().eraseToAnyPublisher() }
		switch providerType {
		case .cats:
			return serviceApi.catsRequest(page: page)
		case .dogs:
			return serviceApi.dogsRequest(page: page)
		case .foxes:
			return serviceApi.foxesRequest(page: page)
		}
	}
}
