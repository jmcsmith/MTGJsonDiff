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

extension Translations {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Translations.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        chineseSimplified: String?? = nil,
        chineseTraditional: String?? = nil,
        french: String?? = nil,
        german: String?? = nil,
        italian: String?? = nil,
        japanese: String?? = nil,
        korean: String?? = nil,
        portugueseBrazil: String?? = nil,
        russian: String?? = nil,
        spanish: String?? = nil
    ) -> Translations {
        return Translations(
            chineseSimplified: chineseSimplified ?? self.chineseSimplified,
            chineseTraditional: chineseTraditional ?? self.chineseTraditional,
            french: french ?? self.french,
            german: german ?? self.german,
            italian: italian ?? self.italian,
            japanese: japanese ?? self.japanese,
            korean: korean ?? self.korean,
            portugueseBrazil: portugueseBrazil ?? self.portugueseBrazil,
            russian: russian ?? self.russian,
            spanish: spanish ?? self.spanish
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
