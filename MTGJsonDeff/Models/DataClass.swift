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