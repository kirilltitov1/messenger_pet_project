//
//  AnalyticsService.swift
//  Instagram
//
//  Created by Kirill Titov on 30.09.2022.
//

import FirebaseAnalytics

protocol AnalyticsEvent {
	var name: String { get }
	var parameters: [String: Any]? { get }
}

protocol AnalyticsServiceProtocol: AnyObject {
	func sendEvent(event: AnalyticsEvent)
}

final class AnalyticsService {
	static let shared: AnalyticsService = {
		let shared = AnalyticsService()
		return shared
	}()

	private init() {}
}

extension AnalyticsService: AnalyticsServiceProtocol {
	func sendEvent(event: AnalyticsEvent) {
		Analytics.logEvent(event.name, parameters: event.parameters)
	}
}
