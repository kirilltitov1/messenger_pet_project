//
//  Explore.Factory.swift
//  Instagram
//
//  Created by Kirill Titov on 12.10.2022.
//

import UIKit
import SwiftUI
import DesignSystem

protocol ExploreFactoryProtocol {
	
}

extension Explore {
	final class Factory: ExploreFactoryProtocol, TabBarItemFactoryProtocol {

		var name: String {
			"Explore"
		}

		var tabBarImageName: String {
			"newspaper"
		}
	}
}

// MARK: - UIKit
extension Explore.Factory {
	func makeTabBarNavItem(tag: Int) -> UINavigationController {
		let viewController = Explore.ViewController()
		let navController = UINavigationController(rootViewController: viewController)
		navController.tabBarItem = UITabBarItem(title: name, image: UIImage(systemName: tabBarImageName), tag: tag)
		return navController
	}
}

// MARK: - SwiftUI
extension Explore.Factory {
	func makeSwiftUITabView(tag: Int) -> TabScreenWrapper<AnyView> {
		TabScreenWrapper(
			Explore.ViewScreen().eraseToAnyView(),
			tag: tag,
			title: name,
			imageName: tabBarImageName
		)
	}
}
