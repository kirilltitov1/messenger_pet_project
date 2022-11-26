//
//  Divider.swift
//  my_messenger
//
//  Created by Kirill Titov on 27.11.2022.
//

import UIKit

final class Divider: UIView {
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.backgroundColor = .gray
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
