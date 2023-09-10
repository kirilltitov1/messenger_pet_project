//
//  Notifications.Factory.swift
//  Instagram
//
//  Created by Kirill Titov on 12.10.2022.
//

import UIKit
import SwiftUI
import DesignSystem
import Combine

protocol NotificationsFactoryProtocol {
	func makeTabBarNavItem(tag: Int) -> UINavigationController
	func makeSwiftUITabView(tag: Int) -> AnyView
	func makeSwiftUIView() -> AnyView
}

extension Notifications {
	final class Factory: NotificationsFactoryProtocol, TabBarItemFactoryProtocol {

		var name: String {
			"Notifications"
		}
		
		var tabBarImageName: String {
			"bell"
		}

		func makeSwiftUIView() -> AnyView {
			let cancelBag = CancelBag()

			let input = ViewModel.Input()
			let viewModel = ViewModel()

			let output = viewModel.transform(input: input, cancelBag: cancelBag)

			return ViewScreen(input: input, output: output).eraseToAnyView()
		}
	}
}



// MARK: - UIKit
extension Notifications.Factory {
	func makeTabBarNavItem(tag: Int) -> UINavigationController {
		let viewController = Notifications.ViewController()
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
extension Notifications.Factory {
	func makeSwiftUITabView(tag: Int) -> AnyView {
		makeSwiftUIView()
			.tag(tag)
			.tabItem {
				TabItem(title: name, imageName: tabBarImageName)
			}.eraseToAnyView()
	}
}
