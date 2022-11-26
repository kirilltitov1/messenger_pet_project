//
//  Gradient.swift
//  Instagram
//
//  Created by Kirill Titov on 20.10.2022.
//

import UIKit

class GradientView: UIView {

	//MARK: - View model
	enum GradientDirection {
		case upDown
		case downUp
		case leftRight
		case rightLeft
		case topLeftBottomRight
		case topRightBottomLeft
		case bottomLeftTopRight
		case bottomRightTopLeft
	}
	
	//MARK: - Properties
	var colors: [UIColor] = [] {
		didSet {
			updateGradient()
		}
	}
	private var cgColors: [CGColor] {
		return colors.map({ $0.cgColor })
	}
	var gradientDirection: GradientDirection = .downUp {
		didSet {
			updateGradient()
		}
	}
	private lazy var gradientLayer: CAGradientLayer = {
		let layer = CAGradientLayer()
	
		layer.shouldRasterize = true
		
		return layer
	}()
	
	//MARK: - Constructor
	init(colors: [UIColor], gradientDirection: GradientDirection) {
		super.init(frame: .zero)
		
		translatesAutoresizingMaskIntoConstraints = false
		
		self.colors = colors
		self.gradientDirection = gradientDirection
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

//MARK: - Lifecycle methods methods
extension GradientView {
	
	override func didMoveToSuperview() {
		super.didMoveToSuperview()
		
		if superview != nil {
			setupUI()
			updateGradient()
		}
		
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		gradientLayer.frame = bounds
	}
	
}

//MARK: - Private methods
private extension GradientView {
	
	func setupUI() {
		layer.addSublayer(gradientLayer)
	}
	
	func updateGradient() {
		
		gradientLayer.colors = cgColors
		
		switch gradientDirection {
		case .upDown:
			gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
			gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
		case .downUp:
			gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
			gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
		case .leftRight:
			gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
			gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
		case .rightLeft:
			gradientLayer.startPoint = CGPoint(x: 1, y: 0.5)
			gradientLayer.endPoint = CGPoint(x: 0, y: 0.5)
		case .topLeftBottomRight:
			gradientLayer.startPoint = CGPoint(x: 0, y: 0)
			gradientLayer.endPoint = CGPoint(x: 1, y: 1)
		case .topRightBottomLeft:
			gradientLayer.startPoint = CGPoint(x: 1, y: 0)
			gradientLayer.endPoint = CGPoint(x: 0, y: 1)
		case .bottomLeftTopRight:
			gradientLayer.startPoint = CGPoint(x: 0, y: 1)
			gradientLayer.endPoint = CGPoint(x: 1, y: 0)
		case .bottomRightTopLeft:
			gradientLayer.startPoint = CGPoint(x: 1, y: 1)
			gradientLayer.endPoint = CGPoint(x: 0, y: 0)
		}
		
	}
	
}

