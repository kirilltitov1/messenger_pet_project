//
//  File.swift
//  
//
//  Created by Титов Кирилл Иванович on 19.09.2023.
//

import SwiftUI

extension News {
	struct ItemView: View {

		private let viewModel: ViewModel

		init(
			viewModel: ViewModel
		) {
			self.viewModel = viewModel
		}

		var image: some View {
			EmptyView()
		}

		var body: some View {
			Text("Hello, World!")
		}
	}
}

struct NewsItemPreviews: PreviewProvider {
	static var previews: some View {
		let viewModel =
//		News.ItemView(viewModel: .init())
		EmptyView()
	}
}
