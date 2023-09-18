//
//  SwiftUIView 2.swift
//  
//
//  Created by Титов Кирилл Иванович on 14.09.2023.
//

import SwiftUI

public struct TabItem: View {

	private let title: String
	private let subtitle: String?
	private let imageName: String?
	private let image: Image?

	public init(
		title: String,
		subtitle: String? = nil,
		imageName: String? = nil,
		image: Image? = nil
	) {
		self.title = title
		self.subtitle = subtitle
		self.image = image
		self.imageName = imageName
	}

    public var body: some View {
		VStack {
			Image(systemName: imageName ?? "")
				.resizable()
				.scaledToFit()
				.frame(width: 20, height: 20)
			Text(title)
		}
    }
}

struct TabItem_Previews: PreviewProvider {
    static var previews: some View {
		TabItem(title: "profile", imageName: "person")
    }
}
