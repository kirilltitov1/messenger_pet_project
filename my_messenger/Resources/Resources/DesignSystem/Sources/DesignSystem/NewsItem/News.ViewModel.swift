//
//  SwiftUIView 2.swift
//  
//
//  Created by Титов Кирилл Иванович on 19.09.2023.
//

import Foundation
import SwiftUI
import API

extension News {
	final class ViewModel {
		var image: MediaEntry

		init(image: MediaEntry) {
			self.image = image
		}
	}
}
