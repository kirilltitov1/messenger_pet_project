//
//  String(localized).swift
//  Instagram
//
//  Created by Kirill Titov on 27.10.2022.
//

import Foundation

postfix operator ~
postfix func ~ (string: String) -> String {
	if #available(iOS 15, *) {
		return String(localized: "\(string)", comment: "")
	}
	return NSLocalizedString(string, comment: "")
}
