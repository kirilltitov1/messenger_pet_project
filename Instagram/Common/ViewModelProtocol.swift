//
//  ViewModelProtocol.swift
//  Instagram
//
//  Created by Титов Кирилл Иванович on 10.10.2022.
//

protocol ViewModelProtocol {
	associatedtype Input
	associatedtype Output

	func transform(input: Input) -> Output
}
