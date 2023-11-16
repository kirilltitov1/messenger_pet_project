//
//  File.swift
//  
//
//  Created by Титов Кирилл Иванович on 03.10.2023.
//

import Foundation
import Combine
import SwiftUI

extension InfiniteList {
	public final class ViewModel<Data>: ObservableObject
	where Data: RandomAccessCollection, Data.Element: Hashable {
		
		var loadMoreData: PassthroughSubject<Void, Never>

		private var cancelBag: CancelBag = CancelBag()

		@Binding var data: Data
		@Binding var isLoading: Bool

		public init(
			data: Binding<Data>,
			isLoading: Binding<Bool>,
			loadMoreData: PassthroughSubject<Void, Never>
		) {
			self.loadMoreData = loadMoreData
			self._isLoading = isLoading
			self._data = data

			setupBindings()
		}

		private func setupBindings() {
		}
	}
}
