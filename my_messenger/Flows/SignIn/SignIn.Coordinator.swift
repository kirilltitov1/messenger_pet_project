//
//  SignIn.Coordinator.swift
//  Instagram
//
//  Created by Титов Кирилл Иванович on 09.10.2022.
//

import UIKit
import Combine

protocol SignInCoordinatorProtocol {
	func start(
		navigationController: UINavigationController
	)
}

extension SignIn {
	/// SignIn Coordinator
	final class Coordinator {
		private var onFinish: (() -> Void)?
		private let factory: SignInFactoryProtocol
		private let cancelBag: CancelBag

		init(
			factory: SignInFactoryProtocol,
			cancelBag: CancelBag
		) {
			self.cancelBag = cancelBag
			self.factory = factory
		}
	}
}

// MARK: CoordinatorProtocol
extension SignIn.Coordinator {
	func start(
		navigationController: UINavigationController
	) -> (signedIn: AnyPublisher<Void, Never>, signedUp: AnyPublisher<Void, Never>) {
		let (screen, viewModel) = factory.makeSignInViewController()
		
		navigationController.setViewControllers([screen], animated: true)
		
		let signedInPublisher: AnyPublisher<Void, Never> = viewModel.output.$state.first { $0 == .signedIn }.erasedToVoid().eraseToAnyPublisher()
		let signedUpPublisher: AnyPublisher<Void, Never> = viewModel.input.signUp.erasedToVoid().eraseToAnyPublisher()
		
		return (signedInPublisher, signedUpPublisher)
	}
}
