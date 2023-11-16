//
//  ChatView.swift
//  
//
//  Created by Титов Кирилл Иванович on 13.11.2023.
//

import SwiftUI

public struct CustomField: ViewModifier {
	public init() {}
	public func body(content: Content) -> some View {
		content
			.padding()
			.background(Color(.secondarySystemBackground))
			.cornerRadius(8)
	}
}

public struct ChatView: View {
	@State private var message: String = ""
	private let userName: String

	public init(userName: String) {
		self.userName = userName
	}

    public var body: some View {
		VStack {
			ScrollView(.vertical) {
				ChatRow(text: "Text", type: .sent)
					.padding(5)
				ChatRow(text: "Text", type: .received)
					.padding(5)
			}
			HStack {
				TextField("Message...", text: $message)
					.modifier(CustomField())

				SendButton(text: $message)

			}
			.padding()
		}
		.navigationTitle(userName)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
		ChatView(userName: "Bill")
			.preferredColorScheme(.dark)
    }
}
