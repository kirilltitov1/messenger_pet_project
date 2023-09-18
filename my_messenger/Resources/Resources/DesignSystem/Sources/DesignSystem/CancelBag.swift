//
//  File.swift
//  
//
//  Created by Титов Кирилл Иванович on 04.10.2023.
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
