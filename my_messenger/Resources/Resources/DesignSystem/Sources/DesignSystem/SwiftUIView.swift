//
//  SwiftUIView.swift
//  
//
//  Created by Kirill Titov on 13.09.2023.
//

import SwiftUI

public struct SwiftUIView: View {
	private let labelName: String
	private let imageName: String
	private var image: Image? = nil

	public init(
		labelName: String,
		imageName: String,
		image: Image? = nil
	) {
		self.labelName = labelName
		self.imageName = imageName
		self.image = image
	}

	public var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
		SwiftUIView(labelName: "", imageName: "")
    }
}
