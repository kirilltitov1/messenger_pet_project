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
		let signInService = AuthService.shared

		var cancelBag = Set<AnyCancellable>()
	}
}

// MARK: ViewModelProtocol
extension SignIn.ViewModel: ViewModelProtocol {

	struct Input {
		let email: AnyPublisher<String, Never>
		let password: AnyPublisher<String, Never>
		let signIn: AnyPublisher<Void, Never>
	}

	typealias Output = AnyPublisher<SignInState, Never>

	enum SignInState {
		case idle
		case success
		case error(Error)
	}

	func transform(input: Input) -> Output {

		input.$signIn
			.de
			.sink(receiveValue: { _ in
				signInService.signIn(email: input.&email, password: input.password)
			})
			.store(in: &cancelBag)

		return Publishers.Merge
	}
}

extension SignIn.ViewModel: ObservableObject {}
