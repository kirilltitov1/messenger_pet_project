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

	private var tag: Int
	private var title: String
	private var subtitle: String?
	private var imageName: String?
	private var image: Image?

	private let content: Content

	public init(
		_ content: Content,
		tag: Int,
		title: String,
		subtitle: String? = nil,
		imageName: String? = nil,
		image: Image? = nil
	) {
		self.content = content
		self.tag = tag
		self.title = title
		self.subtitle = subtitle
		self.imageName = imageName
		self.image = image
	}

	public var body: some View {
		self.content
			.tag(tag)
			.tabItem {
				TabItem(title: title, subtitle: subtitle, imageName: imageName, image: image)
			}
	}
}
