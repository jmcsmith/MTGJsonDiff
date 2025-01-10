//
//  Contents.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct Contents: Codable {
    let common: Int?
    let land: Int?
    let rareMythic: Int?
    let uncommon: Int?
    let foil: Int?
    let rare: Int?
    let basic: Int?
    let unhingedFoil: Int?
    
    enum CodingKeys: String, CodingKey {
        case common = "common"
        case land = "land"
        case rareMythic = "rareMythic"
        case uncommon = "uncommon"
        case foil = "foil"
        case rare = "rare"
        case basic = "basic"
        case unhingedFoil = "unhingedFoil"
    }
}
extension Contents {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Contents.self, from: data)
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
        common: Int?? = nil,
        land: Int?? = nil,
        rareMythic: Int?? = nil,
        uncommon: Int?? = nil,
        foil: Int?? = nil,
        rare: Int?? = nil,
        basic: Int?? = nil,
        unhingedFoil: Int?? = nil
    ) -> Contents {
        return Contents(
            common: common ?? self.common,
            land: land ?? self.land,
            rareMythic: rareMythic ?? self.rareMythic,
            uncommon: uncommon ?? self.uncommon,
            foil: foil ?? self.foil,
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
