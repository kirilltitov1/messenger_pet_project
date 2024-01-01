//
//  SwiftUIView.swift
//  
//
//  Created by Титов Кирилл Иванович on 16.11.2023.
//

import SwiftUI

public struct StretchContentToRectangle: ViewModifier {
	public init() {}
	public func body(content: Content) -> some View {
		content
			.frame(maxWidth: .infinity, alignment: .leading)
			.contentShape(Rectangle())
	}
}
