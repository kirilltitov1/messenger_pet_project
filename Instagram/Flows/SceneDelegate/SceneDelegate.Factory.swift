//
//  SceneDelegate.Factory.swift
//  Instagram
//
//  Created by Титов Кирилл Иванович on 10.10.2022.
//

import Foundation

protocol SceneDelegateFactoryProtocol {
	func makeSignInFactory() -> SignIn.Factory
}

extension SceneDelegate {
	final class Factory: SceneDelegateFactoryProtocol {
		func makeSignInFactory() -> SignIn.Factory {
			SignIn.Factory()
		}
	}
}
