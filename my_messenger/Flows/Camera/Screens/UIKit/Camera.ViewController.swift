//
//  Camera.ViewController.swift
//  Instagram
//
//  Created by Kirill Titov on 13.10.2022.
//

import UIKit

extension Camera {
	final class ViewController: UIViewController {
	}
}

// MARK: - life cycle
extension Camera.ViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Camera"
		view.backgroundColor = .systemBackground
	}
}
