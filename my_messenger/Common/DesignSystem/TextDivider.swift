//
//  TextDivider.swift
//  my_messenger
//
//  Created by Kirill Titov on 27.11.2022.
//

import UIKit

class TextDivider: UIView {
	private let textLabel: UILabel = {
		let label: UILabel = UILabel(frame: .zero)
		label.font = UIFont.preferredFont(forTextStyle: .footnote)
		return label
	}()
	
	private let leftDivider: UIView = Divider(frame: .zero)
	
	private let rightDivider: UIView = Divider(frame: .zero)
	
	init(text: String) {
		super.init(frame: .zero)
		
		textLabel.text = text
		
		viewHierarchy()
		makeConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func viewHierarchy() {
		addSubviews(
			textLabel,
			leftDivider,
			rightDivider
		)
	}
	
	private func makeConstraints() {
		self.activate(anchors: [
			.relative(
				attribute: .height,
				relation: .equal,
				relatedTo: .height,
				multiplier: 1,
				constant: 0
			)
		], relativeTo: textLabel)
		
		leftDivider.activate(anchors: [.leading(0), .centerY(0)], relativeTo: self)
		leftDivider.activate(anchors: [.height(1)])
		textLabel.activate(anchors: [.leading(0)], relativeTo: leftDivider)
		rightDivider.activate(anchors: [.leading(0)], relativeTo: textLabel)
		rightDivider.activate(anchors: [.height(1)])
		rightDivider.activate(anchors: [.trailing(0), .centerY(0)], relativeTo: self)
	}
}
