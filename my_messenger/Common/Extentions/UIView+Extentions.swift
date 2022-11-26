//
//  UIView.stretch.swift
//  Instagram
//
//  Created by Kirill Titov on 30.10.2022.
//

import UIKit

extension UIView {
	
	/// add +1 view items
	/// - Parameter views: view to be added
	func addSubviews(_ views: UIView...) {
		views.forEach { addSubview($0) }
	}
	
	/// stretch self over some view
	/// - Parameter view: some view
	func stretch(view: UIView) {
		NSLayoutConstraint.activate([
			topAnchor.constraint(equalTo: view.topAnchor),
			bottomAnchor.constraint(equalTo: view.bottomAnchor),
			leftAnchor.constraint(equalTo: view.leftAnchor),
			rightAnchor.constraint(equalTo: view.rightAnchor)
		])
	}
}
