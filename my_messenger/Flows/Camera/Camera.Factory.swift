//
//  Camera.Factory.swift
//  Instagram
//
//  Created by Kirill Titov on 12.10.2022.
//

import UIKit
import SwiftUI
import DesignSystem

protocol CameraFactoryProtocol {
	
}

extension Camera {
	final class Factory: CameraFactoryProtocol, TabBarItemFactoryProtocol {
		var name: String {
			"Camera"
		}
		
		var tabBarImageName: String {
			"camera"
		}
	}
}

// MARK: - UIKit
extension Camera.Factory {
	func makeTabBarNavItem(tag: Int) -> UINavigationController {
		let viewController = Camera.ViewController()
		let navController = UINavigationController(rootViewController: viewController)
		navController.tabBarItem = UITabBarItem(title: name, image: UIImage(systemName: tabBarImageName), tag: tag)
		return navController
	}

}

// MARK: - SwiftUI
extension Camera.Factory {
	func makeSwiftUITabView(tag: Int) -> TabScreenWrapper<AnyView> {
		TabScreenWrapper(
			Camera.ViewScreen().eraseToAnyView(),
			tag: tag,
			title: name,
			imageName: tabBarImageName
		)
	}
}
