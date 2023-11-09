//
//  Explore.Screen.swift
//  my_messenger
//
//  Created by Титов Кирилл Иванович on 14.09.2023.
//

import SwiftUI
import DesignSystem
import Combine

extension Explore {
	struct ViewScreen: View, Identifiable {
		var id: UUID = UUID()
		func hash(into hasher: inout Hasher) {
			hasher.combine(id)
		}
		static func == (lhs: Self, rhs: Self) -> Bool {
			lhs.id == rhs.id
		}

		@State var selection: Int = 0
		private let cancelBag: CancelBag

		@ObservedObject private var input: ViewModel.Input
		@ObservedObject private var output: ViewModel.Output

		init() {
			let cancelBag = CancelBag()

			let input = ViewModel.Input()
			let viewModel = ViewModel()

			let output = viewModel.transform(input: input, cancelBag: cancelBag)
			self.init(input: input, output: output, cancelBag: cancelBag)
		}

		init(
			input: ViewModel.Input,
			output: ViewModel.Output,
			cancelBag: CancelBag
		) {
			self.input = input
			self.output = output
			self.cancelBag = cancelBag
		}

		var body: some View {
			InfiniteList.Item(
				totalItemsAvailable: 100,
				loadMore: input.loadMore,
				loadMoreData: input.loadMoreData,
				data: $output.data,
				loadingView: Text("Loading...")
			) { element in
				Text(element.name)
			}.tag(output.tag)
				.tabItem {
					TabItem(title: output.name, imageName: output.tabBarImageName)
				}
		}
	}
}

struct ExploreViewScreenPreviews: PreviewProvider {
    static var previews: some View {
		Explore.ViewScreen()
    }
}
