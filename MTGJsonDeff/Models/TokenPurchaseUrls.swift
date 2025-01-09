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