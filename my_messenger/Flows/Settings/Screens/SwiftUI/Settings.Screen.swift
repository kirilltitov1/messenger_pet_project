//
//  Settings.Screen.swift
//  my_messenger
//
//  Created by Титов Кирилл Иванович on 15.09.2023.
//

import SwiftUI

extension Settings {
	struct Screen: View {
//		private let input: ViewModel.Input
//		private let output: ViewModel.Output
//
//		init() {
//			let cancelBag = CancelBag()
//
//			let input = ViewModel.Input()
//			let viewModel = ViewModel()
//
//			let output = viewModel.transform(input: input, cancelBag: cancelBag)
//			self.init(input: input, output: output)
//		}
//
//		init(
//			input: ViewModel.Input,
//			output: ViewModel.Output
//		) {
//			self.input = input
//			self.output = output
//		}
//
		var body: some View {
			VStack {
				Text("Settings")
			}
		}
	}
}

struct SettingsScreenPreviews: PreviewProvider {
    static var previews: some View {
		Settings.Screen()
    }
}
