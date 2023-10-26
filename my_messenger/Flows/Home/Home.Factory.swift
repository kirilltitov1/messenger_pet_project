//
//  Home.Factory.swift
//  Instagram
//
//  Created by Kirill Titov on 12.10.2022.
//

import UIKit
import SwiftUI
import DesignSystem

protocol HomeFactoryProtocol {
	
}

extension Home {
	final class Factory: HomeFactoryProtocol, TabBarItemFactoryProtocol {
		var name: String {
			"Home"
		}
		
		var tabBarImageName: String {
			"house"
		}
	}
}

// MARK: - UIKit
extension Home.Factory {
	func makeTabBarNavItem(tag: Int) -> UINavigationController {
		let viewController = Home.ViewController()
		let navController = UINavigationController(rootViewController: viewController)
		navController.tabBarItem = UITabBarItem(
			title: name,
			image: UIImage(systemName: tabBarImageName),
			tag: tag
		)
		return navController
	}
}

// MARK: - SwiftUI
extension Home.Factory {
	func makeSwiftUITabView(tag: Int) -> TabScreenWrapper<AnyView> {
		TabScreenWrapper(
			Home.ViewScreen().eraseToAnyView(),
			tag: tag,
			title: name,
			imageName: tabBarImageName
		)
	}
}
