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
		@State private var selectedTab: Int
		private let cancelBag = CancelBag()

		init(

		) {
			self._selectedTab = State(initialValue: 1)
		}

		var body: some View {
			NavigationView {
				tabView

			}.toolbar(.hidden)
		}

		private var tabView: some View {
			TabView(selection: $selectedTab) {
				Explore.ViewScreen()
				Home.ViewScreen()
				Camera.ViewScreen()
				Notifications.ViewScreen()
				Profile.ViewScreen()
			}
		}
	}
}

struct MainScreen_Previews: PreviewProvider {
	static var previews: some View {
		Main.Screen()
	}
}
