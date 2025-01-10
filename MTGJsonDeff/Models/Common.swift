//
//  Common.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct Common: Codable {
    let balanceColors: Bool?
    let cards: [String: Int]?
    let foil: Bool?
    let totalWeight: Int?
    
    enum CodingKeys: String, CodingKey {
        case balanceColors = "balanceColors"
        case cards = "cards"
        case foil = "foil"
        case totalWeight = "totalWeight"
    }
}
extension Common {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Common.self, from: data)
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
        balanceColors: Bool?? = nil,
        cards: [String: Int]?? = nil,
        foil: Bool?? = nil,
        totalWeight: Int?? = nil
    ) -> Common {
        return Common(
            balanceColors: balanceColors ?? self.balanceColors,
            cards: cards ?? self.cards,
            foil: foil ?? self.foil,
            totalWeight: totalWeight ?? self.totalWeight
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
