//
//  setEnable.swift
//  my_messenger
//
//  Created by Kirill Titov on 30.11.2022.
//

import Combine
import UIKit

extension UIButton {
	func setEnable(value: Bool) {
		self.isEnabled = value
		self.backgroundColor = value ? .systemBackground : .systemBackground.withAlphaComponent(0.3)
	}
	
	func setActivityIndicator(isActive: Bool, title: String) {
		var config = self.configuration
		
		config?.showsActivityIndicator = isActive
		config?.imagePlacement = isActive ? .leading : .trailing
		config?.title = isActive ? (title + "...") : title
		self.isEnabled = !isActive
		
		self.configuration = config
		self.setNeedsUpdateConfiguration()
	}
}
