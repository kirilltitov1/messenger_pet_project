//
//  SwiftUIView.swift
//  
//
//  Created by Титов Кирилл Иванович on 03.10.2023.
//

import SwiftUI
import Combine

public enum InfiniteList {}

public extension InfiniteList {
	struct Item<Data, Content, LoadingView>: View
	where Data: RandomAccessCollection, Data.Element: Hashable, Data.Element: Identifiable, Content: View, LoadingView: View {

		private let content: (Data.Element) -> Content
		private let loadingView: LoadingView
		private var header: AnyView?
		private var footer: AnyView?

		@ObservedObject var viewModel: ViewModel<Data>

		@State var selection: Int = 0
		private let cancelBag: CancelBag

		public init(
			data: Binding<Data>,
			isLoading: Binding<Bool>,
			loadMoreData: PassthroughSubject<Void, Never>,
			loadingView: LoadingView,
			header: AnyView? = nil,
			footer: AnyView? = nil,
			@ViewBuilder content: @escaping (Data.Element) -> Content
		) {
			let cancelBag = CancelBag()

			self.cancelBag = cancelBag
			self.loadingView = loadingView
			self.content = content

			self.header = header
			self.footer = footer

			self.viewModel = .init(data: data, isLoading: isLoading, loadMoreData: loadMoreData)
		}

		public var body: some View {
			Group {
				VStack {
					header
					infiniteList
					footer
				}.overlay {
					if viewModel.isLoading {
						loadingView
							.frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
					}
				}
			}
		}

		private var infiniteList: some View {
			Group {
			let data = viewModel.data.enumerated().map { $0 }
				return List {
					ForEach(data, id: \.element.id) { index, item in
						content(item).onAppear {
							if item == viewModel.data.last {
								viewModel.loadMoreData.send(())
							}
						}
						.frame(maxWidth: .infinity, alignment: .leading)
					}
				}.listStyle(.grouped)
				.frame(
					idealWidth: .infinity,
					idealHeight: .infinity
				)
			}
		}
	}
}
