//
//  TokenIdentifiers.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct TokenIdentifiers: Codable {
    let mtgjsonV4ID: String?
    let scryfallID: String?
    let scryfallIllustrationID: String?
    let scryfallOracleID: String?
    let tcgplayerProductID: String?
    let cardKingdomFoilID: String?
    let cardKingdomID: String?
    
    enum CodingKeys: String, CodingKey {
        case mtgjsonV4ID = "mtgjsonV4Id"
        case scryfallID = "scryfallId"
        case scryfallIllustrationID = "scryfallIllustrationId"
        case scryfallOracleID = "scryfallOracleId"
        case tcgplayerProductID = "tcgplayerProductId"
        case cardKingdomFoilID = "cardKingdomFoilId"
        case cardKingdomID = "cardKingdomId"
    }
}
extension TokenIdentifiers {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(TokenIdentifiers.self, from: data)
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
        mtgjsonV4ID: String?? = nil,
        scryfallID: String?? = nil,
        scryfallIllustrationID: String?? = nil,
        scryfallOracleID: String?? = nil,
        tcgplayerProductID: String?? = nil,
        cardKingdomFoilID: String?? = nil,
        cardKingdomID: String?? = nil
    ) -> TokenIdentifiers {
        return TokenIdentifiers(
            mtgjsonV4ID: mtgjsonV4ID ?? self.mtgjsonV4ID,
            scryfallID: scryfallID ?? self.scryfallID,
            scryfallIllustrationID: scryfallIllustrationID ?? self.scryfallIllustrationID,
            scryfallOracleID: scryfallOracleID ?? self.scryfallOracleID,
            tcgplayerProductID: tcgplayerProductID ?? self.tcgplayerProductID,
            cardKingdomFoilID: cardKingdomFoilID ?? self.cardKingdomFoilID,
            cardKingdomID: cardKingdomID ?? self.cardKingdomID
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
