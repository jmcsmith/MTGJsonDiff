//
//  Meta.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct Meta: Codable {
    let date: String?
    let version: String?
    
    enum CodingKeys: String, CodingKey {
        case date = "date"
        case version = "version"
    }
}