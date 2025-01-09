//
//  TokenLegalities.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct TokenLegalities: Codable {
    let commander: String?
    let duel: String?
    let legacy: String?
    let modern: String?
    let pioneer: String?
    let vintage: String?
    let penny: String?
    let historic: String?
    
    enum CodingKeys: String, CodingKey {
        case commander = "commander"
        case duel = "duel"
        case legacy = "legacy"
        case modern = "modern"
        case pioneer = "pioneer"
        case vintage = "vintage"
        case penny = "penny"
        case historic = "historic"
    }
}