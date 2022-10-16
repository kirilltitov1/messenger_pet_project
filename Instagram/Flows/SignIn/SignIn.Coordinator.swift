//
//  SignIn.Coordinator.swift
//  Instagram
//
//  Created by Титов Кирилл Иванович on 09.10.2022.
//

import UIKit

protocol SignInCoordinatorProtocol {
	func start(
		navigationController: UINavigationController,
		onFinish: @escaping (() -> Void)
	)
}

extension SignIn {
	/// SignIn Coordinator
	final class Coordinator {
		private var onFinish: (() -> Void)?
		private let factory: SignInFactoryProtocol

		init(
			factory: SignInFactoryProtocol
		) {
			self.factory = factory
		}
	}
}

// MARK: CoordinatorProtocol
extension SignIn.Coordinator {
	func start(
		navigationController: UINavigationController,
		onFinish: @escaping (() -> Void)
	) {
		self.onFinish = onFinish
		let screen = factory.makeSignInViewController()
		
	}
}
