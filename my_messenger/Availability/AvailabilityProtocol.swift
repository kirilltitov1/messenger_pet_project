//
//  AvailabilityProtocol.swift
//  my_messenger
//
//  Created by Kirill Titov on 06.09.2023.
//

protocol AvailabilityProtocol {
	func isAvailable(featureKey: AvailabilityFeatureKey) -> Bool
}
