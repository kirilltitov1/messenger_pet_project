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

		public let cancelBag: CancelBag = CancelBag()

		let loadMoreData: PassthroughSubject<Void, Never> = .init()
		let refresh: PassthroughSubject<Void, Never> = .init()
		let rowAction: PassthroughSubject<TestViewModel, Never> = .init()
		let serviceApi: ExploreServiceProtocol

		let totalItemsAvailable: Int = 100

		let tag: Int = 1
		let name: String = "Explore"
		let tabBarImageName: String = "newspaper"

		@Published var data: [Explore.TestViewModel] = []
		@Published var isLoading: Bool = false
		@Published var page: Int = 1
		@Published var headerSection: HeaderSection = .cats {
			didSet {
				refresh.send(())
			}
		}

		// FIXME: [1] хотелось бы задать этот енум для работы стратегии с апи, не понимаю как прикрепить его к swifui... выглядит так что swiftui забирает часть логики из модели например как мне забиндить паблишер из Explore.ViewModel в Explore.Screen, раньше я мог написать фабрику, которая бы собрала зависимости, но сам инициализабор View не дает этого сделать из за враппера observableObject
		enum HeaderSection: String, Equatable, CaseIterable {
			case cats
			case dogs
			case foxes
		}

		init(
			serviceApi: ExploreServiceProtocol
		) {
			self.serviceApi = serviceApi

			setupBindings()

			loadMoreData.send(())
		}

		private func setupBindings() {
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
	func requestItemsData(page: Int, providerType: HeaderSection?) -> AnyPublisher<[Explore.TestViewModel], Never> {
		// FIXME: [2] вот тут очень легко заметить этот гигантский костыль в виде Optional<HeaderSection>, headerSection хотелось бы инитить тут, оно бы вызывало загрузку данных, а как его отсюда забиндить на Picker который в Explore.Screen ?
		guard let providerType = providerType else { return Just([]).eraseToAnyPublisher() }
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
