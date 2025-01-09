//
//  Common.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct Common: Codable {
    let balanceColors: Bool?
    let cards: [String: Int]?
    let foil: Bool?
    let totalWeight: Int?
    
    enum CodingKeys: String, CodingKey {
        case balanceColors = "balanceColors"
        case cards = "cards"
        case foil = "foil"
        case totalWeight = "totalWeight"
    }
}