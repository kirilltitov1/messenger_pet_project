//
//  SearchView.swift
//  
//
//  Created by Титов Кирилл Иванович on 14.11.2023.
//

import SwiftUI

struct SearchView: View {
	@State var text: String = ""

	let username = ["Name"]
	let completion: ((String) -> Void)

	init(completion: @escaping ((String) -> Void)) {
		self.completion = completion
	}

    var body: some View {
		VStack {
			TextField("Username...", text: $text)
				.modifier(CustomField())
			Button("Search") {

			}
			List {
				ForEach(username, id: \.self) { name in
					HStack {
						Circle()
							.frame(width: 55, height: 55)
							.foregroundColor(Color.green)

						Text(name)
							.font(.system(size: 24))
							.padding()

						Spacer()
					}
					.onTapGesture {
						completion(name)
					}
				}
			}

			Spacer()
		}
		.navigationTitle("Search")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
		SearchView() { _ in }
			.preferredColorScheme(.dark)
    }
}
