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
	final class ViewController<ViewModel: ViewModelProtocol>: UIViewController {
		private let viewModel: ViewModel

		init(viewModel: ViewModel) {
			self.viewModel = viewModel
			super.init(nibName: nil, bundle: nil)
		}
		required init?(coder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
		}
	}
}

// MARK: SignInOutputProtocol
extension SignIn.ViewController: SignInOutputProtocol {

}
