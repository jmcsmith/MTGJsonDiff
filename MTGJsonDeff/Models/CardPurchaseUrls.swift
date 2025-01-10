//
//  CardPurchaseUrls.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct CardPurchaseUrls: Codable {
    let cardKingdom: String?
    let cardKingdomFoil: String?
    let cardmarket: String?
    let tcgplayer: String?
    
    enum CodingKeys: String, CodingKey {
        case cardKingdom = "cardKingdom"
        case cardKingdomFoil = "cardKingdomFoil"
        case cardmarket = "cardmarket"
        case tcgplayer = "tcgplayer"
    }
}
extension CardPurchaseUrls {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CardPurchaseUrls.self, from: data)
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
        cardKingdom: String?? = nil,
        cardKingdomFoil: String?? = nil,
        cardmarket: String?? = nil,
        tcgplayer: String?? = nil
    ) -> CardPurchaseUrls {
        return CardPurchaseUrls(
            cardKingdom: cardKingdom ?? self.cardKingdom,
            cardKingdomFoil: cardKingdomFoil ?? self.cardKingdomFoil,
            cardmarket: cardmarket ?? self.cardmarket,
            tcgplayer: tcgplayer ?? self.tcgplayer
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
