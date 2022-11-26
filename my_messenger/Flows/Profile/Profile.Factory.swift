//
//  Profile.Factory.swift
//  Instagram
//
//  Created by Kirill Titov on 12.10.2022.
//

import UIKit

protocol ProfileFactoryProtocol {
	
}

extension Profile {
	final class Factory: ProfileFactoryProtocol, TabBarItemFactoryProtocol {
		var name: String? {
			"Profile"
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
