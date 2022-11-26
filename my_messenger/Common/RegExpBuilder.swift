//
//  RegExpBuilder.swift
//  Instagram
//
//  Created by Kirill Titov on 09.11.2022.
//

import Foundation

class RegExpBuilder {
	
	private var result: String = ""
	
	public func build() -> String {
		result
	}
	
	public func startAnchor() -> Self {
		result.append("^")
		return self
	}
	
	public func endAnchor() -> Self {
		result.append("$")
		return self
	}
	
	public func length(min: Int, max: Int = 0) -> Self {
		result.append(".{\(min),\((max != 0) ? "\(max)" : "")}")
		return self
	}
	
	public func digits(count: Int) -> Self {
		let numberPattern = #"0-9"#
		result.append(getEnsure(pattern: numberPattern, count: count))
		return self
	}
	
	public func specialCaseLetter(count: Int) -> Self {
		let specialCaseLetterPattern = #"@$#!%*?&"#
		result.append(getEnsure(pattern: specialCaseLetterPattern, count: count))
		return self
	}
	
	public func lowercaseLetters(count: Int) -> Self {
		let lowercaseLettersPattern = #"a-z"#
		result.append(getEnsure(pattern: lowercaseLettersPattern, count: count))
		return self
	}
	
	public func uppercaseLetters(count: Int) -> Self {
		let uppercaseLettersPattern = #"A-Z"#
		result.append(getEnsure(pattern: uppercaseLettersPattern, count: count))
		return self
	}
	
	private func getEnsure(pattern: String, count: Int) -> String {
		let startOfEnsure = "(?="
		let endOfEnsure = ")"
		var result: String = startOfEnsure
		for requirement in Array<String>(repeating: pattern, count: count) {
			result.append(".*[\(requirement)]")
		}
		result.append(endOfEnsure)
		return result
	}
}
