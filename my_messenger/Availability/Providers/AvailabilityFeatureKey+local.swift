//
//  AvailabilityFeatureKey+local.swift
//  my_messenger
//
//  Created by Kirill Titov on 07.09.2023.
//

extension AvailabilityFeatureKey {
	var local: String {
		switch self {
		case .swiftUIEnabled:
			return "swiftUIEnabled"
		case .RXSwiftEnabled:
			return "RXSwiftEnabled"
		}
	}
}
