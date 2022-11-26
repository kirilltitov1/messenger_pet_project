//
//  DatabaseService.swift
//  Instagram
//
//  Created by Kirill Titov on 30.09.2022.
//

import FirebaseFirestore

final class DatabaseService {
	
	static let shared: DatabaseService = {
		let shared = DatabaseService()
		return shared
	}()

	// MARK: - propertis
	let database = Firestore.firestore()
	
	// MARK: - init
	private init() {}
	
}
