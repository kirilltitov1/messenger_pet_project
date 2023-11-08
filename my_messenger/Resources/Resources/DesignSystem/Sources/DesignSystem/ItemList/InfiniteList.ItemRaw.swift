//
//  InfiniteList.ItemRaw.swift
//  
//
//  Created by Титов Кирилл Иванович on 06.10.2023.
//

import SwiftUI

extension InfiniteList {
	public struct ItemRaw: Identifiable, Hashable {
		public let id = UUID()

		public func hash(into hasher: inout Hasher) {
			hasher.combine(id)
		}

		public static func == (
			lhs: Self,
			rhs: Self
		) -> Bool {
			lhs.id == rhs.id
		}

		let raw: AnyView

		init(raw: AnyView) {
			self.raw = raw
		}
	}
}
