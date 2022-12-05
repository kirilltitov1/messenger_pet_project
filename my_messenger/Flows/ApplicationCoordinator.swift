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
	var signUpCoordinator: SignUp.Coordinator?
//	var tabBarCoordinator: TabBar.
	
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
		
		callBack?.signedIn
			.print("signInCoordinator: signIn")
			.sink { [unowned self] in
				signInCoordinator = nil
				startMain()
			}.store(in: cancelBag)
		
		callBack?.signUp
			.print("signInCoordinator: signedUp")
			.sink { [unowned self] in
				signInCoordinator = nil
				startSignUp(navigationController: navigationController)
			}.store(in: cancelBag)
	}
	
	private func startSignUp(navigationController: UINavigationController) {
		let cancelBag = CancelBag()
		let factory = SignUp.Factory(cancelBag: cancelBag)
		signUpCoordinator = SignUp.Coordinator(factory: factory, cancelBag: cancelBag)
		
		let callBack = signUpCoordinator?.start(navigationController: navigationController)
		
		callBack?.signedUp
			.print("signUpCoordinator: signUp")
			.sink { [unowned self] in
				signUpCoordinator = nil
				startMain()
		}.store(in: cancelBag)
		
		callBack?.signIn
			.print("signUpCoordinator: signedIn")
			.sink { [unowned self] in
			signUpCoordinator = nil
			startSignIn(navigationController: navigationController)
		}.store(in: cancelBag)
	}
	
	private func startMain() {
		print("")
	}
}
