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

		@ObservedObject private var viewModel: ViewModel = .init(serviceApi: MockApi())

		@State private var headerSection: ViewModel.HeaderSection = .cats

		let cancelBag = CancelBag()

		var body: some View {
			infiniteList
		}

		var infiniteList: some View {
			Group {
				InfiniteList.Item(
					data: $viewModel.data,
					isLoading: $viewModel.isLoading,
					loadMoreData: viewModel.loadMoreData,
					rowDidTapped: viewModel.rowAction,
					loadingView: Text("Loading..."),
					header: header
				) { element in
					Text(element.name)
				}.tag(viewModel.tag)
					.tabItem {
						TabItem(title: viewModel.name, imageName: viewModel.tabBarImageName)
					}
			}
		}

		private var header: AnyView {
			// TODO: create header
			// FIXME: [4] вот тут хотелось бы иметь связку вот такую ViewModel -> create Binding<HeaderSection> -> ViewModel refresh подписывается на Binding<HeaderSection> -> ViewModel.Binding<HeaderSection> вставляется в 59 строку Picker, так что ниже
			AnyView(Picker("API`s", selection: $headerSection) {
				ForEach(ViewModel.HeaderSection.allCases, id: \.self) {
					Text("\($0.rawValue) api").tag($0)
				}
			}.contentShape(Rectangle()).onTapGesture {
				print(headerSection)
				// FIXME: [3] тут приходится делать костыльный биндинг на ViewModel, который продублирует вызов api... и выйдет вот так: модель выставила бы при .init вызов первичной прогрузки данных, и тут при установке первого значения.
				viewModel.headerSection = headerSection
			}.pickerStyle(.segmented))
		}
	}
}

struct ExploreViewScreenPreviews: PreviewProvider {
    static var previews: some View {
		Explore.ViewScreen()
    }
}
