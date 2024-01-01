//
//  Explore.Screen.swift
//  my_messenger
//
//  Created by Титов Кирилл Иванович on 14.09.2023.
//

import SwiftUI
import DesignSystem
import Combine
import ServiceLocator

extension Explore {
	struct ViewScreen: View, Identifiable {
		var id: UUID = UUID()

		func hash(into hasher: inout Hasher) {
			hasher.combine(id)
		}

		static func == (lhs: Self, rhs: Self) -> Bool {
			lhs.id == rhs.id
		}

		@ObservedObject private var viewModel: ViewModel = .init()

		let cancelBag = CancelBag()

		var body: some View {
			NavigationView {
				infiniteList
					.navigationBarTitleDisplayMode(.large)
				// FIXME: почему он ломает мне tabbar нижний? он отрисовывается 
//					.navigationTitle(viewModel.name)
			}.tabItem {
				TabItem(title: viewModel.name, imageName: viewModel.tabBarImageName)
			}
		}

		var infiniteList: some View {
			Group {
				InfiniteList.Item(
					data: $viewModel.data,
					isLoading: $viewModel.isLoading,
					loadMoreData: viewModel.loadMoreData,
					loadingView: loadingView,
					header: header
				) { element in
					NavigationLink(destination: ChatView(userName: element.name)) {
						Text(element.name)
							.modifier(StretchContentToRectangle())
							.tag(viewModel.tag)

						Circle()
							.foregroundColor(.red)
							.frame(width: 35, height: 35)
							.onTapGesture { [element] in
								withAnimation(.linear(duration: 3)) { [element] in
									viewModel.data.removeAll { $0 == element }
								}
							}
					}
				}
			}
		}

		private var header: AnyView {
			AnyView(
				Picker("API`s", selection: $viewModel.headerSection) {
					ForEach(Explore.ViewModel.HeaderSection.allCases, id: \.self) {
						Text("\($0.rawValue) api").tag($0)
					}
				}
				.allowsHitTesting(!viewModel.isLoading)
				.pickerStyle(.segmented)
			)
		}

		@State private var loadingViewOpacity: Double = 1
		private var loadingView: some View {
			let loadView = HStack {
				Image(systemName: "arrow.2.circlepath")
					.foregroundColor(.green)
				Image(systemName: "arrow.2.circlepath")
					.foregroundColor(.blue)
				Image(systemName: "arrow.2.circlepath")
					.foregroundColor(.pink)
			}.opacity(loadingViewOpacity)

			if viewModel.isLoading &&
				(loadingViewOpacity == 0.0 || loadingViewOpacity == 1.0) {
				withAnimation(.easeIn(duration: 2.0)) {
					loadingViewOpacity = loadingViewOpacity == 0.0 ? 1.0 : 0.0
				}
			}

			return loadView
		}
	}
}

struct ExploreViewScreenPreviews: PreviewProvider {
    static var previews: some View {
		Explore.ViewScreen()
    }
}
