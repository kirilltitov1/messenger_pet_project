//
//  ApplicationCoordinator.swift
//  my_messenger
//
//  Created by Kirill Titov on 28.11.2022.
//

import UIKit
import Combine

final class ApplicationCoordinator {
	
	private init() {}
	
	static let shared: ApplicationCoordinator = ApplicationCoordinator()
	
	private let cancelBag: CancelBag = CancelBag()
	
	var signInCoordinator: SignIn.Coordinator?
	
	public func start(navigationController: UINavigationController) {
		if AuthService.shared.isSigned {
			//TODO: tab bar
//			let tabBarFactory: TabBar.Factory = TabBar.Factory()
//			TabBar.Controller(factory: tabBarFactory)
		} else {
			startSignIn(navigationController: navigationController)
		}
	}
	
	private func startSignIn(navigationController: UINavigationController) {
		let cancelBag = CancelBag()
		let factory = SignIn.Factory(cancelBag: cancelBag)
		signInCoordinator = SignIn.Coordinator(factory: factory, cancelBag: cancelBag)
		
		let callBack = signInCoordinator?.start(navigationController: navigationController)
		
		callBack?.signedIn.sink { _ in
			//TODO: signed in
		}.store(in: cancelBag)
		
		callBack?.signedUp.sink { _ in
			//TODO: sign up
		}.store(in: cancelBag)
	}
}
