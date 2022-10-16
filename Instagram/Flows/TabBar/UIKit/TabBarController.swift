//
//  TabBarController.swift
//  Instagram
//
//  Created by Kirill Titov on 12.10.2022.
//

import UIKit

extension TabBar {
	final class Controller: UITabBarController {
		
		let factory: TabBar.Factory
		let tabBarItems: [UINavigationController]
		
		init(
			factory: TabBar.Factory
		) {
			self.factory = factory
			tabBarItems = factory.makeTabControllers()
			
			super.init(nibName: nil, bundle: nil)
		}
		
		required init?(coder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
		}
	}
}

// MARK: UITabBarController
extension TabBar.Controller {
	override func viewDidLoad() {
		super.viewDidLoad()
		setTabBarItems()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
	}
}

private extension TabBar.Controller {
	func setTabBarItems() {
		setViewControllers(tabBarItems, animated: false)
	}
}
