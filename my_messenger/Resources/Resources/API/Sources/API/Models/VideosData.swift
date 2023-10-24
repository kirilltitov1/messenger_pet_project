//
// VideosData.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct VideosData: Codable, JSONEncodable, Hashable {

    public var lowResolution: ImageInfo?
    public var standardResolution: ImageInfo?

    public init(lowResolution: ImageInfo? = nil, standardResolution: ImageInfo? = nil) {
        self.lowResolution = lowResolution
        self.standardResolution = standardResolution
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case lowResolution = "low_resolution"
        case standardResolution = "standard_resolution"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(lowResolution, forKey: .lowResolution)
        try container.encodeIfPresent(standardResolution, forKey: .standardResolution)
    }
}
