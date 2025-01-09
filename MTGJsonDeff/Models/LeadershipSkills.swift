//
//  LeadershipSkills.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct LeadershipSkills: Codable {
    let brawl: Bool?
    let commander: Bool?
    let oathbreaker: Bool?
    
    enum CodingKeys: String, CodingKey {
        case brawl = "brawl"
        case commander = "commander"
        case oathbreaker = "oathbreaker"
    }
}