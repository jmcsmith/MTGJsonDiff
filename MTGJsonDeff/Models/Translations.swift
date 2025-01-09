//
//  Translations.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct Translations: Codable {
    let chineseSimplified: String?
    let chineseTraditional: String?
    let french: String?
    let german: String?
    let italian: String?
    let japanese: String?
    let korean: String?
    let portugueseBrazil: String?
    let russian: String?
    let spanish: String?
    
    enum CodingKeys: String, CodingKey {
        case chineseSimplified = "Chinese Simplified"
        case chineseTraditional = "Chinese Traditional"
        case french = "French"
        case german = "German"
        case italian = "Italian"
        case japanese = "Japanese"
        case korean = "Korean"
        case portugueseBrazil = "Portuguese (Brazil)"
        case russian = "Russian"
        case spanish = "Spanish"
    }
}