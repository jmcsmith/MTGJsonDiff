//
//  UpdateDTO.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 12/5/23.
//

import Foundation

final class UpdateDTO: Codable {
    var updateDate: Date = Date()
    var sets: [UpdateSetDTO] = []
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
final class UpdateSetDTO: Codable {
    var code: String
    var cards: [UpdateCardDTO] = []
    
    init(code: String) {
        self.code = code
    }
}
final class UpdateCardDTO: Codable {
    var uuid: String
    var json: String
    
    init(uuid: String, json: String) {
        self.uuid = uuid
        self.json = json
    }
}
