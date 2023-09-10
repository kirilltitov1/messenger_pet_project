//
//  AvailabilityFeatureKey+remote.swift
//  my_messenger
//
//  Created by Kirill Titov on 07.09.2023.
//

extension AvailabilityFeatureKey {
	var remote: String? {
		switch self {
		case .swiftUIEnabled,
				.RXSwiftEnabled:
			return nil
		}
	}
}
