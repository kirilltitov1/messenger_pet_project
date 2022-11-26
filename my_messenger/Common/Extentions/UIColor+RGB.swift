//
//  UIColor.swift
//  Instagram
//
//  Created by Kirill Titov on 30.10.2022.
//

import UIKit

extension UIColor {
	convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
		let newRed = CGFloat(red)/255
		let newGreen = CGFloat(green)/255
		let newBlue = CGFloat(blue)/255
		
		self.init(red: newRed, green: newGreen, blue: newBlue, alpha: alpha)
	}
}

extension UIColor {
	// MARK: Pink
	static var lightPink: UIColor { UIColor(red: 178, green: 73, blue: 109, alpha: 1) }
	static var softPink: UIColor { UIColor(red: 234, green: 214, blue: 238, alpha: 1) }
	static var carnation: UIColor { UIColor(red: 252, green: 111, blue: 207, alpha: 1) }
	static var softCarnation: UIColor { UIColor(red: 242, green: 186, blue: 232, alpha: 1) }
	
	// MARK: Blue
	static var softTurquoise: UIColor { UIColor(red: 160, green: 241, blue: 234, alpha: 1) }
	static var aqua: UIColor { UIColor(red: 15, green: 128, blue: 255, alpha: 1) }
	
	// MAKR: Violate
	static var aggplant: UIColor { UIColor(red: 64, green: 0, blue: 128, alpha: 1)}
	static var orchid: UIColor { UIColor(red: 102, green: 102, blue: 255, alpha: 1) }
}
