//
//  Notifications.Screen.swift
//  my_messenger
//
//  Created by Титов Кирилл Иванович on 14.09.2023.
//

import SwiftUI

extension Notifications {
	struct ViewScreen: View {

		private let input: ViewModel.Input
		private let output: ViewModel.Output

		init(
			input: ViewModel.Input,
			output: ViewModel.Output
		) {
			self.input = input
			self.output = output
		}

		var body: some View {
			VStack {
				List {
					ForEach(output.items) { item in
						Text(item)
					}
				}
			}
		}
	}
}

struct NotificationsViewScreenPreviews: PreviewProvider {
    static var previews: some View {
		Notifications.Factory().makeSwiftUIView()
    }
}
