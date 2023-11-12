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
		@State private var selectedTab: Int = 0
		private let cancelBag = CancelBag()

		init(
			selectedTab: Int = 0
		) {
			self._selectedTab = State(initialValue: selectedTab)
		}

		var body: some View {
			tabView
		}

		private var tabView: some View {
			TabView(selection: $selectedTab) {
				Home.ViewScreen()
				Explore.ViewScreen()
				Camera.ViewScreen()
				Notifications.ViewScreen()
				Profile.ViewScreen()
			}.navigationBarHidden(true)
		}
	}
}

struct MainScreen_Previews: PreviewProvider {
	static var previews: some View {
		Main.Screen()
	}
}
