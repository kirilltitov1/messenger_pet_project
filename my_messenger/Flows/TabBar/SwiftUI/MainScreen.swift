//
//  MainScreen.swift
//  my_messenger
//
//  Created by Kirill Titov on 13.09.2023.
//

import SwiftUI
import DesignSystem

extension Main {

	struct Screen: View {

		//TODO: добавить состояние из бд по закрытию приложения
		@State private var selectedTab: Int = 1
		private let cancelBag = CancelBag()

		init(
			selectedTab: Int = 1
		) {
			self.selectedTab = selectedTab
		}

		var body: some View {
			TabView(selection: $selectedTab) {
				tabItems
			}.navigationBarHidden(true)
		}

		private var tabItems: some View {
			Main.Factory(cancelBag: cancelBag).makeSwiftUIMain()
		}
	}
}

struct MainScreen_Previews: PreviewProvider {
	static var previews: some View {
		Main.Screen()
	}
}
