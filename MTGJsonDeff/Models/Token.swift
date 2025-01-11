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

extension Token {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Token.self, from: data)
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
        frameVersion: String?? = nil,
        hasFoil: Bool?? = nil,
        hasNonFoil: Bool?? = nil,
        identifiers: TokenIdentifiers?? = nil,
        keywords: [String]?? = nil,
        layout: String?? = nil,
        name: String?? = nil,
        number: String?? = nil,
        power: String?? = nil,
        reverseRelated: [String]?? = nil,
        setCode: String?? = nil,
        subtypes: [String]?? = nil,
        supertypes: [String]?? = nil,
        text: String?? = nil,
        toughness: String?? = nil,
        type: String?? = nil,
        types: [String]?? = nil,
        uuid: String?? = nil,
        watermark: String?? = nil,
        isReprint: Bool?? = nil,
        convertedManaCost: Int?? = nil,
        edhrecRank: Int?? = nil,
        flavorText: String?? = nil,
        foreignData: [JSONAny]?? = nil,
        isPromo: Bool?? = nil,
        isStarter: Bool?? = nil,
        legalities: TokenLegalities?? = nil,
        manaCost: String?? = nil,
        printings: [String]?? = nil,
        promoTypes: [String]?? = nil,
        purchaseUrls: TokenPurchaseUrls?? = nil,
        rarity: String?? = nil,
        rulings: [Ruling]?? = nil,
        isFullArt: Bool?? = nil,
        variations: [String]?? = nil,
        frameEffects: [String]?? = nil,
        leadershipSkills: LeadershipSkills?? = nil,
        originalReleaseDate: String?? = nil
    ) -> Token {
        return Token(
            artist: artist ?? self.artist,
            availability: availability ?? self.availability,
            borderColor: borderColor ?? self.borderColor,
            colorIdentity: colorIdentity ?? self.colorIdentity,
            colors: colors ?? self.colors,
            frameVersion: frameVersion ?? self.frameVersion,
            hasFoil: hasFoil ?? self.hasFoil,
            hasNonFoil: hasNonFoil ?? self.hasNonFoil,
            identifiers: identifiers ?? self.identifiers,
            keywords: keywords ?? self.keywords,
            layout: layout ?? self.layout,
            name: name ?? self.name,
            number: number ?? self.number,
            power: power ?? self.power,
            reverseRelated: reverseRelated ?? self.reverseRelated,
            setCode: setCode ?? self.setCode,
            subtypes: subtypes ?? self.subtypes,
            supertypes: supertypes ?? self.supertypes,
            text: text ?? self.text,
            toughness: toughness ?? self.toughness,
            type: type ?? self.type,
            types: types ?? self.types,
            uuid: uuid ?? self.uuid,
            watermark: watermark ?? self.watermark,
            isReprint: isReprint ?? self.isReprint,
            convertedManaCost: convertedManaCost ?? self.convertedManaCost,
            edhrecRank: edhrecRank ?? self.edhrecRank,
            flavorText: flavorText ?? self.flavorText,
            foreignData: foreignData ?? self.foreignData,
            isPromo: isPromo ?? self.isPromo,
            isStarter: isStarter ?? self.isStarter,
            legalities: legalities ?? self.legalities,
            manaCost: manaCost ?? self.manaCost,
            printings: printings ?? self.printings,
            promoTypes: promoTypes ?? self.promoTypes,
            purchaseUrls: purchaseUrls ?? self.purchaseUrls,
            rarity: rarity ?? self.rarity,
            rulings: rulings ?? self.rulings,
            isFullArt: isFullArt ?? self.isFullArt,
            variations: variations ?? self.variations,
            frameEffects: frameEffects ?? self.frameEffects,
            leadershipSkills: leadershipSkills ?? self.leadershipSkills,
            originalReleaseDate: originalReleaseDate ?? self.originalReleaseDate
        )
    }
    
    func compareTo(token: Token) -> Bool {
        if artist != token.artist ||
            availability != token.availability ||
            borderColor != token.borderColor ||
            colorIdentity != token.colorIdentity ||
            colors?.count != token.colors?.count ||
            convertedManaCost != token.convertedManaCost ||
            flavorText != token.flavorText ||
            foreignData?.count != token.foreignData?.count ||
            frameVersion != token.frameVersion ||
            hasFoil != token.hasFoil ||
            hasNonFoil != token.hasNonFoil ||
            isReprint != token.isReprint ||
            layout != token.layout ||
            manaCost != token.manaCost ||
            name != token.name ||
            number != token.number ||
            printings?.count != token.printings?.count ||
            rarity != token.rarity ||
            rulings?.count != token.rulings?.count ||
            setCode != token.setCode ||
            subtypes?.count != token.subtypes?.count ||
            supertypes?.count != token.supertypes?.count ||
            text != token.text ||
            type != token.type ||
            types?.count != token.types?.count ||
            uuid != token.uuid ||
            watermark != token.watermark ||
            keywords?.count != token.keywords?.count ||
            power != token.power ||
            toughness != token.toughness ||
            variations?.count != token.variations?.count ||
            isStarter != token.isStarter ||
            frameEffects?.count != token.frameEffects?.count ||
            isPromo != token.isPromo ||
            promoTypes?.count != token.promoTypes?.count ||
            isFullArt != token.isFullArt ||
            leadershipSkills?.brawl != token.leadershipSkills?.brawl ||
            leadershipSkills?.commander != token.leadershipSkills?.commander ||
            leadershipSkills?.oathbreaker != token.leadershipSkills?.oathbreaker ||
//            purchaseUrls?.cardKingdom != card.purchaseUrls?.cardKingdom ||
            //purchaseUrls?.cardKingdomFoil != card.purchaseUrls?.cardKingdomFoil ||
            purchaseUrls?.tcgplayer != token.purchaseUrls?.tcgplayer ||
            legalities?.commander != token.legalities?.commander ||
            legalities?.duel != token.legalities?.duel ||
            legalities?.historic != token.legalities?.historic ||
            legalities?.legacy != token.legalities?.legacy ||
            legalities?.modern != token.legalities?.modern ||
            legalities?.penny != token.legalities?.penny ||
            legalities?.pioneer != token.legalities?.pioneer ||
            legalities?.vintage != token.legalities?.vintage ||
            //identifiers?.cardKingdomFoilID != card.identifiers?.cardKingdomFoilID ||
//            identifiers?.cardKingdomID != card.identifiers?.cardKingdomID ||

            identifiers?.mtgjsonV4ID != token.identifiers?.mtgjsonV4ID ||

            identifiers?.scryfallID != token.identifiers?.scryfallID ||
            identifiers?.scryfallIllustrationID != token.identifiers?.scryfallIllustrationID ||
            identifiers?.scryfallOracleID != token.identifiers?.scryfallOracleID ||
            identifiers?.tcgplayerProductID != token.identifiers?.tcgplayerProductID
            {
            return false
        } else {
            //promoTypes: [String]?? = nil,
            if let pt = promoTypes?.sorted(), let oldpt = token.promoTypes?.sorted() {
                if !pt.elementsEqual(oldpt) {
                    return false
                }
            }
            //frameEffects: [String]?? = nil,
            if let n = frameEffects?.sorted(), let old = token.frameEffects?.sorted() {
                if !n.elementsEqual(old) {
                    return false
                }
            }
            //colors: [String]?? = nil,
            if let n = colors?.sorted(), let old = token.colors?.sorted() {
                if !n.elementsEqual(old) {
                    return false
                }
            }
            //variations: [String]?? = nil,
            if let n = variations?.sorted(), let old = token.variations?.sorted() {
                if !n.elementsEqual(old) {
                    return false
                }
            }
            //keywords: [String]?? = nil,
            if let n = keywords?.sorted(), let old = token.keywords?.sorted() {
                if !n.elementsEqual(old) {
                    return false
                }
            }
            //types: [String]?? = nil,
            if let n = types?.sorted(), let old = token.types?.sorted() {
                if !n.elementsEqual(old) {
                    return false
                }
            }
            //supertypes: [String]?? = nil,
            if let n = supertypes?.sorted(), let old = token.supertypes?.sorted() {
                if !n.elementsEqual(old) {
                    return false
                }
            }
            //subtypes: [String]?? = nil,
            if let n = subtypes?.sorted(), let old = token.subtypes?.sorted() {
                if !n.elementsEqual(old) {
                    return false
                }
            }
            //printings: [String]?? = nil,
            if let n = printings?.sorted(), let old = token.printings?.sorted() {
                if !n.elementsEqual(old) {
                    return false
                }
            }
            if let newRulings = rulings, let oldRulings = token.rulings {
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
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
