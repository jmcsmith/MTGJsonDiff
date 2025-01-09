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