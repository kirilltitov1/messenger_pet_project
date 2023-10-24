//
// UserInPhoto.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct UserInPhoto: Codable, JSONEncodable, Hashable {

    public var position: Position?
    public var user: UserShortInfo?

    public init(position: Position? = nil, user: UserShortInfo? = nil) {
        self.position = position
        self.user = user
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case position
        case user
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(position, forKey: .position)
        try container.encodeIfPresent(user, forKey: .user)
    }
}
