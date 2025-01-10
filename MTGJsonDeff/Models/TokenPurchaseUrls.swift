//
//  TokenPurchaseUrls.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct TokenPurchaseUrls: Codable {
    let cardKingdom: String?
    let cardKingdomFoil: String?
    let tcgplayer: String?
    
    enum CodingKeys: String, CodingKey {
        case cardKingdom = "cardKingdom"
        case cardKingdomFoil = "cardKingdomFoil"
        case tcgplayer = "tcgplayer"
    }
}
extension TokenPurchaseUrls {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(TokenPurchaseUrls.self, from: data)
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
        tcgplayer: String?? = nil
    ) -> TokenPurchaseUrls {
        return TokenPurchaseUrls(
            cardKingdom: cardKingdom ?? self.cardKingdom,
            cardKingdomFoil: cardKingdomFoil ?? self.cardKingdomFoil,
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
