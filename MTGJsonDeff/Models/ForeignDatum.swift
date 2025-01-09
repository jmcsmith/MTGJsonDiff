//
//  ForeignDatum.swift
//  MTGJsonDiff
//
//  Created by Joseph Beaudoin on 1/8/25.
//


import Foundation

struct ForeignDatum: Codable {
    let flavorText: String?
    let language: String?
    let multiverseID: Int?
    let name: String?
    let text: String?
    let type: String?
    let faceName: String?
    
    enum CodingKeys: String, CodingKey {
        case flavorText = "flavorText"
        case language = "language"
        case multiverseID = "multiverseId"
        case name = "name"
        case text = "text"
        case type = "type"
        case faceName = "faceName"
    }
}
extension ForeignDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ForeignDatum.self, from: data)
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
        flavorText: String?? = nil,
        language: String?? = nil,
        multiverseID: Int?? = nil,
        name: String?? = nil,
        text: String?? = nil,
        type: String?? = nil,
        faceName: String?? = nil
    ) -> ForeignDatum {
        return ForeignDatum(
            flavorText: flavorText ?? self.flavorText,
            language: language ?? self.language,
            multiverseID: multiverseID ?? self.multiverseID,
            name: name ?? self.name,
            text: text ?? self.text,
            type: type ?? self.type,
            faceName: faceName ?? self.faceName
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
