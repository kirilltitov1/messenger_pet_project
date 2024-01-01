//
//  Settings.Localization.swift
//  my_messenger
//
//  Created by Титов Кирилл Иванович on 15.09.2023.
//

import Foundation

protocol SettingsLocalizationProtocol {
	var settings: String { get }
}


extension Localization {
	struct Settings: SettingsLocalizationProtocol {
		var settings: String = "Settings"~
	}
}
