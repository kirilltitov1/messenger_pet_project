//
//  MainScreen.swift
//  my_messenger
//
//  Created by Kirill Titov on 13.09.2023.
//

import SwiftUI

extension AnyView: Identifiable {
	public var id: UUID {
		UUID()
	}
}

extension Main {

	struct Screen: View {

		//TODO: добавить состояние из бд по закрытию приложения
		@State private var selectedTab: Int = 1
		private let cancelBag = CancelBag()

		var body: some View {
			TabView(selection: $selectedTab) {
				ForEach(Main.Factory(cancelBag: cancelBag).makeSwiftUIMain()) { view in
					view
				}
			}.navigationBarHidden(true)
		}
	}
}

struct MainScreen_Previews: PreviewProvider {
	static var previews: some View {
		Main.Screen()
	}
}
