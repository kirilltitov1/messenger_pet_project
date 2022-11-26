//
//  BindableProtocol.swift
//  Instagram
//
//  Created by Kirill Titov on 12.10.2022.
//

import Combine

protocol BindableType: AnyObject {
	associatedtype ViewModelType
	
	var viewModel: ViewModelType! { get set }
	
	func bindViewModel()
}
