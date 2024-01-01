//
//  Notifications.ViewModel.swift
//  my_messenger
//
//  Created by Титов Кирилл Иванович on 17.09.2023.
//

import Foundation
import Combine
import UIKit
import SwiftUI

extension String: Identifiable {
	public var id: UUID {
		UUID()
	}
}

extension Notifications {
	final class ViewModel: ViewModelProtocol {
		enum State {

		}

		final class Input {

		}

		final class Output: ObservableObject {
			var tag: Int = 3
			var name: String = "Notifications"
			var tabBarImageName: String = "bell"
			@Published var items: [String] = [
				"11111111111",
				"22222222222",
				"33333333333",
				"44444444444",
				"55555555555",
				"66666666666",
				"77777777777",
				"88888888888",
				"99999999999"
			]
		}

		func transform(
			input: Input,
			cancelBag: CancelBag
		) -> Output {
			let output = Output()

//			output.$name.

			return output
		}
	}
}
