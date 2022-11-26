//
//  textAttributesTransformer.swift
//  my_messenger
//
//  Created by Kirill Titov on 15.11.2022.
//

import UIKit

extension UIButton.Configuration {
	
	mutating func textAttributesTransformer(
		textStyle: UIFont.TextStyle
	) {
		titleTextAttributesTransformer =
		  UIConfigurationTextAttributesTransformer { incoming in
			var outgoing = incoming
			  
			outgoing.font = UIFont.preferredFont(forTextStyle: textStyle)
			  
			return outgoing
		  }
	}
}
