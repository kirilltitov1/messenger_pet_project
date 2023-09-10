//
//  Home.Screen.swift
//  my_messenger
//
//  Created by Титов Кирилл Иванович on 14.09.2023.
//

import SwiftUI

extension Home {
	struct ViewScreen: View {
		var body: some View {
			VStack {
				Text("Home")
			}
		}
	}
}

struct HomeViewScreenPreviews: PreviewProvider {
    static var previews: some View {
		Home.ViewScreen()
    }
}
