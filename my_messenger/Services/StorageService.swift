//
//  StorageService.swift
//  Instagram
//
//  Created by Kirill Titov on 30.09.2022.
//

import FirebaseStorage

final class StorageService {
	static let shared: StorageService = {
		let shared = StorageService()
		return shared
	}()

	private init() {}

	let database = Storage.storage()
}
