//
//  CurrentValueSubject+binding.swift
//  my_messenger
//
//  Created by Титов Кирилл Иванович on 11.11.2023.
//

import Combine
import SwiftUI

extension CurrentValueSubject {
  var binding: Binding<Output> {
	Binding(get: {
	  self.value
	}, set: {
	  self.send($0)
	})
  }
}
