//
//  UITextField-publisher.swift
//  Instagram
//
//  Created by Kirill Titov on 13.11.2022.
//

import Combine
import UIKit

extension UITextField {
	var textPublisher: AnyPublisher<String, Never> {
		self.publisher(for: .editingChanged)
			.map { [weak self] _ in self?.text }
			.replaceNil(with: "")
			.eraseToAnyPublisher()
	}
}
