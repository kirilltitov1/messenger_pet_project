//
//  ViewModelProtocol.swift
//  Instagram
//
//  Created by Титов Кирилл Иванович on 10.10.2022.
//

protocol ViewModelProtocol {
	associatedtype Input
	associatedtype Output
	
	/// function that make new state
	/// - Parameter input: new input data
	/// - Returns: new output
	func transform(input: Input, cancelBag: CancelBag) -> Output
}
