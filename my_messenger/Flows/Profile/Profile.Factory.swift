//
//  Profile.Factory.swift
//  Instagram
//
//  Created by Kirill Titov on 12.10.2022.
//

import UIKit
import SwiftUI
import DesignSystem

protocol ProfileFactoryProtocol {
	
}

extension Profile {
	final class Factory: ProfileFactoryProtocol, TabBarItemFactoryProtocol {
		var name: String {
			"Profile"
		}
		
		var tabBarImageName: String {
			"person"
		}
	}
}

// MARK: - UIKit
extension Profile.Factory {
	func makeTabBarNavItem(tag: Int) -> UINavigationController {
		let viewController = Profile.ViewController()
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
extension Profile.Factory {
	func makeSwiftUITabView(tag: Int) -> TabScreenWrapper<AnyView> {
		TabScreenWrapper(
			Profile.ViewScreen().eraseToAnyView(),
			tag: tag,
			title: name,
			imageName: tabBarImageName
		)
	}
}
