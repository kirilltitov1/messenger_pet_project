//
//  Profile.ViewModel.swift
//  my_messenger
//
//  Created by Титов Кирилл Иванович on 17.09.2023.
//

import Foundation
import Combine
import UIKit
import SwiftUI

extension Profile {
	final class ViewModel {
		
	}
}

extension Profile.ViewModel: ViewModelProtocol {
	enum State: Equatable {
		case idle
	}

	final class Input {
		@Published var avatar: Image?
		@Published var name: String?
		@Published var secondName: String?
	}

	final class Output: ObservableObject {
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
