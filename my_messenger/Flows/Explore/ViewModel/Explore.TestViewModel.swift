//
//  Explore.TestViewModel.swift
//  my_messenger
//
//  Created by Титов Кирилл Иванович on 08.11.2023.
//

import Foundation

protocol TestViewModelProtocol {
	var name: String { get set }
}

extension Explore {
	struct TestViewModel {
		let name: String

		init(name: String) {
			self.name = name
		}
	}
}
