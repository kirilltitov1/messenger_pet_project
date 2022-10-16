//
//  SignInInputProtocol.swift
//  Instagram
//
//  Created by Титов Кирилл Иванович on 10.10.2022.
//

import Combine

protocol SignInInputProtocol {
	var email: AnyPublisher<String, Never> { get }
	var password: AnyPublisher<String, Never> { get }
	var signIn: AnyPublisher<Void, Never> { get }
}
