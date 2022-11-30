//
//  Publisher+Extentions.swift
//  my_messenger
//
//  Created by Kirill Titov on 30.11.2022.
//

import Combine

extension Publisher {
	public func erasedToVoid() -> Publishers.Map<Self, Void> {
		self.map { _ in () }
	}
}
