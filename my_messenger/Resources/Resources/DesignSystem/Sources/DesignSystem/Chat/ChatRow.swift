//
//  ChatRow.swift
//  
//
//  Created by Титов Кирилл Иванович on 13.11.2023.
//

import SwiftUI

struct ChatRow: View {

	let messageType: MessageType

	var isSender: Bool {
		messageType == .sent
	}

	let text: String

	init(text: String, type: MessageType) {
		self.text = text
		self.messageType = type
	}

    var body: some View {
		HStack {
			if isSender { Spacer() }

			if !isSender {
					VStack {
						Spacer()
						Circle()
							.frame(width: 45, height: 45)
							.foregroundColor(Color.pink)
					}
			}

			HStack {
				if isSender { Spacer(minLength: UIScreen.main.bounds.width / 3) }
				HStack {
					Text(text)
						.foregroundColor(isSender ? Color.white : Color(.label))
						.padding()
				}
				.background(isSender ? Color.blue : Color(.systemGray4))
				.cornerRadius(16)

				if !isSender { Spacer(minLength: UIScreen.main.bounds.width / 5) }
			}

			if !isSender { Spacer() }
		}
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			ChatRow(text: "kln", type: .sent)
				.preferredColorScheme(.dark)
			ChatRow(text: "", type: .received)
				.preferredColorScheme(.dark)
		}
    }
}
