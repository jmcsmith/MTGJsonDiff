//
//  DataClass.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct DataClass: Codable {
    let baseSetSize: Int?
    let block: String?
    let booster: DataBooster?
    let cards: [Card]?
    let code: String?
    let isFoilOnly: Bool?
    let isOnlineOnly: Bool?
    let keyruneCode: String?
    let mcmID: Int?
    let mcmName: String?
    let mtgoCode: String?
    let name: String?
    let releaseDate: String?
    let tcgplayerGroupID: Int?
    let tokens: [Token]?
    let totalSetSize: Int?
    let translations: Translations?
    let type: String?
    
    enum CodingKeys: String, CodingKey {
        case baseSetSize = "baseSetSize"
        case block = "block"
        case booster = "booster"
        case cards = "cards"
        case code = "code"
        case isFoilOnly = "isFoilOnly"
        case isOnlineOnly = "isOnlineOnly"
        case keyruneCode = "keyruneCode"
        case mcmID = "mcmId"
        case mcmName = "mcmName"
        case mtgoCode = "mtgoCode"
        case name = "name"
        case releaseDate = "releaseDate"
        case tcgplayerGroupID = "tcgplayerGroupId"
        case tokens = "tokens"
        case totalSetSize = "totalSetSize"
        case translations = "translations"
        case type = "type"
    }
}
extension DataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DataClass.self, from: data)
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
        baseSetSize: Int?? = nil,
        block: String?? = nil,
        booster: DataBooster?? = nil,
        cards: [Card]?? = nil,
        code: String?? = nil,
        isFoilOnly: Bool?? = nil,
        isOnlineOnly: Bool?? = nil,
        keyruneCode: String?? = nil,
        mcmID: Int?? = nil,
        mcmName: String?? = nil,
        mtgoCode: String?? = nil,
        name: String?? = nil,
        releaseDate: String?? = nil,
        tcgplayerGroupID: Int?? = nil,
        tokens: [Token]?? = nil,
        totalSetSize: Int?? = nil,
        translations: Translations?? = nil,
        type: String?? = nil
    ) -> DataClass {
        return DataClass(
            baseSetSize: baseSetSize ?? self.baseSetSize,
            block: block ?? self.block,
            booster: booster ?? self.booster,
            cards: cards ?? self.cards,
            code: code ?? self.code,
            isFoilOnly: isFoilOnly ?? self.isFoilOnly,
            isOnlineOnly: isOnlineOnly ?? self.isOnlineOnly,
            keyruneCode: keyruneCode ?? self.keyruneCode,
            mcmID: mcmID ?? self.mcmID,
            mcmName: mcmName ?? self.mcmName,
            mtgoCode: mtgoCode ?? self.mtgoCode,
            name: name ?? self.name,
            releaseDate: releaseDate ?? self.releaseDate,
            tcgplayerGroupID: tcgplayerGroupID ?? self.tcgplayerGroupID,
            tokens: tokens ?? self.tokens,
            totalSetSize: totalSetSize ?? self.totalSetSize,
            translations: translations ?? self.translations,
            type: type ?? self.type
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
