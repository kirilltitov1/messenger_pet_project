//
//  TabBar.Factory.swift
//  Instagram
//
//  Created by Kirill Titov on 12.10.2022.
//

import Foundation
import UIKit

protocol TabBarItemFactoryProtocol {
	var name: String? { get }
	var tabBarImage: UIImage? { get }
	func makeTabBarNavItem(tag: Int) -> UINavigationController
}

extension Main {
	final class Factory {
		
		private let homeFactory: Home.Factory = Home.Factory()
		private let exploreFactory: Explore.Factory = Explore.Factory()
		private let cameraFactory: Camera.Factory = Camera.Factory()
		private let notificationsFactory: Notifications.Factory = Notifications.Factory()
		private let profileFactory: Profile.Factory = Profile.Factory()
		
		init() {}
		
		private lazy var tabFactorys: [TabBarItemFactoryProtocol] = [
			homeFactory,
			exploreFactory,
			cameraFactory,
			notificationsFactory,
			profileFactory
		]
		
		func makeTabControllers()
		-> [UINavigationController] {
			let tabs = tabFactorys
				.enumerated()
				.map { $1.makeTabBarNavItem(tag: $0) }
			
			return tabs
		}
	}
}

extension Main.Factory {
}
