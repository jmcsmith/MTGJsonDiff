//
//  CardIdentifiers.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct CardIdentifiers: Codable {
    let cardKingdomFoilID: String?
    let cardKingdomID: String?
    let mcmID: String?
    let mcmMetaID: String?
    let mtgArenaID: String?
    let mtgjsonV4ID: String?
    let mtgoID: String?
    let multiverseID: String?
    let scryfallID: String?
    let scryfallIllustrationID: String?
    let scryfallOracleID: String?
    let tcgplayerProductID: String?
    let mtgoFoilID: String?
    
    enum CodingKeys: String, CodingKey {
        case cardKingdomFoilID = "cardKingdomFoilId"
        case cardKingdomID = "cardKingdomId"
        case mcmID = "mcmId"
        case mcmMetaID = "mcmMetaId"
        case mtgArenaID = "mtgArenaId"
        case mtgjsonV4ID = "mtgjsonV4Id"
        case mtgoID = "mtgoId"
        case multiverseID = "multiverseId"
        case scryfallID = "scryfallId"
        case scryfallIllustrationID = "scryfallIllustrationId"
        case scryfallOracleID = "scryfallOracleId"
        case tcgplayerProductID = "tcgplayerProductId"
        case mtgoFoilID = "mtgoFoilId"
    }
}
extension CardIdentifiers {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CardIdentifiers.self, from: data)
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
        cardKingdomFoilID: String?? = nil,
        cardKingdomID: String?? = nil,
        mcmID: String?? = nil,
        mcmMetaID: String?? = nil,
        mtgArenaID: String?? = nil,
        mtgjsonV4ID: String?? = nil,
        mtgoID: String?? = nil,
        multiverseID: String?? = nil,
        scryfallID: String?? = nil,
        scryfallIllustrationID: String?? = nil,
        scryfallOracleID: String?? = nil,
        tcgplayerProductID: String?? = nil,
        mtgoFoilID: String?? = nil
    ) -> CardIdentifiers {
        return CardIdentifiers(
            cardKingdomFoilID: cardKingdomFoilID ?? self.cardKingdomFoilID,
            cardKingdomID: cardKingdomID ?? self.cardKingdomID,
            mcmID: mcmID ?? self.mcmID,
            mcmMetaID: mcmMetaID ?? self.mcmMetaID,
            mtgArenaID: mtgArenaID ?? self.mtgArenaID,
            mtgjsonV4ID: mtgjsonV4ID ?? self.mtgjsonV4ID,
            mtgoID: mtgoID ?? self.mtgoID,
            multiverseID: multiverseID ?? self.multiverseID,
            scryfallID: scryfallID ?? self.scryfallID,
            scryfallIllustrationID: scryfallIllustrationID ?? self.scryfallIllustrationID,
            scryfallOracleID: scryfallOracleID ?? self.scryfallOracleID,
            tcgplayerProductID: tcgplayerProductID ?? self.tcgplayerProductID,
            mtgoFoilID: mtgoFoilID ?? self.mtgoFoilID
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
