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
	) -> (viewController: UIViewController, viewModel: (input: SignIn.ViewModel.Input, output: SignIn.ViewModel.Output))
}

extension SignIn {
	/// Namespace sign in Factory
	final class Factory {
		private let cancelBag: CancelBag
		init(cancelBag: CancelBag) {
			self.cancelBag = cancelBag
		}
	}
}

// MARK: SignInFactoryProtocol
extension SignIn.Factory: SignInFactoryProtocol {
	func makeSignInViewController(
	) -> (viewController: UIViewController, viewModel: (input: SignIn.ViewModel.Input, output: SignIn.ViewModel.Output)) {
		
		let input = SignIn.ViewModel.Input()
		let viewModel = SignIn.ViewModel()
		
		let localization: Localization.SignIn = Localization.SignIn()
		
		let output = viewModel.transform(
			input: input,
			cancelBag: cancelBag
		)
		let viewController = SignIn.ViewController(
			input: input,
			output: output,
			cancelBag: cancelBag,
			localization: localization
		)

		return (viewController, (input, output))
	}
}
