//
//  Appearance.swift
//  Instagram
//
//  Created by Kirill Titov on 03.11.2022.
//

import UIKit

/// Appearance of SignIn UI elements
struct Appearance {
	
	struct Padding {
		let x1: CGFloat = 16
		let x2: CGFloat = 32
	}
	
	let screenHeight: CGFloat
	let screenWidth: CGFloat
	
	let h1: CGFloat
	let h2: CGFloat
	
	let oneThirdOfHeight: CGFloat
	
	init() {
		self.screenHeight = UIScreen.main.bounds.height
		self.screenWidth = UIScreen.main.bounds.width
		
		self.h1 = screenHeight * 0.33
		self.h2 = screenHeight * 0.66
		
		self.oneThirdOfHeight = screenHeight * 0.33
	}
}
