//
//  Notifications.Factory.swift
//  Instagram
//
//  Created by Kirill Titov on 12.10.2022.
//

import UIKit

protocol NotificationsFactoryProtocol {
	
}

extension Notifications {
	final class Factory: NotificationsFactoryProtocol, TabBarItemFactoryProtocol {
		var name: String? {
			"Notifications"
		}
		
		var tabBarImage: UIImage? {
			UIImage()
		}
		
		func makeTabBarNavItem(tag: Int) -> UINavigationController {
			let viewController = ViewController()
			let navController = UINavigationController(rootViewController: viewController)
			navController.tabBarItem = UITabBarItem(title: name, image: tabBarImage, tag: tag)
			return navController
		}
	}
}
