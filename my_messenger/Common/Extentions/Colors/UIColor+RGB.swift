//
//  UIColor.swift
//  Instagram
//
//  Created by Kirill Titov on 30.10.2022.
//

import UIKit

extension UIColor: Colors {
	typealias ColorType = UIColor

	convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1) {
		let newRed = CGFloat(red)/255
		let newGreen = CGFloat(green)/255
		let newBlue = CGFloat(blue)/255

		self.init(red: newRed, green: newGreen, blue: newBlue, alpha: alpha)
	}

	// MARK: Pink
	static var lightPink: ColorType { UIColor(red: 178, green: 73, blue: 109) }
	static var softPink: ColorType { UIColor(red: 234, green: 214, blue: 238) }
	static var carnation: ColorType { UIColor(red: 252, green: 111, blue: 207) }
	static var softCarnation: ColorType { UIColor(red: 242, green: 186, blue: 232) }
	
	// MARK: Blue
	static var softTurquoise: ColorType { UIColor(red: 160, green: 241, blue: 234) }
	static var aqua: ColorType { UIColor(red: 15, green: 128, blue: 255) }
	
	// MARK: Violate
	static var aggplant: ColorType { UIColor(red: 64, green: 0, blue: 128)}
	static var orchid: ColorType { UIColor(red: 102, green: 102, blue: 255) }
}
