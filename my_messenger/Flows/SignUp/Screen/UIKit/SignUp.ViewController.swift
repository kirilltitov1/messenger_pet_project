//
//  SignUp.ViewController.swift
//  my_messenger
//
//  Created by Kirill Titov on 04.12.2022.
//

import Foundation
import UIKit

extension SignUp {
	final class ViewController: UIViewController {
		private let cancelBag: CancelBag
		
		private let input: ViewModel.Input
		private let output: ViewModel.Output
		
		private let localization: SignUpLocalizationProtocol
		
		init(
			input: ViewModel.Input,
			output: ViewModel.Output,
			cancelBag: CancelBag,
			localization: SignUpLocalizationProtocol
		) {
			self.input = input
			self.output = output
			self.cancelBag = cancelBag
			
			self.localization = localization
			
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
				localization: localization
			)
		}
		
		override func viewDidLoad() {
			super.viewDidLoad()
			title = localization.signUp
			navigationController?.navigationBar.setNeedsLayout()
			if let presentationController = presentationController as? UISheetPresentationController {
				presentationController.prefersGrabberVisible = true
			}
		}

		deinit {
			print("\(#file) deinit")
		}
	}
}
