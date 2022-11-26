//
//  SignIn.Factory.swift
//  Instagram
//
//  Created by Титов Кирилл Иванович on 09.10.2022.
//

import Foundation
import Combine
import UIKit

/// Protocol for sign in factory
protocol SignInFactoryProtocol {
	/// make sign in view controller
	/// - Parameter cancelBag: inject, if u need to hold sub's out of view controller life cycle;
	/// 				  	   cancel bag for sub's on view model & view controller
	/// - Returns: sign in view controller
	func makeSignInViewController(
	) -> UIViewController
}

extension SignIn {
	/// Namespace sign in Factory
	final class Factory {}
}

// MARK: SignInFactoryProtocol
extension SignIn.Factory: SignInFactoryProtocol {
	func makeSignInViewController(
	) -> UIViewController {
		let cancelBag = CancelBag()
		let input = SignIn.ViewModel.Input()
		let viewModel = SignIn.ViewModel()
		let output = viewModel.transform(
			input: input,
			cancelBag: cancelBag
		)
		let viewController = SignIn.ViewController(
			input: input,
			output: output,
			cancelBag: cancelBag
		)

		return viewController
	}
}
