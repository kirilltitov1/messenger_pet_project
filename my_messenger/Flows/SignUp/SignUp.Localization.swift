//
//  SignUp.Localization.swift
//  my_messenger
//
//  Created by Kirill Titov on 01.12.2022.
//

import Foundation

protocol SignUpLocalizationProtocol {
	var emailFieldPlaceholder: String { get }
	var passwordFieldPlaceholder: String { get }
	var signIn: String { get }
	var signUp: String { get }
	var dividerText: String { get }
}

extension Localization {
	struct SignUp: SignUpLocalizationProtocol {
		let emailFieldPlaceholder: String = "Email"~
		let passwordFieldPlaceholder: String = "Password"~
		let signIn: String = "Sign In"~
		let signUp: String = "Sign Up"~
		let dividerText: String = "or"~
	}
}
