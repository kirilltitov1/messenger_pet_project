//
//  TabBar.Factory.swift
//  Instagram
//
//  Created by Kirill Titov on 12.10.2022.
//

import Foundation
import UIKit

/// tab bar item
protocol TabBarItemFactoryProtocol {
	var name: String? { get }
	var tabBarImage: UIImage? { get }
	func makeTabBarNavItem(tag: Int) -> UINavigationController
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
		
		init(cancelBag: CancelBag) {
			self.cancelBag = cancelBag
		}
		
		private lazy var tabFactorys: [TabBarItemFactoryProtocol] = [
			homeFactory,
			exploreFactory,
			cameraFactory,
			notificationsFactory,
			profileFactory
		]
		
		public func makeMain() -> [UINavigationController] {
			makeTabControllers()
		}
	}
}

private extension Main.Factory {
	private func makeTabControllers() -> [UINavigationController] {
		let tabs = tabFactorys
			.enumerated()
			.map { $1.makeTabBarNavItem(tag: $0) }
		return tabs
	}
}
