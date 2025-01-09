//
//  DataBooster.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct DataBooster: Codable {
    let boosterDefault: Default?
    
    enum CodingKeys: String, CodingKey {
        case boosterDefault = "default"
    }
}