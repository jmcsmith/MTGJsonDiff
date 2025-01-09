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