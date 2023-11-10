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
		
		private var loadMoreData: PassthroughSubject<Int, Never>
		
		var loadMore: PassthroughSubject<Void, Never> = .init()
		
		@Binding var data: Data
		
		fileprivate private(set) var totalItemsAvailable: Int
		fileprivate var itemsLoadedCount: Int = 0
		fileprivate var page = 0
		
		private var cancelBag: CancelBag = CancelBag()
		
		public init(
			data: Binding<Data>,
			loadMoreData: PassthroughSubject<Int, Never>,
			totalItemsAvailable: Int
		) {
			self.loadMoreData = loadMoreData
			self._data = data
			self.totalItemsAvailable = totalItemsAvailable

			setupBindings()
		}
		
		private func setupBindings() {
			loadMore
				.sink { [weak self] in
					guard let self = self else { return }
					page += 1
					loadMoreData.send(page)
				}.store(in: cancelBag)
		}
	}
}
