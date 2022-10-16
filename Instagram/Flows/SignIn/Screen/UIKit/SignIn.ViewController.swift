//
//  SignIn.ViewController.swift
//  Instagram
//
//  Created by Титов Кирилл Иванович on 10.10.2022.
//

import Foundation
import UIKit
import Combine

extension SignIn {
	final class ViewController: UIViewController {
		private let output: SignInOutputProtocol
		private let cancelBag: CancelBag

		init(
			output: SignInOutputProtocol,
			cancelBag: CancelBag
		) {
			self.output = output
			self.cancelBag = cancelBag
			super.init(nibName: nil, bundle: nil)
		}
		required init?(coder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
		}
	}
}

// MARK: life cycle
extension SignIn.ViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Sign In"
		view.backgroundColor = .systemBackground
	}
}
