//
//  InfiniteList.ItemRaw.swift
//  
//
//  Created by Титов Кирилл Иванович on 06.10.2023.
//

import SwiftUI

extension InfiniteList {
	struct ItemRaw {
		let id = UUID()
		let raw: AnyView

		init(raw: AnyView) {
			self.raw = raw
		}
	}
}
