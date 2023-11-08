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

		private let input: ViewModel.Input
		private let output: ViewModel.Output

		init() {
			let cancelBag = CancelBag()

			let input = ViewModel.Input()
			let viewModel = ViewModel()

			let output = viewModel.transform(input: input, cancelBag: cancelBag)
			self.init(input: input, output: output)
		}

		init(
			input: ViewModel.Input,
			output: ViewModel.Output
		) {
			self.input = input
			self.output = output
		}

		var body: some View {
			InfiniteList.Item(
				totalItemsAvailable: 100,
				loadMore: input.loadMore,
				loadMoreData: input.loadMoreData,
				loadingView: Text("Loading...")) { _ in
					Text("")
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
