//
//  image.swift
//  Instagram
//
//  Created by Kirill Titov on 15.11.2022.
//

import UIKit

extension UIButton.Configuration {
	/// Configure button image
	/// - Parameters:
	///   - imageName: image name
	///   - placement: placement
	///   - scale: scale
	mutating func configureImage(
		imageName: String,
		placement: NSDirectionalRectEdge,
		scale: UIImage.SymbolScale
	) {
		if imageName == "" { return }
		self.image = UIImage(named: imageName)
		self.imagePadding = 5
		self.imagePlacement = placement
		self.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .medium)
	}
}
