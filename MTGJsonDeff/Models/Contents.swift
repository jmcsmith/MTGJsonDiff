//
//  Contents.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct Contents: Codable {
    let common: Int?
    let land: Int?
    let rareMythic: Int?
    let uncommon: Int?
    let foil: Int?
    let rare: Int?
    let basic: Int?
    let unhingedFoil: Int?
    
    enum CodingKeys: String, CodingKey {
        case common = "common"
        case land = "land"
        case rareMythic = "rareMythic"
        case uncommon = "uncommon"
        case foil = "foil"
        case rare = "rare"
        case basic = "basic"
        case unhingedFoil = "unhingedFoil"
    }
}