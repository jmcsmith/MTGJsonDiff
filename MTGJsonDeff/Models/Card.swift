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
extension Card {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Card.self, from: data)
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
        artist: String?? = nil,
        availability: [String]?? = nil,
        borderColor: String?? = nil,
        colorIdentity: [String]?? = nil,
        colors: [String]?? = nil,
        convertedManaCost: Double?? = nil,
        edhrecRank: Int?? = nil,
        flavorText: String?? = nil,
        foreignData: [ForeignDatum]?? = nil,
        frameVersion: String?? = nil,
        hasFoil: Bool?? = nil,
        hasNonFoil: Bool?? = nil,
        identifiers: CardIdentifiers?? = nil,
        isReprint: Bool?? = nil,
        layout: String?? = nil,
        legalities: CardLegalities?? = nil,
        manaCost: String?? = nil,
        name: String?? = nil,
        number: String?? = nil,
        originalText: String?? = nil,
        originalType: String?? = nil,
        printings: [String]?? = nil,
        purchaseUrls: CardPurchaseUrls?? = nil,
        rarity: String?? = nil,
        rulings: [Ruling]?? = nil,
        setCode: String?? = nil,
        subtypes: [String]?? = nil,
        supertypes: [String]?? = nil,
        text: String?? = nil,
        type: String?? = nil,
        types: [String]?? = nil,
        uuid: String?? = nil,
        watermark: String?? = nil,
        keywords: [String]?? = nil,
        power: String?? = nil,
        toughness: String?? = nil,
        variations: [String]?? = nil,
        faceConvertedManaCost: Int?? = nil,
        faceName: String?? = nil,
        otherFaceIDS: [String]?? = nil,
        side: String?? = nil,
        isStarter: Bool?? = nil,
        leadershipSkills: LeadershipSkills?? = nil,
        loyalty: String?? = nil,
        isStorySpotlight: Bool?? = nil,
        frameEffects: [String]?? = nil,
        hasAlternativeDeckLimit: Bool?? = nil,
        isPromo: Bool?? = nil,
        promoTypes: [String]?? = nil,
        isAlternative: Bool?? = nil,
        isFullArt: Bool?? = nil,
        asciiName: String?? = nil,
        isReserved: Bool?? = nil
    ) -> Card {
        return Card(
            artist: artist ?? self.artist,
            availability: availability ?? self.availability,
            borderColor: borderColor ?? self.borderColor,
            colorIdentity: colorIdentity ?? self.colorIdentity,
            colors: colors ?? self.colors,
            convertedManaCost: convertedManaCost ?? self.convertedManaCost,
            edhrecRank: edhrecRank ?? self.edhrecRank,
            flavorText: flavorText ?? self.flavorText,
            foreignData: foreignData ?? self.foreignData,
            frameVersion: frameVersion ?? self.frameVersion,
            hasFoil: hasFoil ?? self.hasFoil,
            hasNonFoil: hasNonFoil ?? self.hasNonFoil,
            identifiers: identifiers ?? self.identifiers,
            isReprint: isReprint ?? self.isReprint,
            layout: layout ?? self.layout,
            legalities: legalities ?? self.legalities,
            manaCost: manaCost ?? self.manaCost,
            name: name ?? self.name,
            number: number ?? self.number,
            originalText: originalText ?? self.originalText,
            originalType: originalType ?? self.originalType,
            printings: printings ?? self.printings,
            purchaseUrls: purchaseUrls ?? self.purchaseUrls,
            rarity: rarity ?? self.rarity,
            rulings: rulings ?? self.rulings,
            setCode: setCode ?? self.setCode,
            subtypes: subtypes ?? self.subtypes,
            supertypes: supertypes ?? self.supertypes,
            text: text ?? self.text,
            type: type ?? self.type,
            types: types ?? self.types,
            uuid: uuid ?? self.uuid,
            watermark: watermark ?? self.watermark,
            keywords: keywords ?? self.keywords,
            power: power ?? self.power,
            toughness: toughness ?? self.toughness,
            variations: variations ?? self.variations,
            faceConvertedManaCost: faceConvertedManaCost ?? self.faceConvertedManaCost,
            faceName: faceName ?? self.faceName,
            otherFaceIDS: otherFaceIDS ?? self.otherFaceIDS,
            side: side ?? self.side,
            isStarter: isStarter ?? self.isStarter,
            leadershipSkills: leadershipSkills ?? self.leadershipSkills,
            loyalty: loyalty ?? self.loyalty,
            isStorySpotlight: isStorySpotlight ?? self.isStorySpotlight,
            frameEffects: frameEffects ?? self.frameEffects,
            hasAlternativeDeckLimit: hasAlternativeDeckLimit ?? self.hasAlternativeDeckLimit,
            isPromo: isPromo ?? self.isPromo,
            promoTypes: promoTypes ?? self.promoTypes,
            isAlternative: isAlternative ?? self.isAlternative,
            isFullArt: isFullArt ?? self.isFullArt,
            asciiName: asciiName ?? self.asciiName,
            isReserved: isReserved ?? self.isReserved
        )
    }
    
    func jsonData() throws -> Data {
        
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
    func compareTo(card: Card) -> Bool {
        if artist != card.artist ||
            availability != card.availability ||
            borderColor != card.borderColor ||
            colorIdentity != card.colorIdentity ||
            colors?.count != card.colors?.count ||
            convertedManaCost != card.convertedManaCost ||
            flavorText != card.flavorText ||
            foreignData?.count != card.foreignData?.count ||
            frameVersion != card.frameVersion ||
            hasFoil != card.hasFoil ||
            hasNonFoil != card.hasNonFoil ||
            isReprint != card.isReprint ||
            layout != card.layout ||
            manaCost != card.manaCost ||
            name != card.name ||
            number != card.number ||
            originalText != card.originalText ||
            originalType != card.originalType ||
            printings?.count != card.printings?.count ||
            rarity != card.rarity ||
            rulings?.count != card.rulings?.count ||
            setCode != card.setCode ||
            subtypes?.count != card.subtypes?.count ||
            supertypes?.count != card.supertypes?.count ||
            text != card.text ||
            type != card.type ||
            types?.count != card.types?.count ||
            uuid != card.uuid ||
            watermark != card.watermark ||
            keywords?.count != card.keywords?.count ||
            power != card.power ||
            toughness != card.toughness ||
            variations?.count != card.variations?.count ||
            faceConvertedManaCost != card.faceConvertedManaCost ||
            faceName != card.faceName ||
            otherFaceIDS?.count != card.otherFaceIDS?.count ||
            side != card.side ||
            isStarter != card.isStarter ||
            loyalty != card.loyalty ||
            isStorySpotlight != card.isStorySpotlight ||
            frameEffects?.count != card.frameEffects?.count ||
            hasAlternativeDeckLimit != card.hasAlternativeDeckLimit ||
            isPromo != card.isPromo ||
            promoTypes?.count != card.promoTypes?.count ||
            isAlternative != card.isAlternative ||
            isFullArt != card.isFullArt ||
            asciiName != card.asciiName ||
            leadershipSkills?.brawl != card.leadershipSkills?.brawl ||
            leadershipSkills?.commander != card.leadershipSkills?.commander ||
            leadershipSkills?.oathbreaker != card.leadershipSkills?.oathbreaker ||
            purchaseUrls?.cardmarket != card.purchaseUrls?.cardmarket ||
//            purchaseUrls?.cardKingdom != card.purchaseUrls?.cardKingdom ||
            //purchaseUrls?.cardKingdomFoil != card.purchaseUrls?.cardKingdomFoil ||
            purchaseUrls?.tcgplayer != card.purchaseUrls?.tcgplayer ||
            legalities?.brawl != card.legalities?.brawl ||
            legalities?.commander != card.legalities?.commander ||
            legalities?.duel != card.legalities?.duel ||
            legalities?.future != card.legalities?.future ||
            legalities?.historic != card.legalities?.historic ||
            legalities?.legacy != card.legalities?.legacy ||
            legalities?.modern != card.legalities?.modern ||
            legalities?.pauper != card.legalities?.pauper ||
            legalities?.penny != card.legalities?.penny ||
            legalities?.pioneer != card.legalities?.pioneer ||
            legalities?.standard != card.legalities?.standard ||
            legalities?.vintage != card.legalities?.vintage ||
            //identifiers?.cardKingdomFoilID != card.identifiers?.cardKingdomFoilID ||
//            identifiers?.cardKingdomID != card.identifiers?.cardKingdomID ||
            identifiers?.mcmID != card.identifiers?.mcmID ||
            identifiers?.mcmMetaID != card.identifiers?.mcmMetaID ||
            identifiers?.mtgArenaID != card.identifiers?.mtgArenaID ||
            identifiers?.mtgjsonV4ID != card.identifiers?.mtgjsonV4ID ||
            identifiers?.mtgoFoilID != card.identifiers?.mtgoFoilID ||
            identifiers?.mtgoID != card.identifiers?.mtgoID ||
            identifiers?.multiverseID != card.identifiers?.multiverseID ||
            identifiers?.scryfallID != card.identifiers?.scryfallID ||
            identifiers?.scryfallIllustrationID != card.identifiers?.scryfallIllustrationID ||
            identifiers?.scryfallOracleID != card.identifiers?.scryfallOracleID ||
            identifiers?.tcgplayerProductID != card.identifiers?.tcgplayerProductID
            {
            return false
        } else {
            //promoTypes: [String]?? = nil,
            if let pt = promoTypes?.sorted(), let oldpt = card.promoTypes?.sorted() {
                if !pt.elementsEqual(oldpt) {
                    return false
                }
            }
            //frameEffects: [String]?? = nil,
            if let n = frameEffects?.sorted(), let old = card.frameEffects?.sorted() {
                if !n.elementsEqual(old) {
                    return false
                }
            }
            //colors: [String]?? = nil,
            if let n = colors?.sorted(), let old = card.colors?.sorted() {
                if !n.elementsEqual(old) {
                    return false
                }
            }
            //otherFaceIDS: [String]?? = nil,
            if let n = otherFaceIDS?.sorted(), let old = card.otherFaceIDS?.sorted() {
                if !n.elementsEqual(old) {
                    return false
                }
            }
            //variations: [String]?? = nil,
            if let n = variations?.sorted(), let old = card.variations?.sorted() {
                if !n.elementsEqual(old) {
                    return false
                }
            }
            //keywords: [String]?? = nil,
            if let n = keywords?.sorted(), let old = card.keywords?.sorted() {
                if !n.elementsEqual(old) {
                    return false
                }
            }
            //types: [String]?? = nil,
            if let n = types?.sorted(), let old = card.types?.sorted() {
                if !n.elementsEqual(old) {
                    return false
                }
            }
            //supertypes: [String]?? = nil,
            if let n = supertypes?.sorted(), let old = card.supertypes?.sorted() {
                if !n.elementsEqual(old) {
                    return false
                }
            }
            //subtypes: [String]?? = nil,
            if let n = subtypes?.sorted(), let old = card.subtypes?.sorted() {
                if !n.elementsEqual(old) {
                    return false
                }
            }
            //printings: [String]?? = nil,
            if let n = printings?.sorted(), let old = card.printings?.sorted() {
                if !n.elementsEqual(old) {
                    return false
                }
            }
            if let newRulings = rulings, let oldRulings = card.rulings {
                for ruling in newRulings {
                    let old = oldRulings.first(where: { $0.date == ruling.date && $0.text == ruling.text })
                    if old != nil {
                        continue
                    } else {
                        return false
                    }
                }
            }
            return true
        }
    }
}
