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
extension Ruling {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Ruling.self, from: data)
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
        date: String?? = nil,
        text: String?? = nil
    ) -> Ruling {
        return Ruling(
            date: date ?? self.date,
            text: text ?? self.text
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
