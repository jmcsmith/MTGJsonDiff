//
//  TokenLegalities.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct TokenLegalities: Codable {
    let commander: String?
    let duel: String?
    let legacy: String?
    let modern: String?
    let pioneer: String?
    let vintage: String?
    let penny: String?
    let historic: String?
    
    enum CodingKeys: String, CodingKey {
        case commander = "commander"
        case duel = "duel"
        case legacy = "legacy"
        case modern = "modern"
        case pioneer = "pioneer"
        case vintage = "vintage"
        case penny = "penny"
        case historic = "historic"
    }
}
extension TokenLegalities {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(TokenLegalities.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        commander: String?? = nil,
        duel: String?? = nil,
        legacy: String?? = nil,
        modern: String?? = nil,
        pioneer: String?? = nil,
        vintage: String?? = nil,
        penny: String?? = nil,
        historic: String?? = nil
    ) -> TokenLegalities {
        return TokenLegalities(
            commander: commander ?? self.commander,
            duel: duel ?? self.duel,
            legacy: legacy ?? self.legacy,
            modern: modern ?? self.modern,
            pioneer: pioneer ?? self.pioneer,
            vintage: vintage ?? self.vintage,
            penny: penny ?? self.penny,
            historic: historic ?? self.historic
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
