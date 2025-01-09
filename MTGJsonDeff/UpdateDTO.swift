//
//  UpdateDTO.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 12/5/23.
//

import Foundation

final class UpdateDTO: Codable {
    var newSetCodes: [String] = []
    var updatedCards: [UpdateCardDTO] = []
    var updatedTokens: [UpdateTokenDTO] = []
    var updateDate: Date = Date()
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

struct UpdateCardDTO: Codable {
    var cardUUID: String
    var cardJSON: String
    
    init(cardUUID: String, cardJSON: String) {
        self.cardUUID = cardUUID
        self.cardJSON = cardJSON
    }
}
struct UpdateTokenDTO: Codable {
    var tokenUUID: String
    var tokenJSON: String
    
    init(tokenUUID: String, tokenJSON: String) {
        self.tokenUUID = tokenUUID
        self.tokenJSON = tokenJSON
    }
}
