//
//  File.swift
//  
//
//  Created by Титов Кирилл Иванович on 21.10.2023.
//

import SwiftUI

public struct TabScreenWrapper<Content: View>: Hashable, Identifiable, View {

	public var id: UUID = UUID()
	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
	public static func == (
		lhs: TabScreenWrapper<Content>,
		rhs: TabScreenWrapper<Content>
	) -> Bool {
		lhs.id == rhs.id
	}

	private let content: Content

	public init(_ content: Content) {
		self.content = content
	}

	public var body: some View {
		self.content
	}
}
