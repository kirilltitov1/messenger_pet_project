//
//  EmailValidator.swift
//  Instagram
//
//  Created by Kirill Titov on 09.11.2022.
//

import Foundation

extension String {
	var isPasswordValid: Bool {
		let regExp = RegExpBuilder()
			.startAnchor()
			.lowercaseLetters(count: 1)
			.specialCaseLetter(count: 1)
			.uppercaseLetters(count: 2)
			.digits(count: 1)
			.length(min: 6)
			.endAnchor()
			.build()
		
		let predicate = NSPredicate(format: "SELF MATCHES %@", regExp)
		
		return predicate.evaluate(with: self)
	}
	
	var isPhoneNumberValid: Bool {
		let phonePattern = #"^\(?\d{3}\)?[ -]?\d{3}[ -]?\d{4}$"#
		return self.range(
			of: phonePattern,
			options: .regularExpression
		) != nil
	}
	
	var isEmailValid: Bool {
		let emailPattern = #"^\S+@\S+\.\S+$"#
		return self.range(
			of: emailPattern,
			options: .regularExpression
		) != nil
	}
}
