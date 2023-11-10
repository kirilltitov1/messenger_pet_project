//
//  SwiftUIView.swift
//  
//
//  Created by Титов Кирилл Иванович on 03.10.2023.
//

import SwiftUI
import Combine

public struct InfiniteList {

//	private var viewModel: ViewModel<Data>
//	private var list: Item<Data, Content, LoadingView>
//
//	public var item: some View {
//		list.environmentObject(viewModel)
//	}
//
//	public init(
//		data: Binding<Data>,
//		totalItemsAvailable: Int,
//		loadMoreData: PassthroughSubject<Int, Never>,
//		loadingView: LoadingView,
//		@ViewBuilder content: @escaping (Data.Element) -> Content
//	) {
//		self.viewModel = ViewModel(
//			data: data,
//			loadMoreData: loadMoreData,
//			totalItemsAvailable: totalItemsAvailable
//		)
//
//		self.list = Item(
//			loadingView: loadingView,
//			content: content
//		)
//	}
}

public extension InfiniteList {
	struct Item<Data, Content, LoadingView>: View
	where Data: RandomAccessCollection, Data.Element: Hashable, Data.Element: Identifiable, Content: View, LoadingView: View {

		private let content: (Data.Element) -> Content
		private let loadingView: LoadingView

		@EnvironmentObject var viewModel: ViewModel<Data>

		@State var selection: Int = 0
		@State private var isLoading: Bool
		private let cancelBag: CancelBag

		public init(
			loadingView: LoadingView,
			@ViewBuilder content: @escaping (Data.Element) -> Content
		) {
			let cancelBag = CancelBag()

			self.cancelBag = cancelBag
			self._isLoading = State<Bool>(initialValue: false)
			self.loadingView = loadingView
			self.content = content

			setupBindings()
		}

		public var body: some View {
			VStack {
				header
				infiniteList
				footer
			}.onAppear {
				viewModel.loadMore.send(())
			}
		}

		private var infiniteList: some View {
//			Group {
			let data = viewModel.data.enumerated().map { $0 }
				return List {
					ForEach(data, id: \.element.id) { index, item in
						content(item).onAppear {
							if item == viewModel.data.last {
								viewModel.loadMore.send(())
							}
						}
						.frame(maxWidth: .infinity, alignment: .leading)
						.contentShape(Rectangle())
						.onTapGesture {
//							input.action.send(.tapOnRaw)
						}
					}
				}.overlay {
					loadingView
						.opacity(isLoading ? 1 : 0)
				}.frame(
					idealWidth: .infinity,
					idealHeight: .infinity
				)
//			}
		}

		private var header: some View {
			//TODO: create header
			Picker("API`s", selection: $selection) {
				Text("Picker Name")
				Text("picker name 2")
			}.pickerStyle(.segmented)
		}

		private var footer: some View {
			//TODO: create footer
			Picker("API`s", selection: $selection) {
				Text("Picker Name")
				Text("picker name 2")
			}.pickerStyle(.segmented)
		}

		private func setupBindings() {
//			viewModel.state.sink { state in
//				if state == .loadingMoreRaws {
//					isLoading = true
//				} else {
//					isLoading = false
//				}
//			}.store(in: cancelBag)
		}
	}
}
