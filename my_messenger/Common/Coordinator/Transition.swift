//
//  Transition.swift
//  my_messenger
//
//  Created by Kirill Titov on 03.12.2022.
//

import UIKit

/// UIKit abstraction
public protocol Transition: AnyObject {
	var transitioning: UIViewControllerAnimatedTransitioning { get }
}
