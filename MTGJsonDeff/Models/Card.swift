//
//  Card.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct Card: Codable {
    let artist: String?
    let availability: [String]?
    let borderColor: String?
    let colorIdentity: [String]?
    let colors: [String]?
    let convertedManaCost: Double?
    let edhrecRank: Int?
    let flavorText: String?
    let foreignData: [ForeignDatum]?
    let frameVersion: String?
    let hasFoil: Bool?
    let hasNonFoil: Bool?
    let identifiers: CardIdentifiers?
    let isReprint: Bool?
    let layout: String?
    let legalities: CardLegalities?
    let manaCost: String?
    let name: String?
    let number: String?
    let originalText: String?
    let originalType: String?
    let printings: [String]?
    let purchaseUrls: CardPurchaseUrls?
    let rarity: String?
    let rulings: [Ruling]?
    let setCode: String?
    let subtypes: [String]?
    let supertypes: [String]?
    let text: String?
    let type: String?
    let types: [String]?
    let uuid: String?
    let watermark: String?
    let keywords: [String]?
    let power: String?
    let toughness: String?
    let variations: [String]?
    let faceConvertedManaCost: Int?
    let faceName: String?
    let otherFaceIDS: [String]?
    let side: String?
    let isStarter: Bool?
    let leadershipSkills: LeadershipSkills?
    let loyalty: String?
    let isStorySpotlight: Bool?
    let frameEffects: [String]?
    let hasAlternativeDeckLimit: Bool?
    let isPromo: Bool?
    let promoTypes: [String]?
    let isAlternative: Bool?
    let isFullArt: Bool?
    let asciiName: String?
    let isReserved: Bool?
    
    enum CodingKeys: String, CodingKey {
        case artist = "artist"
        case availability = "availability"
        case borderColor = "borderColor"
        case colorIdentity = "colorIdentity"
        case colors = "colors"
        case convertedManaCost = "convertedManaCost"
        case edhrecRank = "edhrecRank"
        case flavorText = "flavorText"
        case foreignData = "foreignData"
        case frameVersion = "frameVersion"
        case hasFoil = "hasFoil"
        case hasNonFoil = "hasNonFoil"
        case identifiers = "identifiers"
        case isReprint = "isReprint"
        case layout = "layout"
        case legalities = "legalities"
        case manaCost = "manaCost"
        case name = "name"
        case number = "number"
        case originalText = "originalText"
        case originalType = "originalType"
        case printings = "printings"
        case purchaseUrls = "purchaseUrls"
        case rarity = "rarity"
        case rulings = "rulings"
        case setCode = "setCode"
        case subtypes = "subtypes"
        case supertypes = "supertypes"
        case text = "text"
        case type = "type"
        case types = "types"
        case uuid = "uuid"
        case watermark = "watermark"
        case keywords = "keywords"
        case power = "power"
        case toughness = "toughness"
        case variations = "variations"
        case faceConvertedManaCost = "faceConvertedManaCost"
        case faceName = "faceName"
        case otherFaceIDS = "otherFaceIds"
        case side = "side"
        case isStarter = "isStarter"
        case leadershipSkills = "leadershipSkills"
        case loyalty = "loyalty"
        case isStorySpotlight = "isStorySpotlight"
        case frameEffects = "frameEffects"
        case hasAlternativeDeckLimit = "hasAlternativeDeckLimit"
        case isPromo = "isPromo"
        case promoTypes = "promoTypes"
        case isAlternative = "isAlternative"
        case isFullArt = "isFullArt"
        case asciiName = "asciiName"
        case isReserved = "isReserved"
    }
}