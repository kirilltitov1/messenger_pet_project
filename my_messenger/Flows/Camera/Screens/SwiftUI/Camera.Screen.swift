//
//  Camera.Screen.swift
//  my_messenger
//
//  Created by Kirill Titov on 13.09.2023.
//

import SwiftUI

extension Camera {
	struct ViewScreen: View {
		var body: some View {
			VStack {
				Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
			}
		}
	}
}

struct CameraViewScreenPreviews: PreviewProvider {
	static var previews: some View {
		Camera.ViewScreen()
	}
}
