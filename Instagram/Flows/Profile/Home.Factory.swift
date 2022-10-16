//
//  Home.Factory.swift
//  Instagram
//
//  Created by Kirill Titov on 12.10.2022.
//

import UIKit

protocol HomeFactoryProtocol {
	
}

extension Home {
	final class Factory: HomeFactoryProtocol, TabBarItemFactoryProtocol {
		var name: String? {
			"Home"
		}
		
		var tabBarImage: UIImage? {
			UIImage(systemName: "house")
		}
		
		func makeTabBarNavItem(tag: Int) -> UINavigationController {
			let viewController = ViewController()
			let navController = UINavigationController(rootViewController: viewController)
			navController.tabBarItem = UITabBarItem(title: name, image: tabBarImage, tag: tag)
			return navController
		}
	}
}
