//
// LocationSearchResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct LocationSearchResponse: Codable, JSONEncodable, Hashable {

    public var meta: MetaData?
    /** List of found locations */
    public var data: [LocationInfo]?

    public init(meta: MetaData? = nil, data: [LocationInfo]? = nil) {
        self.meta = meta
        self.data = data
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case meta
        case data
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(meta, forKey: .meta)
        try container.encodeIfPresent(data, forKey: .data)
    }
}

