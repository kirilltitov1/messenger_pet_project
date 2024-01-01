//
//  AuthService.swift
//  Instagram
//
//  Created by Kirill Titov on 30.09.2022.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseAuthCombineSwift

protocol AuthServiceProtocol {

	var isSignedIs: Bool { get }

	func signIn(
		email: String,
		password: String
	) -> Future<AuthDataResult, Error>

	func signUp(
		email: String,
		username: String,
		password: String,
		avatar: Data?
	) -> Future<AuthDataResult, Error>

	func signOut(
		email: String,
		password: String
	)
}

final class AuthService {
	
	static let shared: AuthService = {
		let shared = AuthService()
		return shared
	}()

	// MARK: - propertis
	let auth = Auth.auth()

	// MARK: - private
	var cancelBag = Set<AnyCancellable>()
	
	// MARK: - init
	private init() {}

	public var isSigned: Bool {
		auth.currentUser != nil
	}

	public func signIn(
		email: String,
		password: String
	) -> Future<AuthDataResult, Error> {
		auth.signIn(withEmail: email, password: password)
	}
	
	public func signUp(
		email: String,
		password: String
	) -> Future<AuthDataResult, Error> {
		signUp(email: email, password: password, username: nil, avatar: nil)
	}

	public func signUp(
		email: String,
		password: String,
		username: String? = nil,
		avatar: Data? = nil
	) -> Future<AuthDataResult, Error> {
		auth.createUser(withEmail: email, password: password)
	}

	public func signOut(
		email: String,
		password: String
	) {
		do { try auth.signOut()
		} catch let error {
			print(error)
		}
	}
}
