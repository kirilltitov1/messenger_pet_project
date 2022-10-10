//
//  SignIn.Coordinator.swift
//  Instagram
//
//  Created by Титов Кирилл Иванович on 09.10.2022.
//

import Foundation

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
extension SignIn.Coordinator: CoordinatorProtocol {
	func start(onFinish: @escaping (() -> Void)) {
		self.onFinish = onFinish

	}
}
