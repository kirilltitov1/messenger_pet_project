//
//  TabBarController.swift
//  Instagram
//
//  Created by Kirill Titov on 12.10.2022.
//

import UIKit

extension Main {
	/// Tab bar controller for main screen
	final class Controller: UITabBarController {
		
		let factory: Main.Factory
		let tabBarItems: [UINavigationController]
		
		init(
			factory: Main.Factory
		) {
			self.factory = factory
			tabBarItems = factory.makeMain()
			
			super.init(nibName: nil, bundle: nil)
		}
		
		required init?(coder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
		}
	}
}

// MARK: UITabBarController
extension Main.Controller {
	override func viewDidLoad() {
		super.viewDidLoad()
		setTabBarItems()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
	}
}

private extension Main.Controller {
	func setTabBarItems() {
		setViewControllers(tabBarItems, animated: false)
	}
}
