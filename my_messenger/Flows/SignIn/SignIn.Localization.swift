//
//  SignIn.Localization.swift
//  Instagram
//
//  Created by Kirill Titov on 27.10.2022.
//

import Foundation

protocol SignInLocalizationProtocol {
	var emailFieldPlaceholder: String { get }
	var passwordFieldPlaceholder: String { get }
	var signIn: String { get }
	var signUp: String { get }
	var dividerText: String { get }
}

extension Localization {
	struct SignIn: SignInLocalizationProtocol {
		let emailFieldPlaceholder: String = "Email"~
		let passwordFieldPlaceholder: String = "Password"~
		let signIn: String = "Sign In"~
		let signUp: String = "Sign Up"~
		let dividerText: String = "or"~
	}
}
