//
//  SignIn.ViewModel.swift
//  Instagram
//
//  Created by Титов Кирилл Иванович on 10.10.2022.
//

import Foundation
import Combine
import UIKit

extension SignIn {
	final class ViewModel {
		private let signInService = AuthService.shared
	}
}

// MARK: ViewModelProtocol
extension SignIn.ViewModel: ViewModelProtocol {
	
	/// State of sign in view
	enum State: Equatable {
		/// user edit his data
		case idle
		/// user press "signIn" button
		case signingIn
		/// user signed in successfully
		case signedIn
		/// sign in fail
		case failure
	}

	final class Input {
		@Published var email: String = ""
		@Published var password: String = ""
		let signIn: PassthroughSubject<UIControl, Never> = .init()
		let signUp: PassthroughSubject<UIControl, Never> = .init()
	}
	
	final class Output: ObservableObject {
		@Published var isEmailValid: Bool = false
		@Published var isPasswordValid: Bool = false
		
		@Published var state: State = .idle
	}

	func transform(
		input: Input,
		cancelBag: CancelBag
	) -> Output {
		let output = Output()
		
		input.signIn
			.map { _ in .signingIn }
			.assign(to: \.state, on: output)
			.store(in: cancelBag)
		
		input.signIn
			.delay(for: .milliseconds(1300), scheduler: DispatchQueue.main)
			.combineLatest(input.$email, input.$password)
			.map(\.1, \.2)
			.map(signInService.signIn)
			.map { $0.map(\.user) }
			.replaceEmpty(with: nil)
			.map { $0 == nil ? .failure : .signedIn }
			.assign(to: \.state, on: output)
			.store(in: cancelBag)
		
		input.$email.map { $0.isEmailValid }
			.assign(to: \.isEmailValid, on: output)
			.store(in: cancelBag)
		
		input.$password.map { $0.isPasswordValid }
			.assign(to: \.isPasswordValid, on: output)
			.store(in: cancelBag)
		
		return output
	}
}

// MARK: ObservableObject
extension SignIn.ViewModel: ObservableObject {}
