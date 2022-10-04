//
//  AuthService.swift
//  Instagram
//
//  Created by Kirill Titov on 30.09.2022.
//

import FirebaseAuth

final class AuthService {
	
	static let shared: AuthService = {
		let shared = AuthService()
		return shared
	}()

	// MARK: - propertis
	let auth = Auth.auth()
	
	// MARK: - init
	private init() {}

	public var isSignedIs: Bool {
		auth.currentUser != nil
	}

	public func signIn(
		email: String,
		password: String,
		completion: @escaping (Result<User, Error>) -> Void
	) {

	}

	public func signUp(
		email: String,
		password: String,
		avatar: Data?,
		completion: @escaping (Result<User, Error>) -> Void
	) {

	}

	public func signOut(
		email: String,
		password: String,
		completion: @escaping (Result<User, Error>) -> Void
	) {

	}
}
