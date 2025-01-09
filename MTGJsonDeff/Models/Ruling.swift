//
//  Ruling.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct Ruling: Codable {
    let date: String?
    let text: String?
    
    enum CodingKeys: String, CodingKey {
        case date = "date"
        case text = "text"
    }
}