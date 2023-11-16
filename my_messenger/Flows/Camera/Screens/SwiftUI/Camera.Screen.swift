//
//  Camera.Screen.swift
//  my_messenger
//
//  Created by Kirill Titov on 13.09.2023.
//

import SwiftUI
import DesignSystem

extension Camera {
	struct ViewScreen: View, Identifiable {
		var id: UUID = UUID()
		func hash(into hasher: inout Hasher) {
			hasher.combine(id)
		}
		static func == (lhs: Self, rhs: Self) -> Bool {
			lhs.id == rhs.id
		}

		private let input: ViewModel.Input
		private let output: ViewModel.Output

		init() {
			let cancelBag = CancelBag()

			let input = ViewModel.Input()
			let viewModel = ViewModel()

			let output = viewModel.transform(input: input, cancelBag: cancelBag)
			self.init(input: input, output: output)
		}

		init(
			input: ViewModel.Input,
			output: ViewModel.Output
		) {
			self.input = input
			self.output = output
		}
		
		var body: some View {
			NavigationView {
				VStack {
					Text("Hello, World!")
				}
			}.tag(output.tag)
				.tabItem {
					   TabItem(title: output.name, imageName: output.tabBarImageName)
				   }
		}
	}
}

struct CameraViewScreenPreviews: PreviewProvider {
	static var previews: some View {
		Camera.ViewScreen()
	}
}
