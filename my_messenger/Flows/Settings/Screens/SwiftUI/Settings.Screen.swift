//
//  Settings.Screen.swift
//  my_messenger
//
//  Created by Титов Кирилл Иванович on 15.09.2023.
//

import SwiftUI

extension Settings {
	struct Screen: View {
		var body: some View {
			VStack {
				Text("Settings")
			}
		}
	}
}

struct SettingsScreenPreviews: PreviewProvider {
    static var previews: some View {
		Settings.Screen()
    }
}
