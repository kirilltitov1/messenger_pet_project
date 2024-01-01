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
	) -> (signedIn: AnyPublisher<Void, Never>, signUp: AnyPublisher<Void, Never>)?

	func startSwiftUI()
}

extension SignIn {
	/// SignIn Coordinator
	final class Coordinator {
		private var onFinish: (() -> Void)?
		private let factory: SignInFactoryProtocol
		private weak var cancelBag: CancelBag?

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
extension SignIn.Coordinator: SignInCoordinatorProtocol {
	func startSwiftUI() {
		
	}

	func start(
		navigationController: UINavigationController
	) -> (signedIn: AnyPublisher<Void, Never>, signUp: AnyPublisher<Void, Never>)? {
		guard let (screen, viewModel) = factory.makeSignInViewController() else { return nil }
		
		navigationController.setViewControllers([screen], animated: true)
		
		let signedInPublisher: AnyPublisher<Void, Never> = viewModel.output
			.$state
			.filter { $0 == .signedIn }
			.erasedToVoid()
			.eraseToAnyPublisher()
		let signUpPublisher: AnyPublisher<Void, Never> = viewModel.output
			.$state
			.filter { $0 == .action(.signUp) }
			.erasedToVoid()
			.eraseToAnyPublisher()

		return (signedInPublisher, signUpPublisher)
	}
}
