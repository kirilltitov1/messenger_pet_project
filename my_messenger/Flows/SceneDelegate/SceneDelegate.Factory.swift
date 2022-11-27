//
//  SceneDelegate.Factory.swift
//  Instagram
//
//  Created by Титов Кирилл Иванович on 10.10.2022.
//

import Foundation

protocol SceneDelegateFactoryProtocol {
	func makeSignInCoordinator() -> SignIn.Coordinator
}

extension SceneDelegate {
	final class Factory: SceneDelegateFactoryProtocol {
		func makeSignInCoordinator() -> SignIn.Coordinator {
			let cancelBag = CancelBag()
			let factory = SignIn.Factory(cancelBag: cancelBag)
			let coordinator = SignIn.Coordinator(factory: factory, cancelBag: cancelBag)
			return coordinator
		}
	}
}
