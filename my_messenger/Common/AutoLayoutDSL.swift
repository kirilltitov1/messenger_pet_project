//
//  AutoLayoutDSL.swift
//  Instagram
//
//  Created by Kirill Titov on 03.11.2022.
//

import UIKit

/// Represents a single `NSLayoutConstraint`
enum LayoutAnchor {
	case constant(attribute: NSLayoutConstraint.Attribute,
				  relation: NSLayoutConstraint.Relation,
				  constant: CGFloat,
				  multiplier: CGFloat)
	
	case relative(attribute: NSLayoutConstraint.Attribute,
				  relation: NSLayoutConstraint.Relation,
				  relatedTo: NSLayoutConstraint.Attribute,
				  multiplier: CGFloat,
				  constant: CGFloat)
	
	case relativeSafeArea(attribute: NSLayoutConstraint.Attribute,
						  relation: NSLayoutConstraint.Relation,
						  relatedTo: NSLayoutConstraint.Attribute,
						  multiplier: CGFloat,
						  constant: CGFloat)
}

// MARK: - Factory methods
extension LayoutAnchor {
	static let leading = relative(attribute: .leading, relation: .equal, relatedTo: .leading)
	static let trailing = relative(attribute: .trailing, relation: .equal, relatedTo: .trailing)
	static let left = relative(attribute: .left, relation: .equal, relatedTo: .left)
	static let right = relative(attribute: .right, relation: .equal, relatedTo: .right)
	static let top = relative(attribute: .top, relation: .equal, relatedTo: .top)
	static let bottom = relative(attribute: .bottom, relation: .equal, relatedTo: .bottom)
	
	static let leadingToTrailing = relative(attribute: .leading, relation: .equal, relatedTo: .trailing)
	static let trailingToLeading = relative(attribute: .trailing, relation: .equal, relatedTo: .leading)
	
	static let topToBottom = relative(attribute: .top, relation: .equal, relatedTo: .bottom)
	static let bottomToTop = relative(attribute: .bottom, relation: .equal, relatedTo: .top)
	
	static let centerX = relative(attribute: .centerX, relation: .equal, relatedTo: .centerX)
	static let centerY = relative(attribute: .centerY, relation: .equal, relatedTo: .centerY)
	
	static let leadingSafeArea = relativeSafeArea(attribute: .leading, relation: .equal, relatedTo: .leading)
	static let trailingSafeArea = relativeSafeArea(attribute: .trailing, relation: .equal, relatedTo: .trailing)
	static let topSafeArea = relativeSafeArea(attribute: .top, relation: .equal, relatedTo: .top)
	static let bottomSafeArea = relativeSafeArea(attribute: .bottom, relation: .equal, relatedTo: .bottom)
	
	static let width = constant(attribute: .width, relation: .equal)
	static let height = constant(attribute: .height, relation: .equal)
	
	static func constant(
		attribute: NSLayoutConstraint.Attribute,
		relation: NSLayoutConstraint.Relation,
		multiplier: CGFloat = 1
	) -> (CGFloat) -> LayoutAnchor {
		return { constant in
				.constant(attribute: attribute, relation: relation, constant: constant, multiplier: multiplier)
		}
	}
	
	static func relative(
		attribute: NSLayoutConstraint.Attribute,
		relation: NSLayoutConstraint.Relation,
		relatedTo: NSLayoutConstraint.Attribute,
		multiplier: CGFloat = 1
	) -> (CGFloat) -> LayoutAnchor {
		return { constant in
				.relative(attribute: attribute, relation: relation, relatedTo: relatedTo, multiplier: multiplier, constant: constant)
		}
	}
	
	static func relativeSafeArea(attribute: NSLayoutConstraint.Attribute,
								 relation: NSLayoutConstraint.Relation,
								 relatedTo: NSLayoutConstraint.Attribute,
								 multiplier: CGFloat = 1.0) -> (CGFloat) -> LayoutAnchor {
		return { constant in
				.relativeSafeArea(attribute: attribute,
								  relation: relation,
								  relatedTo: relatedTo,
								  multiplier: multiplier,
								  constant: constant)
		}
	}
}

// MARK: - Conveniences
extension UIView {
	func addSubview(_ subview: UIView, anchors: [LayoutAnchor]) {
		subview.translatesAutoresizingMaskIntoConstraints = false
		addSubview(subview)
		subview.activate(anchors: anchors, relativeTo: self)
	}
	
	func activate(anchors: [LayoutAnchor], relativeTo item: UIView? = nil) {
		let constraints = anchors.map { NSLayoutConstraint(from: self, to: item, anchor: $0) }
		NSLayoutConstraint.activate(constraints)
	}
	
}

extension NSLayoutConstraint {
	convenience init(from: UIView, to item: UIView?, anchor: LayoutAnchor) {
		switch anchor {
		case let .constant(attribute: attr, relation: relation, constant: constant, multiplier: multiplier):
			self.init(
				item: from,
				attribute: attr,
				relatedBy: relation,
				toItem: nil,
				attribute: .notAnAttribute,
				multiplier: multiplier,
				constant: constant
			)
		case let .relative(attribute: attr,
						   relation: relation,
						   relatedTo: relatedTo,
						   multiplier: multiplier,
						   constant: constant):
			self.init(
				item: from,
				attribute: attr,
				relatedBy: relation,
				toItem: item,
				attribute: relatedTo,
				multiplier: multiplier,
				constant: constant
			)
			
		case let .relativeSafeArea(attribute: attr,
								   relation: relation,
								   relatedTo: relatedTo,
								   multiplier: multiplier,
								   constant: constant):
			guard let safeAreaLayoutGuide = item?.safeAreaLayoutGuide
			else { fatalError("\(String(describing: item)) safeAreaLayoutGuide problem") }
			
			self.init(item: from,
					  attribute: attr,
					  relatedBy: relation,
					  toItem: safeAreaLayoutGuide,
					  attribute: relatedTo,
					  multiplier: multiplier,
					  constant: constant)
		}
	}
}
