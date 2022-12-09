//
//  SystemNavigation.swift
//  my_messenger
//
//  Created by Kirill Titov on 03.12.2022.
//

import Foundation
import UIKit

/// Interface for the UINavigationController entity in the system
public protocol SystemNavigation: UINavigationController {
	var popToRootHandler: (() -> Void)? { get set }
	var popHandler: (() -> Void)? { get set }
}
