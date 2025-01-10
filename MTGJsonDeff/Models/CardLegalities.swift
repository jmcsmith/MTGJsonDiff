//
//  CardLegalities.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct CardLegalities: Codable {
    let commander: String?
    let duel: String?
    let historic: String?
    let legacy: String?
    let modern: String?
    let pioneer: String?
    let vintage: String?
    let pauper: String?
    let penny: String?
    let brawl: String?
    let future: String?
    let standard: String?
    
    enum CodingKeys: String, CodingKey {
        case commander = "commander"
        case duel = "duel"
        case historic = "historic"
        case legacy = "legacy"
        case modern = "modern"
        case pioneer = "pioneer"
        case vintage = "vintage"
        case pauper = "pauper"
        case penny = "penny"
        case brawl = "brawl"
        case future = "future"
        case standard = "standard"
    }
}
extension CardLegalities {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CardLegalities.self, from: data)
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
        historic: String?? = nil,
        legacy: String?? = nil,
        modern: String?? = nil,
        pioneer: String?? = nil,
        vintage: String?? = nil,
        pauper: String?? = nil,
        penny: String?? = nil,
        brawl: String?? = nil,
        future: String?? = nil,
        standard: String?? = nil
    ) -> CardLegalities {
        return CardLegalities(
            commander: commander ?? self.commander,
            duel: duel ?? self.duel,
            historic: historic ?? self.historic,
            legacy: legacy ?? self.legacy,
            modern: modern ?? self.modern,
            pioneer: pioneer ?? self.pioneer,
            vintage: vintage ?? self.vintage,
            pauper: pauper ?? self.pauper,
            penny: penny ?? self.penny,
            brawl: brawl ?? self.brawl,
            future: future ?? self.future,
            standard: standard ?? self.standard
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
