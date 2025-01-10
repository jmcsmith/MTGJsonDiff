//
//  Default.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct Default: Codable {
    let boosters: [BoosterElement]?
    let boostersTotalWeight: Int?
    let sheets: Sheets?
    
    enum CodingKeys: String, CodingKey {
        case boosters = "boosters"
        case boostersTotalWeight = "boostersTotalWeight"
        case sheets = "sheets"
    }
}
extension Default {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Default.self, from: data)
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
        boosters: [BoosterElement]?? = nil,
        boostersTotalWeight: Int?? = nil,
        sheets: Sheets?? = nil
    ) -> Default {
        return Default(
            boosters: boosters ?? self.boosters,
            boostersTotalWeight: boostersTotalWeight ?? self.boostersTotalWeight,
            sheets: sheets ?? self.sheets
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
