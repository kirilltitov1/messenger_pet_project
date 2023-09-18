//
//  File.swift
//  
//
//  Created by Титов Кирилл Иванович on 04.10.2023.
//

import Combine
import SwiftUI

public protocol InfiniteListDelegate {
	func requestItems(page: Int) -> AnyPublisher<[AnyView], Never>
}
