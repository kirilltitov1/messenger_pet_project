//
//  AvailabilityFacade.swift
//  my_messenger
//
//  Created by Kirill Titov on 06.09.2023.
//

import Foundation

final class AvailabilityFacade: AvailabilityProtocol {
	func isAvailable(featureKey: AvailabilityFeatureKey) -> Bool {
		var result: Bool = true

		for provider in featureKey.providers {
			switch provider {
			default:
				result = false
			}
		}

		return result
	}
}
