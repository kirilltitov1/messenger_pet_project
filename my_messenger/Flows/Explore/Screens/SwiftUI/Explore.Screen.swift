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
	struct ViewScreen: View, InfiniteListDelegate {

		@State var selection: Int = 0

		func requestItems(page: Int) -> AnyPublisher<[AnyView], Never> {
			return Just([
				AnyView(Text("111111")),
				AnyView(Text("222222")),
				AnyView(Text("333333")),
				AnyView(Text("444444")),
				AnyView(Text("555555")),
				AnyView(Text("111111")),
				AnyView(Text("222222")),
				AnyView(Text("333333")),
				AnyView(Text("444444")),
				AnyView(Text("555555")),
				AnyView(Text("111111")),
				AnyView(Text("222222")),
				AnyView(Text("333333")),
				AnyView(Text("444444")),
				AnyView(Text("555555")),
				AnyView(Text("111111")),
				AnyView(Text("222222")),
				AnyView(Text("333333")),
				AnyView(Text("444444")),
				AnyView(Text("555555")),
				AnyView(Text("111111")),
				AnyView(Text("222222")),
				AnyView(Text("333333")),
				AnyView(Text("444444")),
				AnyView(Text("555555"))
			]).eraseToAnyPublisher()
		}

		init() {
			print(#file)
		}

		var body: some View {
			InfiniteList.Item(delegate: self)
		}
	}
}

struct ExploreViewScreenPreviews: PreviewProvider {
    static var previews: some View {
		Explore.ViewScreen()
    }
}
