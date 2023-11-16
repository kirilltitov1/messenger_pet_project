//
//  ConversationView.swift
//  
//
//  Created by Титов Кирилл Иванович on 14.11.2023.
//

import SwiftUI

struct ConversationView: View {
	let usernames: [String] = ["John", "Mary", "Will"]

	@State var otherUsername: String = ""
	@State var showChat = false

    var body: some View {
		NavigationView {
			ScrollView(.vertical) {
				ForEach(usernames, id: \.self) { name in
					NavigationLink(destination: ChatView(userName: name)) {
						HStack {
							Circle()
								.frame(width: 65, height: 65)
								.foregroundColor(Color.pink)

							Text(name)
								.bold()
								.foregroundColor(Color(.label))
								.font(.system(size: 32))
								.padding(8)

							Spacer()
						}
						.padding()
					}
				}
			}
			.navigationTitle("Conversations")
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					NavigationLink(
						destination: SearchView { name in
							self.otherUsername = name
							self.showChat = true
						}
					) {
						Image(systemName: "magnifyingglass")
					}
				}
			}

			if !otherUsername.isEmpty {
				NavigationLink(
					"",
					destination: ChatView(userName: otherUsername),
					isActive: $showChat
				)
			}
		}
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
		ConversationView()
    }
}
