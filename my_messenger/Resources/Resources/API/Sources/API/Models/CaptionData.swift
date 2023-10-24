//
// CaptionData.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct CaptionData: Codable, JSONEncodable, Hashable {

    /** ID of this caption */
    public var id: String?
    /** Caption creation UNIX timestamp */
    public var createdTime: String?
    /** Caption text */
    public var text: String?
    public var from: UserShortInfo?

    public init(id: String? = nil, createdTime: String? = nil, text: String? = nil, from: UserShortInfo? = nil) {
        self.id = id
        self.createdTime = createdTime
        self.text = text
        self.from = from
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case createdTime = "created_time"
        case text
        case from
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(createdTime, forKey: .createdTime)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(from, forKey: .from)
    }
}
