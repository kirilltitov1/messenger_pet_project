//
//  Colors.swift
//  my_messenger
//
//  Created by Титов Кирилл Иванович on 30.09.2023.
//

import Foundation

protocol Colors {
	associatedtype ColorType

	static var lightPink: ColorType { get }
	static var softPink: ColorType { get }
	static var carnation: ColorType { get }
	static var softCarnation: ColorType { get }

// MARK: Blue
	static var softTurquoise: ColorType { get }
	static var aqua: ColorType { get }

// MAKR: Violate
	static var aggplant: ColorType { get }
	static var orchid: ColorType { get }
}
