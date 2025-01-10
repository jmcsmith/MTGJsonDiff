//
//  LeadershipSkills.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct LeadershipSkills: Codable {
    let brawl: Bool?
    let commander: Bool?
    let oathbreaker: Bool?
    
    enum CodingKeys: String, CodingKey {
        case brawl = "brawl"
        case commander = "commander"
        case oathbreaker = "oathbreaker"
    }
}
extension LeadershipSkills {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(LeadershipSkills.self, from: data)
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
        brawl: Bool?? = nil,
        commander: Bool?? = nil,
        oathbreaker: Bool?? = nil
    ) -> LeadershipSkills {
        return LeadershipSkills(
            brawl: brawl ?? self.brawl,
            commander: commander ?? self.commander,
            oathbreaker: oathbreaker ?? self.oathbreaker
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
