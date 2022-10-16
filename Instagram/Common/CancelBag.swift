//
//  CancelBag.swift
//  Instagram
//
//  Created by Kirill Titov on 12.10.2022.
//

import Combine

final class CancelBag {
	var subscriptions = Set<AnyCancellable>()
	
	func cancel() {
		subscriptions.forEach { $0.cancel() }
		subscriptions.removeAll()
	}
}

extension AnyCancellable {
	func store(in cancelBag: CancelBag) {
		cancelBag.subscriptions.insert(self)
	}
}
