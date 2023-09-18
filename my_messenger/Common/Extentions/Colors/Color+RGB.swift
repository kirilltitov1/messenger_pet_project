//
//  Color+RGB.swift
//  my_messenger
//
//  Created by Титов Кирилл Иванович on 30.09.2023.
//

import SwiftUI

extension Color: Colors {

	typealias ColorType = Color

	init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
		let newRed = Double(red)/255
		let newGreen = Double(green)/255
		let newBlue = Double(blue)/255

		self.init(red: newRed, green: newGreen, blue: newBlue, opacity: alpha)
	}

	// MARK: Pink
	static var lightPink: Color { Color(red: 178, green: 73, blue: 109) }
	static var softPink: Color { Color(red: 234, green: 214, blue: 238) }
	static var carnation: Color { Color(red: 252, green: 111, blue: 207) }
	static var softCarnation: Color { Color(red: 242, green: 186, blue: 232) }

	// MARK: Blue
	static var softTurquoise: Color { Color(red: 160, green: 241, blue: 234) }
	static var aqua: Color { Color(red: 15, green: 128, blue: 255) }

	// MARK: Violate
	static var aggplant: Color { Color(red: 64, green: 0, blue: 128) }
	static var orchid: Color { Color(red: 102, green: 102, blue: 255) }
}
