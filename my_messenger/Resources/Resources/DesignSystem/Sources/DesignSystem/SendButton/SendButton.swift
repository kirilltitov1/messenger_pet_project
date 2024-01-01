//
//  SwiftUIView.swift
//  
//
//  Created by Титов Кирилл Иванович on 13.11.2023.
//

import SwiftUI

struct SendButton: View {
	@Binding var text: String

    var body: some View {
		Button {

		} label: {
			Image(systemName: "paperplane")
				.font(.system(size: 33))
				.aspectRatio(contentMode: .fit)
				.frame(width: 55, height: 55)
				.foregroundColor(Color.white)
				.background(Color.blue)
				.clipShape(Circle())

		}
    }

	func sendMessage() {
		guard !text.isEmpty else { return }
	}
}

//struct SendButton_Previews: PreviewProvider {
//    static var previews: some View {
//		SendButton(text: )
//    }
//}
