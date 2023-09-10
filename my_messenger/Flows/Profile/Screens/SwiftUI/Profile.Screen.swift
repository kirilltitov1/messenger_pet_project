//
//  Profile.Screen.swift
//  my_messenger
//
//  Created by Титов Кирилл Иванович on 14.09.2023.
//

import SwiftUI

extension Profile {
	struct ViewScreen: View {

		private let localization: SettingsLocalizationProtocol = Localization.Settings()

		var body: some View {
			NavigationView {
				Text("112233")
					.toolbar {
						NavigationLink(destination: Settings.Screen()) {
							Text("0000")
						}
					}
			}
		}
	}
}

struct ProfileViewScreenPreviews: PreviewProvider {
    static var previews: some View {
		Profile.ViewScreen()
    }
}
