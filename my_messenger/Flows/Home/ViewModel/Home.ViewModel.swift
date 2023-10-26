//
//  Home.ViewModel.swift
//  my_messenger
//
//  Created by Kirill Titov on 26.10.2023.
//

import Foundation

extension Home {
	final class ViewModel {

	}
}

extension Home.ViewModel: ViewModelProtocol {

	enum Action: Equatable {
	}

	/// State of sign in view
	enum State: Equatable {
		/// user edit his data
		case idle
		/// user actions
		case action(Action)
		/// sign in fail
		case failure
	}

	final class Input {
	}

	final class Output: ObservableObject {
		var tag: Int = 0
		var name: String = "Home"
		var tabBarImageName: String = "house"
		@Published var state: State = .idle
	}

	func transform(
		input: Input,
		cancelBag: CancelBag
	) -> Output {
		let output = Output()

		return output
	}
}
