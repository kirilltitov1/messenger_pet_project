//
//  View+eraseToAnyView.swift
//  my_messenger
//
//  Created by Титов Кирилл Иванович on 17.09.2023.
//

import SwiftUI

extension View {
	func eraseToAnyView() -> AnyView {
		AnyView(self)
	}
}
