//
//  TabBar.Factory.swift
//  Instagram
//
//  Created by Kirill Titov on 12.10.2022.
//

import UIKit
import SwiftUI
import Foundation
import DesignSystem

/// tab bar item
protocol TabBarItemFactoryProtocol {
	var name: String { get }
	var tabBarImageName: String { get }
	func makeTabBarNavItem(tag: Int) -> UINavigationController
	func makeSwiftUITabView(tag: Int) -> TabScreenWrapper<AnyView>
}

/// main factory protocol
protocol MainFactoryProtocol {
	func makeMain() -> [UINavigationController]
}

extension Main {
	/// Main screen facotry
	final class Factory: MainFactoryProtocol {
		
		private let homeFactory: Home.Factory = Home.Factory()
		private let exploreFactory: Explore.Factory = Explore.Factory()
		private let cameraFactory: Camera.Factory = Camera.Factory()
		private let notificationsFactory: Notifications.Factory = Notifications.Factory()
		private let profileFactory: Profile.Factory = Profile.Factory()
		
		private weak var cancelBag: CancelBag?

		private let availability: AvailabilityFacade = AvailabilityFacade()
		
		init(cancelBag: CancelBag) {
			self.cancelBag = cancelBag
		}
		
		public lazy var tabFactorys: [TabBarItemFactoryProtocol] = [
			homeFactory,
			exploreFactory,
			cameraFactory,
			notificationsFactory,
			profileFactory
		]
		
		public func makeMain() -> [UINavigationController] {
			makeTabControllers()
		}

		@ViewBuilder
		public func makeSwiftUIMain() -> some View {
			makeSwiftUITabCotrollers()
		}
	}
}

private extension Main.Factory {
	private func makeTabControllers() -> [UINavigationController] {
		tabFactorys
			.enumerated()
			.map { $1.makeTabBarNavItem(tag: $0) }
	}

	@ViewBuilder
	private func makeSwiftUITabCotrollers() -> some View {
		let tabs = tabFactorys.enumerated().map { $1.makeSwiftUITabView(tag: $0) }
		ForEach(tabs, id: \.id)
		{ $0 }
	}
}
