//
//  AvailabilityProviders.swift
//  my_messenger
//
//  Created by Kirill Titov on 07.09.2023.
//

enum AvailabilityProviderProtocol {
	case local
	case remote
}

extension AvailabilityFeatureKey {
	var providers: [AvailabilityProviderProtocol] {
		switch self {
		case .swiftUIEnabled,
				.RXSwiftEnabled:
			return [.local]
		}
	}
}
