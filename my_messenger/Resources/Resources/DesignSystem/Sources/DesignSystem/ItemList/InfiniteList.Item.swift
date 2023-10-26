//
//  SwiftUIView.swift
//  
//
//  Created by Титов Кирилл Иванович on 03.10.2023.
//

import SwiftUI
import Combine

public extension InfiniteList {
	struct Item: View {

		@ObservedObject private var input: ViewModel.Input
		@ObservedObject private var output: ViewModel.Output

		@State private var isLoading: Bool
		private let cancelBag: CancelBag

//		private let loadingView: LoadingView

		public init(
			loadMore: @escaping ((Int) -> (AnyPublisher<[AnyView], Never>))
//			loadingView: LoadingView
		) {
			let cancelBag = CancelBag()
			let viewModel = ViewModel(cancelBag: cancelBag)
			let input = ViewModel.Input(loadMore: loadMore)
			let output = viewModel.transform(input: input)

			self.input = input
			self.output = output
			self.cancelBag = cancelBag
//			self.loadingView = loadingView
			self.isLoading = false

			setupBindings()

			input.action
				.send(.requestItems)
		}
		@State var selection: Int = 0

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
				}
			}.overlay {
				Text("Is loading ...")
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
