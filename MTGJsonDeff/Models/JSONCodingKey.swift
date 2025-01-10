//
//  JSONCodingKey.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/10/25.
//


class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
    }
    
    required init?(stringValue: String) {
        key = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    var stringValue: String {
        return key
    }
}