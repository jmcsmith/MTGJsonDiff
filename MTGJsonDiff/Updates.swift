// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let updates = try Updates(json)

//
// To read values from URLs:
//
//   let task = URLSession.shared.updatesTask(with: url) { updates, response, error in
//     if let updates = updates {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Updates
struct Updates: Codable {
    var updates: [Update]?
}

// MARK: Updates convenience initializers and mutators

extension Updates {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Updates.self, from: data)
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
        updates: [Update]?? = nil
    ) -> Updates {
        return Updates(
            updates: updates ?? self.updates
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.updateTask(with: url) { update, response, error in
//     if let update = update {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Update
struct Update: Codable {
    var date: Date?
    var sets: [Set]?
}

// MARK: Update convenience initializers and mutators

extension Update {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Update.self, from: data)
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
        date: Date?? = nil,
        sets: [Set]?? = nil
    ) -> Update {
        return Update(
            date: date ?? self.date,
            sets: sets ?? self.sets
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.setTask(with: url) { set, response, error in
//     if let set = set {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Set
struct Set: Codable {
    var code: String?
    var cardIDs: [String]?
}

// MARK: Set convenience initializers and mutators

extension Set {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Set.self, from: data)
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
        code: String?? = nil,
        cardIDs: [String]?? = nil
    ) -> Set {
        return Set(
            code: code ?? self.code,
            cardIDs: cardIDs ?? self.cardIDs
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders



// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }
    
    func updatesTask(with url: URL, completionHandler: @escaping (Updates?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
