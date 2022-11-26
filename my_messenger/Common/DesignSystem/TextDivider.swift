//
//  TextDivider.swift
//  my_messenger
//
//  Created by Kirill Titov on 27.11.2022.
//

import UIKit

class TextDivider: UIView {
	private let textLabel: UILabel = {
		let label: UILabel = UILabel()
		label.font = UIFont.preferredFont(forTextStyle: .footnote)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private let leftDivider: UIView = {
		let view = Divider(frame: .zero)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private let rightDivider: UIView = {
		let view = Divider(frame: .zero)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
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
		textLabel.activate(anchors: [.top(0), .bottom(0), .centerX(0)], relativeTo: self)
		textLabel.activate(anchors: [.leadingToTrailing(16)], relativeTo: leftDivider)
		textLabel.activate(anchors: [.trailingToLeading(-16)], relativeTo: rightDivider)
		
		leftDivider.activate(anchors: [.leading(0), .centerY(0), .height(1)], relativeTo: self)
		
		rightDivider.activate(anchors: [.trailing(0), .centerY(0), .height(1)], relativeTo: self)
	}
}
