//
//  SignUp.Coordinator.swift
//  my_messenger
//
//  Created by Kirill Titov on 01.12.2022.
//

import UIKit
import Combine

protocol SignUpCoordinatorProtocol {
	/// Present modal screen
	/// - Parameter navigationController: current navigation controller
	/// - Returns: call back's
	func start(
		navigationController: UINavigationController
	) -> (signedUp: AnyPublisher<Void, Never>, signIn: AnyPublisher<Void, Never>)?
}

extension SignUp {
	/// SignUp Coordinator
	final class Coordinator {
		private var onFinish: (() -> Void)?
		private let factory: SignUpFactoryProtocol
		private weak var cancelBag: CancelBag?

		init(
			factory: SignUpFactoryProtocol,
			cancelBag: CancelBag
		) {
			self.cancelBag = cancelBag
			self.factory = factory
		}
	}
}

// MARK: CoordinatorProtocol
extension SignUp.Coordinator: SignUpCoordinatorProtocol {
	func start(
		navigationController: UINavigationController
	) -> (signedUp: AnyPublisher<Void, Never>, signIn: AnyPublisher<Void, Never>)? {
		guard let (screen, viewModel) = factory.makeSignUpViewController() else { return nil }
		
		navigationController.present(screen, animated: true)
		
		let signedUpPublisher: AnyPublisher<Void, Never> = viewModel.output
			.$state
			.filter { $0 == .signedUp }
			.erasedToVoid()
			.eraseToAnyPublisher()
		let signInPublisher: AnyPublisher<Void, Never> = viewModel.input
			.signIn
			.erasedToVoid()
			.eraseToAnyPublisher()
		
		return (signedUpPublisher, signInPublisher)
	}
}
