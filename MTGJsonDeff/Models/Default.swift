//
//  Default.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct Default: Codable {
    let boosters: [BoosterElement]?
    let boostersTotalWeight: Int?
    let sheets: Sheets?
    
    enum CodingKeys: String, CodingKey {
        case boosters = "boosters"
        case boostersTotalWeight = "boostersTotalWeight"
        case sheets = "sheets"
    }
}