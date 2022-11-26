//
//  buttonAppereance.swift
//  Instagram
//
//  Created by Kirill Titov on 15.11.2022.
//

import UIKit

extension UIButton.Configuration {
	/// <#Description#>
	/// - Parameters:
	///   - configuration: <#configuration description#>
	///   - buttonSize: <#buttonSize description#>
	///   - cornerStyle: <#cornerStyle description#>
	mutating func buttonAppereance(
		configuration: Self,
		buttonSize: Size = .large,
		cornerStyle: CornerStyle = .medium
	) {
		var config = configuration
		
		config.buttonSize = buttonSize
		config.cornerStyle = cornerStyle
	}
}
