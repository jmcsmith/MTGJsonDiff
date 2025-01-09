//
//  CardLegalities.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct CardLegalities: Codable {
    let commander: String?
    let duel: String?
    let historic: String?
    let legacy: String?
    let modern: String?
    let pioneer: String?
    let vintage: String?
    let pauper: String?
    let penny: String?
    let brawl: String?
    let future: String?
    let standard: String?
    
    enum CodingKeys: String, CodingKey {
        case commander = "commander"
        case duel = "duel"
        case historic = "historic"
        case legacy = "legacy"
        case modern = "modern"
        case pioneer = "pioneer"
        case vintage = "vintage"
        case pauper = "pauper"
        case penny = "penny"
        case brawl = "brawl"
        case future = "future"
        case standard = "standard"
    }
}