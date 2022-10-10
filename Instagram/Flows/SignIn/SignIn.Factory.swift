//
//  SignIn.Factory.swift
//  Instagram
//
//  Created by Титов Кирилл Иванович on 09.10.2022.
//

import Foundation
import UIKit

/// Protocol for sign in factory
protocol SignInFactoryProtocol {
	/// make sign in view controller
	func makeSignInViewController() -> UIViewController
}

extension SignIn {
	/// Namespace sign in Factory
	final class Factory {}
}

// MARK: SignInFactoryProtocol
extension SignIn.Factory: SignInFactoryProtocol {
	func makeSignInViewController(
	) -> UIViewController {
		// TODO: разобраться а нужно ли мне все такие дженерики юзать тут
		SignIn.ViewController<SignIn.ViewModel>(viewModel: SignIn.ViewModel())
	}
}
