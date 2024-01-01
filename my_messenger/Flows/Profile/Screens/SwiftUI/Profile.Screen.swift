//
//  Profile.Screen.swift
//  my_messenger
//
//  Created by Титов Кирилл Иванович on 14.09.2023.
//

import SwiftUI
import DesignSystem

extension Profile {
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
		private let localization: SettingsLocalizationProtocol = Localization.Settings()

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
				Text("112233")
					.toolbar {
						NavigationLink(destination: Settings.Screen()) {
							Text("0000")
						}
					}
			}.tag(output.tag)
				.tabItem {
					TabItem(title: output.name, imageName: output.tabBarImageName)
				}
		}
	}
}

struct ProfileViewScreenPreviews: PreviewProvider {
    static var previews: some View {
		Profile.ViewScreen()
    }
}
