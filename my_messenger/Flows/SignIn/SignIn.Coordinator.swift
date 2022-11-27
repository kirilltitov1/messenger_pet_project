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
	) {
		
		let (screen, viewModel) = factory.makeSignInViewController()
		
		navigationController.pushViewController(screen, animated: true)
		
		viewModel.input.signUp
			.sink { _ in
				
			}.store(in: cancelBag)
	}
}
