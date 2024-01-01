//
//  SignIn.ViewScreen.swift
//  my_messenger
//
//  Created by Титов Кирилл Иванович on 10.09.2023.
//

import SwiftUI

extension SignIn {

	struct ViewScreen: View {

		@StateObject private var viewModel = ViewModel()
		let input: ViewModel.Input?
		let output: ViewModel.Output?
		private weak var cancelBag: CancelBag?

		private let localization: SignInLocalizationProtocol

		init(
			input: ViewModel.Input,
			output: ViewModel.Output,
			cancelBag: CancelBag,
			localization: SignInLocalizationProtocol
		) {
			self.input = input
			self.output = output
			self.cancelBag = cancelBag
			self.localization = localization
		}

		var body: some View {
			VStack {
				Text("localization.signIn")
					.bold()
			}.background(
				LinearGradient(colors: [.aqua, .softCarnation], startPoint: .top, endPoint: .bottom)
			)
		}
	}
}

struct SignUpScreenPreviews: PreviewProvider {
	static var previews: some View {
		SignIn.Factory(cancelBag: CancelBag()).makeSignInViewScreen()
	}
}
