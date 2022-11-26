//
//  image.swift
//  Instagram
//
//  Created by Kirill Titov on 15.11.2022.
//

import UIKit

extension UIButton.Configuration {
	/// <#Description#>
	/// - Parameters:
	///   - imageName: <#imageName description#>
	///   - placement: <#placement description#>
	///   - scale: <#scale description#>
	mutating func configureImage(
		imageName: String,
		placement: NSDirectionalRectEdge,
		scale: UIImage.SymbolScale
	) {
		self.image = UIImage(named: imageName)
		self.imagePadding = 5
		self.imagePlacement = placement
		self.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .medium)
	}
}
