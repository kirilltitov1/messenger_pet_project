//
//  SignIn.ViewModel.swift
//  Instagram
//
//  Created by Титов Кирилл Иванович on 10.10.2022.
//

import Foundation
import Combine

extension SignIn {
	final class ViewModel {
		private let signInService = AuthService.shared
	}
}

// MARK: ViewModelProtocol
extension SignIn.ViewModel: ViewModelProtocol {

	struct Input: SignInInputProtocol {
		let email: AnyPublisher<String, Never>
		let password: AnyPublisher<String, Never>
		let signIn: AnyPublisher<Void, Never>
	}
	
	final class Output: ObservableObject, SignInOutputProtocol {
		@Published var isSignIn: Bool = false
	}

	func transform(input: Input, cancelBag: CancelBag) -> Output {
		let output = Output()
		
		input.signIn
			.combineLatest(input.email, input.password)
			.map(\.1, \.2)
			.map(signInService.signIn)
			.map { $0.map(\.user) }
			.replaceEmpty(with: nil)
			.map { $0 != nil }
			.assign(to: \.isSignIn, on: output)
			.store(in: cancelBag)
		
		return output
	}
}

// MARK: ObservableObject
extension SignIn.ViewModel: ObservableObject {}
