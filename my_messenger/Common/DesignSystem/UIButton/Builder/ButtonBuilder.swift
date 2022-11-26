//
//  ButtonBuilder.swift
//  Instagram
//
//  Created by Kirill Titov on 15.11.2022.
//

import UIKit

extension UIButton {
	class Builder {
		private var button: UIButton?
		
		init(configuration: UIButton.Configuration) {
			button = UIButton(configuration: configuration)
		}
		
		public func build() -> UIButton {
			return button ?? UIButton(type: .system)
		}
		
		public func setupImage(imageName: String) -> Self {
			button?.configuration?
				.configureImage(imageName: imageName, placement: .trailing, scale: .medium)
			return self
		}
		
		public func setupTextAttributesTransformer(textStyle: UIFont.TextStyle) -> Self {
			button?.configuration?.textAttributesTransformer(textStyle: textStyle)
			return self
		}
	}
}
