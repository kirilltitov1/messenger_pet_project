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
			delegate: InfiniteListDelegate
//			loadingView: LoadingView
		) {
			let cancelBag = CancelBag()
			let viewModel = ViewModel(delegate: delegate, cancelBag: cancelBag)
			let input = ViewModel.Input()
			let output = viewModel.transform(input: input)

			self.input = input
			self.output = output
			self.cancelBag = cancelBag
//			self.loadingView = loadingView
			self.isLoading = false

			setupBindings()

			input.action.send(.requestItems)
		}
		@State var selection: Int = 0

		public var body: some View {
			VStack {
				Picker("API`s", selection: $selection) {
					Text("Picker Name")
					Text("picker name 2")
				}.pickerStyle(.segmented)

				let raws = output.raws.enumerated().map({ $0 })
				List(raws, id: \.element.id) { index, item in
					item.onAppear { print(index) /*input.action.send(.requestMoreRawsIfNeedIt(index: index))*/ }
				}.overlay {
					Text("Is loading ...")
						.opacity(isLoading ? 1 : 0)
				}.frame(
					idealWidth: .infinity,
					idealHeight: .infinity
				)

				Picker("API`s", selection: $selection) {
					Text("Picker Name")
					Text("picker name 2")
				}.pickerStyle(.segmented)
			}
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
