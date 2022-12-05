//
//  SignUp.Factory.swift
//  my_messenger
//
//  Created by Kirill Titov on 01.12.2022.
//

import Foundation
import Combine
import UIKit

/// Protocol for sign up factory
protocol SignUpFactoryProtocol {
	/// make sign in view controller
	/// - Parameter cancelBag: inject, if u need to hold sub's out of view controller life cycle;
	/// 				  	   cancel bag for sub's on view model & view controller
	/// - Returns: sign up view controller
	func makeSignUpViewController(
	) -> (viewController: UIViewController, viewModel: (input: SignUp.ViewModel.Input, output: SignUp.ViewModel.Output))?
}

extension SignUp {
	/// Namespace sign in Factory
	final class Factory {
		private weak var cancelBag: CancelBag?
		init(cancelBag: CancelBag) {
			self.cancelBag = cancelBag
		}
	}
}

// MARK: SignUpFactoryProtocol
extension SignUp.Factory: SignUpFactoryProtocol {
	func makeSignUpViewController(
	) -> (viewController: UIViewController, viewModel: (input: SignUp.ViewModel.Input, output: SignUp.ViewModel.Output))? {
		
		let cancelBag: CancelBag = CancelBag()
		
		let input = SignUp.ViewModel.Input()
		let viewModel = SignUp.ViewModel()
		
		let localization: SignUpLocalizationProtocol = Localization.SignUp()
		
		let output = viewModel.transform(
			input: input,
			cancelBag: cancelBag
		)
		let viewController = SignUp.ViewController(
			input: input,
			output: output,
			cancelBag: cancelBag,
			localization: localization
		)

		return (viewController, (input, output))
	}
}
