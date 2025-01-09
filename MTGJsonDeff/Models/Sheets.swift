//
//  Sheets.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct Sheets: Codable {
    let common: Common?
    let foil: Basic?
    let land: Basic?
    let rareMythic: Basic?
    let uncommon: Basic?
    let rare: Basic?
    let basic: Basic?
    let unhingedFoil: Basic?
    
    enum CodingKeys: String, CodingKey {
        case common = "common"
        case foil = "foil"
        case land = "land"
        case rareMythic = "rareMythic"
        case uncommon = "uncommon"
        case rare = "rare"
        case basic = "basic"
        case unhingedFoil = "unhingedFoil"
    }
}