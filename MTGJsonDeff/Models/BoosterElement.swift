//
//  BoosterElement.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct BoosterElement: Codable {
    let contents: Contents?
    let weight: Int?
    
    enum CodingKeys: String, CodingKey {
        case contents = "contents"
        case weight = "weight"
    }
}