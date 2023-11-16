//
//  Explore.TestViewModel.swift
//  my_messenger
//
//  Created by Титов Кирилл Иванович on 08.11.2023.
//

import Foundation

extension Explore {
	struct AnimalViewModel: Hashable, Identifiable {

		static func == (lhs: Self, rhs: Self) -> Bool {
			lhs.id == rhs.id
		}

		var id: UUID = UUID()
		
		let name: String

		init(name: String) {
			self.name = name
		}
	}
}
