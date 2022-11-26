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
		private let cancelBag: CancelBag
		
		private let input: ViewModel.Input
		private let output: ViewModel.Output
		
		init(
			input: ViewModel.Input,
			output: ViewModel.Output,
			cancelBag: CancelBag
		) {
			self.input = input
			self.output = output
			self.cancelBag = cancelBag
			
			super.init(nibName: nil, bundle: nil)
		}
		required init?(coder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
		}
		
		// MARK: life cycle
		
		override func loadView() {
			view = View(
				input: input,
				output: output,
				cancelBag: cancelBag,
				localization: Localization.SignIn()
			)
		}
		
		override func viewDidLoad() {
			super.viewDidLoad()
			title = "Sign in"
		}
	}
}
