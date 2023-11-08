//
//  SwiftUIView.swift
//  
//
//  Created by Титов Кирилл Иванович on 03.10.2023.
//

import SwiftUI
import Combine

class ItemList {
	let name: String
	var id: UUID = UUID()

	init(name: String) {
		self.name = name
	}
}
extension ItemList: Hashable, Identifiable {
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
	static func == (lhs: ItemList, rhs: ItemList) -> Bool {
		lhs.name == rhs.name
	}
}

public extension InfiniteList {
	struct Item<Data, Content, LoadingView>: View
	where Data: RandomAccessCollection, Data.Element: Hashable, Content: View, LoadingView: View {

		@ObservedObject private var input: ViewModel.Input<Data>
		@ObservedObject private var output: ViewModel.Output<Data>

		private let content: (Data.Element) -> Content
		private let loadingView: LoadingView

		@State var selection: Int = 0
		@State private var isLoading: Bool
		private let cancelBag: CancelBag


		public init(
			totalItemsAvailable: Int,
			loadMore: @escaping ((Int) -> (AnyPublisher<[AnyView], Never>)),
			loadMoreData: @escaping ((Int) -> (AnyPublisher<Data, Never>)),
			loadingView: LoadingView,
			@ViewBuilder content: @escaping (Data.Element) -> Content
		) {
			let cancelBag = CancelBag()
			let viewModel = ViewModel(cancelBag: cancelBag)
			let input = ViewModel.Input<Data>(
				loadMore: loadMore,
				loadMoreData: loadMoreData
			)
			let output = viewModel.transform(
				totalItemsAvailable: totalItemsAvailable,
				input: input
			)

			self.input = input
			self.output = output
			self.cancelBag = cancelBag
			self._isLoading = State<Bool>(initialValue: false)
			self.loadingView = loadingView
			self.content = content

			setupBindings()

//			input.action
//				.send(.requestItems)
		}

		public var body: some View {
			VStack {
				header
				infiniteList
				footer
			}
		}

		private var infiniteList: some View {
			let raws = output.raws.enumerated().map({ $0 })
			return List {
				ForEach(raws, id: \.element.id) { index, element in
					element.raw.onAppear {
						input.action.send(.requestMoreRawsIfNeedIt(index: index))
					}
					.frame(maxWidth: .infinity, alignment: .leading)
					.contentShape(Rectangle())
					.onTapGesture {
//						input.action.send(.tapOnRaw)
					}
				}
			}.overlay {
				loadingView
					.opacity(isLoading ? 1 : 0)
			}.frame(
				idealWidth: .infinity,
				idealHeight: .infinity
			)
		}

		private var header: some View {
			Picker("API`s", selection: $selection) {
				Text("Picker Name")
				Text("picker name 2")
			}.pickerStyle(.segmented)
		}

		private var footer: some View {
			Picker("API`s", selection: $selection) {
				Text("Picker Name")
				Text("picker name 2")
			}.pickerStyle(.segmented)
		}

		private func setupBindings() {
			output.$state.sink { state in
				if state == .loadingMoreRaws {
					isLoading = true
				} else {
					isLoading = false
				}
			}.store(in: cancelBag)
		}
	}
}
