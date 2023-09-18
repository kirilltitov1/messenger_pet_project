//
//  File.swift
//  
//
//  Created by Титов Кирилл Иванович on 11.10.2023.
//

import SwiftUI

extension AnyView: Identifiable {
	public var id: UUID {
		UUID()
	}
}

extension AnyView: Hashable {
	public func hash(into hasher: inout Hasher) {
		return hasher.combine(id)
	}

	public static func == (lhs: AnyView, rhs: AnyView) -> Bool {
		lhs.id == rhs.id
	}
}
