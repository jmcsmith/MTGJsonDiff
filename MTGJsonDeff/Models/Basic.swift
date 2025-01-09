//
//  Basic.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct Basic: Codable {
    let cards: [String: Int]?
    let foil: Bool?
    let totalWeight: Int?
    
    enum CodingKeys: String, CodingKey {
        case cards = "cards"
        case foil = "foil"
        case totalWeight = "totalWeight"
    }
}