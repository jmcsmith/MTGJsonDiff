//
//  Token.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct Token: Codable {
    let artist: String?
    let availability: [String]?
    let borderColor: String?
    let colorIdentity: [String]?
    let colors: [String]?
    let frameVersion: String?
    let hasFoil: Bool?
    let hasNonFoil: Bool?
    let identifiers: TokenIdentifiers?
    let keywords: [String]?
    let layout: String?
    let name: String?
    let number: String?
    let power: String?
    let reverseRelated: [String]?
    let setCode: String?
    let subtypes: [String]?
    let supertypes: [String]?
    let text: String?
    let toughness: String?
    let type: String?
    let types: [String]?
    let uuid: String?
    let watermark: String?
    let isReprint: Bool?
    let convertedManaCost: Int?
    let edhrecRank: Int?
    let flavorText: String?
    let foreignData: [JSONAny]?
    let isPromo: Bool?
    let isStarter: Bool?
    let legalities: TokenLegalities?
    let manaCost: String?
    let printings: [String]?
    let promoTypes: [String]?
    let purchaseUrls: TokenPurchaseUrls?
    let rarity: String?
    let rulings: [Ruling]?
    let isFullArt: Bool?
    let variations: [String]?
    let frameEffects: [String]?
    let leadershipSkills: LeadershipSkills?
    let originalReleaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case artist = "artist"
        case availability = "availability"
        case borderColor = "borderColor"
        case colorIdentity = "colorIdentity"
        case colors = "colors"
        case frameVersion = "frameVersion"
        case hasFoil = "hasFoil"
        case hasNonFoil = "hasNonFoil"
        case identifiers = "identifiers"
        case keywords = "keywords"
        case layout = "layout"
        case name = "name"
        case number = "number"
        case power = "power"
        case reverseRelated = "reverseRelated"
        case setCode = "setCode"
        case subtypes = "subtypes"
        case supertypes = "supertypes"
        case text = "text"
        case toughness = "toughness"
        case type = "type"
        case types = "types"
        case uuid = "uuid"
        case watermark = "watermark"
        case isReprint = "isReprint"
        case convertedManaCost = "convertedManaCost"
        case edhrecRank = "edhrecRank"
        case flavorText = "flavorText"
        case foreignData = "foreignData"
        case isPromo = "isPromo"
        case isStarter = "isStarter"
        case legalities = "legalities"
        case manaCost = "manaCost"
        case printings = "printings"
        case promoTypes = "promoTypes"
        case purchaseUrls = "purchaseUrls"
        case rarity = "rarity"
        case rulings = "rulings"
        case isFullArt = "isFullArt"
        case variations = "variations"
        case frameEffects = "frameEffects"
        case leadershipSkills = "leadershipSkills"
        case originalReleaseDate = "originalReleaseDate"
    }
}