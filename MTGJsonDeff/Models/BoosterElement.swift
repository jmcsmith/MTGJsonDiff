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
extension BoosterElement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(BoosterElement.self, from: data)
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
        contents: Contents?? = nil,
        weight: Int?? = nil
    ) -> BoosterElement {
        return BoosterElement(
            contents: contents ?? self.contents,
            weight: weight ?? self.weight
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
