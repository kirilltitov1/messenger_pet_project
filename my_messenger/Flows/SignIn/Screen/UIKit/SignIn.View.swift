//
//  SignIn.View.swift
//  Instagram
//
//  Created by Титов Кирилл Иванович on 10.10.2022.
//

import UIKit
import Combine

extension SignIn {
	final class View_: UIView {
		
		private let gradientView: UIView = GradientView(
			colors: [.aqua, .softCarnation],
			gradientDirection: .upDown
		)

		private let headerImageView: UIImageView = {
			let view = UIImageView(image: UIImage(named: "text_logo"))

			view.contentMode = .scaleAspectFit
			view.translatesAutoresizingMaskIntoConstraints = false

			return view
		}()
		
		private lazy var emailTextField: UITextField = {
			let field = UITextField()
			
			field.keyboardType = .emailAddress
			field.placeholder = localization.emailFieldPlaceholder
			field.textAlignment = .center
			field.font = UIFont.preferredFont(forTextStyle: .body)
			field.borderStyle = .roundedRect
			field.backgroundColor = .white
			field.clipsToBounds = true
			field.translatesAutoresizingMaskIntoConstraints = false
			
			return field
		}()
		
		private lazy var passwordTextField: UITextField = {
			let field = UITextField()
			
			field.isSecureTextEntry = true
			field.placeholder = localization.passwordFieldPlaceholder
			field.textAlignment = .center
			field.font = UIFont.preferredFont(forTextStyle: .body)
			field.borderStyle = .roundedRect
			field.backgroundColor = .white
			field.clipsToBounds = true
			field.translatesAutoresizingMaskIntoConstraints = false
			
			return field
		}()
		
		private lazy var signInButton: UIButton = {
			let button: UIButton = UIButton.Builder(configuration: .filled())
				.setupTextAttributesTransformer(textStyle: .headline)
				.build()
			
			button.setTitle(localization.signIn, for: .normal)
			button.backgroundColor = .systemBackground
			button.translatesAutoresizingMaskIntoConstraints = false
			
			return button
		}()
		
		private lazy var signUpButton: UIButton = {
			let button: UIButton = UIButton.Builder(configuration: .plain())
				.setupTextAttributesTransformer(textStyle: .footnote)
				.build()
			
			button.setTitle(localization.signUp, for: .normal)
			button.backgroundColor = .clear
			button.translatesAutoresizingMaskIntoConstraints = false
			
			return button
		}()
		
		private lazy var textDivider: TextDivider = {
			let view = TextDivider(text: "or")
			view.translatesAutoresizingMaskIntoConstraints = false
			return view
		}()
		
		weak var input: ViewModel.Input?
		weak var output: ViewModel.Output?
		private weak var cancelBag: CancelBag?

		private let localization: SignInLocalizationProtocol
		
		/// Initialization.
		///
		/// - Parameters:
		///   - input: input view model
		///   - output: output view model
		///   - cancelBag: cancel bag for store AnyCancellable
		///   - localization: localization for UI
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
			
			super.init(frame: .zero)
			
			self.backgroundColor = .systemBackground
			
			makeViewHierarchy()
			makeConstraints()
			makeBindings()
		}
		
		required init?(coder: NSCoder) {
			fatalError("\(#file): init(coder:) has not been implemented")
		}
	}
}

// MARK: life cycle
extension SignIn.View_ {
	override func layoutSubviews() {
		super.layoutSubviews()
		
		emailTextField.layer.cornerRadius = emailTextField.bounds.height/4
		passwordTextField.layer.cornerRadius = passwordTextField.bounds.height/4
		signInButton.layer.cornerRadius = signInButton.bounds.height/4
	}
}

private extension SignIn.View_ {
	
	func makeBindings() {
		guard let input = input else { return }
		guard let output = output else { return }
		guard let cancelBag = cancelBag else { return }
		
		// MARK: input
		signInButton.publisher(for: .touchUpInside)
			.throttle(for: .milliseconds(300), scheduler: DispatchQueue.main, latest: true)
			.subscribe(input.signIn)
			.store(in: cancelBag)
		
		signUpButton.publisher(for: .touchUpInside)
			.throttle(for: .milliseconds(300), scheduler: DispatchQueue.main, latest: true)
			.subscribe(input.signUp)
			.store(in: cancelBag)
		
		emailTextField.textPublisher
			.assign(to: \.email, on: input)
			.store(in: cancelBag)
 
		passwordTextField.textPublisher
			.assign(to: \.password, on: input)
			.store(in: cancelBag)
		
		// MARK: output
		let isFieldsValid = Publishers.CombineLatest(
			output.$isEmailValid,
			output.$isPasswordValid)
			.map { $0.0 && $0.1 }
		
		let stateConfiguration = Publishers.CombineLatest(
			isFieldsValid,
			output.$state
		)
		
		stateConfiguration.sink { [unowned self] isEnabled, state in
			if isEnabled {
				let isActive = state == .action(.signIn)
				self.signInButton.setActivityIndicator(isActive: isActive, title: localization.signIn)
				self.fieldsConfigurate(state: state)
			} else {
				self.signInButton.setEnable(value: isEnabled)
			}
		}.store(in: cancelBag)
	}
	
	func makeViewHierarchy() {
		addSubviews(
			gradientView,
			emailTextField,
			passwordTextField,
			signInButton,
			signUpButton,
			textDivider
		)
		gradientView.addSubview(headerImageView)
	}
	
	func makeConstraints() {
		stretch(view: gradientView)
		
		let appereance = Appearance()
		
		headerImageView.activate(anchors: [.top(0), .left(32), .right(-32), .height(appereance.screenWidth)], relativeTo: self)
		
		emailTextField.activate(anchors: [.left(32), .right(-32)], relativeTo: self)
		emailTextField.activate(anchors: [.topToBottom(16)], relativeTo: headerImageView)
		
		passwordTextField.activate(anchors: [.left(32), .right(-32)], relativeTo: self)
		passwordTextField.activate(anchors: [.topToBottom(16)], relativeTo: emailTextField)
		
		signInButton.activate(anchors: [.left(32), .right(-32)], relativeTo: self)
		signInButton.activate(
			anchors: [.topToBottom(16),
					  LayoutAnchor.relative(
						attribute: .height,
						relation: .equal,
						relatedTo: .height,
						multiplier: 1,
						constant: 0)
					 ],
			relativeTo: passwordTextField)
		
		textDivider.activate(anchors: [.topToBottom(16)], relativeTo: signInButton)
		textDivider.activate(anchors: [.leading(32), .trailing(-32)], relativeTo: self)
		
		signUpButton.activate(anchors: [.topToBottom(8)], relativeTo: textDivider)
		signUpButton.activate(anchors: [.right(-32)], relativeTo: self)
	}
	
	func fieldsConfigurate(state: SignIn.ViewModel.State) {
		func updateActivity() {
			switch state {
			case .action(.signIn):
				emailTextField.resignFirstResponder()
				emailTextField.isEnabled = false
				passwordTextField.resignFirstResponder()
				passwordTextField.isEnabled = false
			default:
				emailTextField.isEnabled = true
				passwordTextField.isEnabled = true
			}
		}
		
		updateActivity()
	}
}
