//
//  Sheets.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct Sheets: Codable {
    let common: Common?
    let foil: Basic?
    let land: Basic?
    let rareMythic: Basic?
    let uncommon: Basic?
    let rare: Basic?
    let basic: Basic?
    let unhingedFoil: Basic?
    
    enum CodingKeys: String, CodingKey {
        case common = "common"
        case foil = "foil"
        case land = "land"
        case rareMythic = "rareMythic"
        case uncommon = "uncommon"
        case rare = "rare"
        case basic = "basic"
        case unhingedFoil = "unhingedFoil"
    }
}
extension Sheets {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Sheets.self, from: data)
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
        common: Common?? = nil,
        foil: Basic?? = nil,
        land: Basic?? = nil,
        rareMythic: Basic?? = nil,
        uncommon: Basic?? = nil,
        rare: Basic?? = nil,
        basic: Basic?? = nil,
        unhingedFoil: Basic?? = nil
    ) -> Sheets {
        return Sheets(
            common: common ?? self.common,
            foil: foil ?? self.foil,
            land: land ?? self.land,
            rareMythic: rareMythic ?? self.rareMythic,
            uncommon: uncommon ?? self.uncommon,
            rare: rare ?? self.rare,
            basic: basic ?? self.basic,
            unhingedFoil: unhingedFoil ?? self.unhingedFoil
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
