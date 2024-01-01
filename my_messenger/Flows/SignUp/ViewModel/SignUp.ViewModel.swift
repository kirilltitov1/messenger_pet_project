//
//  SignUp.ViewModel.swift
//  my_messenger
//
//  Created by Kirill Titov on 03.12.2022.
//

import Foundation
import Combine
import UIKit

extension SignUp {
	final class ViewModel {
		private let authService = AuthService.shared
	}
}

// MARK: ViewModelProtocol
extension SignUp.ViewModel: ViewModelProtocol {
	
	/// State of sign in view
	enum State: Equatable {
		/// user edit his data
		case idle
		/// user press "signIn" button
		case signingUp
		/// user signed in successfully
		case signedUp
		/// sign in fail
		case failure
	}

	final class Input {
		@Published var email: String = ""
		@Published var password: String = ""
		let signUp: PassthroughSubject<UIControl, Never> = .init()
		let signIn: PassthroughSubject<UIControl, Never> = .init()
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
		
		input.signUp
			.map { _ in .signingUp }
			.assign(to: \.state, on: output)
			.store(in: cancelBag)
		
		input.signUp
			.delay(for: .milliseconds(1300), scheduler: DispatchQueue.main)
			.combineLatest(input.$email, input.$password)
			.map(\.1, \.2)
			.map(authService.signUp)
			.map { $0.map(\.user) }
			.replaceEmpty(with: nil)
			.map { $0 == nil ? .failure : .signedUp }
			.assign(to: \.state, on: output)
			.store(in: cancelBag)
		
		input.$email.map { $0.isEmailValid }
			.removeDuplicates()
			.assign(to: \.isEmailValid, on: output)
			.store(in: cancelBag)
		
		input.$password.map { $0.isPasswordValid }
			.removeDuplicates()
			.assign(to: \.isPasswordValid, on: output)
			.store(in: cancelBag)
		
		return output
	}
}

// MARK: ObservableObject
extension SignUp.ViewModel: ObservableObject {}

