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
	///   Create sign up controller
	/// - Parameter navigationController: root navigation controller
	/// - Returns: sign up view controller and view model for call back's
	func makeSignUpViewController(
	) -> (viewController: UIViewController, viewModel: (input: SignUp.ViewModel.Input, output: SignUp.ViewModel.Output))?
}

extension SignUp {
	/// Sign up Factory
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
		
		guard let cancelBag = cancelBag else { return nil }
		
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

// MARK: SwiftUI
extension SignIn.Factory {

}
