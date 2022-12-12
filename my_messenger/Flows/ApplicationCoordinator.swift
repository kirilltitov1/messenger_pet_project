//
//  ApplicationCoordinator.swift
//  my_messenger
//
//  Created by Kirill Titov on 28.11.2022.
//

import UIKit
import Combine

final class ApplicationCoordinator {
	
	static let shared: ApplicationCoordinator = ApplicationCoordinator()
	
	private let cancelBag: CancelBag = CancelBag()
	
	var signInCoordinator: SignInCoordinatorProtocol?
	var signUpCoordinator: SignUpCoordinatorProtocol?
	var mainCoordinator: MainCoordinatorProtocol?
	
	private let authService: AuthService = AuthService.shared
	
	public func start(navigationController: UINavigationController) {
		if AuthService.shared.isSigned {
			//TODO: tab bar
//			let mainFactory: MainCoordinatorProtocol = Main.Factory()
//			TabBar.Controller(factory: tabBarFactory)
		} else {
			startSignIn(navigationController: navigationController)
		}
	}
	
	public func startSignIn(navigationController: UINavigationController) {
		let cancelBag = CancelBag()
		let factory = SignIn.Factory(cancelBag: cancelBag)
		signInCoordinator = SignIn.Coordinator(factory: factory, cancelBag: cancelBag)
		
		let callBack = signInCoordinator?.start(navigationController: navigationController)
		
		callBack?.signedIn
			.print("signInCoordinator: signedIn")
			.sink { [unowned self] in
				signInCoordinator = nil
				startMain(navigationController: navigationController)
			}.store(in: cancelBag)
		
		callBack?.signUp
			.print("signInCoordinator: signUp")
			.sink { [unowned self] in
				startSignUp(navigationController: navigationController)
			}.store(in: cancelBag)
	}
	
	public func startSignUp(navigationController: UINavigationController) {
		let cancelBag = CancelBag()
		let factory = SignUp.Factory(cancelBag: cancelBag)
		signUpCoordinator = SignUp.Coordinator(factory: factory, cancelBag: cancelBag)
		
		let callBack = signUpCoordinator?.start(navigationController: navigationController)
		
		callBack?.signedUp
			.print("signUpCoordinator: signUp")
			.sink { [unowned self] in
				signUpCoordinator = nil
				startSignIn(navigationController: navigationController)
			}.store(in: cancelBag)
		
		callBack?.signIn
			.print("signUpCoordinator: signedIn")
			.sink { [unowned self] in
				signUpCoordinator = nil
				navigationController.dismiss(animated: true)
			}.store(in: cancelBag)
	}
	
	public func startMain(navigationController: UINavigationController) {
		let cancelBag = CancelBag()
		let factory = Main.Factory(cancelBag: cancelBag)
		mainCoordinator = Main.Coordinator(factory: factory, cancelBag: cancelBag)
		
		mainCoordinator?.start(navigationController: navigationController)
	}
}
