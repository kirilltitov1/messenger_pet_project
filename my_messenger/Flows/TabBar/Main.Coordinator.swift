//
//  Main.Coordinator.swift
//  my_messenger
//
//  Created by Kirill Titov on 09.12.2022.
//

import UIKit
import Combine

protocol MainCoordinatorProtocol {
	func start(
		navigationController: UINavigationController
	) -> (signedIn: AnyPublisher<Void, Never>, signUp: AnyPublisher<Void, Never>)?
}

extension Main {
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
extension Main.Coordinator: MainCoordinatorProtocol {
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
		let signUpPublisher: AnyPublisher<Void, Never> = viewModel.input
			.signUp
			.erasedToVoid()
			.eraseToAnyPublisher()
		
		return (signedInPublisher, signUpPublisher)
	}
}

