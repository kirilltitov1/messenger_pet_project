//
//  Camera.Factory.swift
//  Instagram
//
//  Created by Kirill Titov on 12.10.2022.
//

import UIKit

protocol CameraFactoryProtocol {
	
}

extension Camera {
	final class Factory: CameraFactoryProtocol, TabBarItemFactoryProtocol {
		var name: String? {
			"Camera"
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
