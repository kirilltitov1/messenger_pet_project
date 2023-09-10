//
//  Main.Coordinator.swift
//  my_messenger
//
//  Created by Kirill Titov on 09.12.2022.
//

import UIKit
import Combine

protocol MainCoordinatorProtocol {
	/// start main tab bar
	/// - Parameter navigationController: root navigation controller
	/// - Returns: call back's
	@discardableResult
	func start(
		navigationController: UINavigationController
	) -> (AnyPublisher<Void, Never>)?
}

extension Main {
	/// SignIn Coordinator
	final class Coordinator {
		private var onFinish: (() -> Void)?
		private let factory: MainFactoryProtocol
		private let cancelBag: CancelBag

		init(
			factory: MainFactoryProtocol,
			cancelBag: CancelBag
		) {
			self.cancelBag = cancelBag
			self.factory = factory
		}
	}
}

// MARK: CoordinatorProtocol
extension Main.Coordinator: MainCoordinatorProtocol {
	func start(
		navigationController: UINavigationController
	) -> (AnyPublisher<Void, Never>)? {
		let tabs = factory.makeMain()
		let tabbarnavigationcontroller = UITabBarController()
//		tabbarnavigationcontroller.setViewControllers(<#T##viewControllers: [UIViewController]?##[UIViewController]?#>, animated: <#T##Bool#>)
//		navigationController.setViewControllers(tabs, animated: true)
//		navigationController.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
		//FIXME: - add callback if need it
		return nil
	}
}
