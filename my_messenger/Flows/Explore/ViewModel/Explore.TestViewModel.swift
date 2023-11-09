//
//  Explore.TestViewModel.swift
//  my_messenger
//
//  Created by Титов Кирилл Иванович on 08.11.2023.
//

import Foundation

//protocol TestViewModelProtocol {
//	var name: String { get set }
//}

extension Explore {
	struct TestViewModel: Hashable, Identifiable {
		var id: UUID = UUID()
		
		let name: String

		init(name: String) {
			self.name = name
		}
	}
}
