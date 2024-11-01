//
//  JsonDownloader.swift
//  MTGJsonDeff
//
//  Created by Joseph Smith on 9/29/20.
//

import Foundation
import Zip

class JsonDownloader {
    func download() {
        print("Run Date: \(Date())")
        print(FileManager.default.currentDirectoryPath)
        var updates = loadUpdatesJson()
        let setFileZipURL = "https://mtgjson.com/api/v5/AllSetFiles.zip"
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy-MM-dd"
        var update = Update()
        update.date = Date()
        update.sets = []
        
        if let url = URL(string: setFileZipURL) {
            do {
                try url.download(to: .downloadsDirectory, overwrite: true){ url, error in
                    guard let url = url else { return }
                    print(url)
                    do {
                        
                        let destinationUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("CurrentJson")
                        try FileManager.default.createDirectory(at: destinationUrl, withIntermediateDirectories: true, attributes: nil)
                        try Zip.unzipFile(url, destination: destinationUrl, overwrite: true, password: nil) // Unzip
                        //var archiveURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("JsonFiles")
                        var archiveURL = URL(fileURLWithPath: "/Volumes/4TB/JsonFiles/")
                        let oldPulls = try FileManager.default.contentsOfDirectory(at: archiveURL, includingPropertiesForKeys: nil).sorted {
                            return $0.lastPathComponent > $1.lastPathComponent
                        }
                        var oldFiles: [URL] = []
                        if let lastpull = oldPulls.first(where: {!$0.lastPathComponent.contains(".DS_Store")}) {
                            oldFiles = try FileManager.default.contentsOfDirectory(at: lastpull, includingPropertiesForKeys: nil)
                        }
                        do {
                            let fileURLs = try FileManager.default.contentsOfDirectory(at: destinationUrl, includingPropertiesForKeys: nil)
                            // process files
                            let updateDTO = UpdateDTO()
                            
                            for url in fileURLs {
                                if !url.lastPathComponent.contains(".json") {
                                    continue
                                }
                                var data: Data
                                var set: MTGSet
                                do {
                                     data = try Data(contentsOf: url)
                                     set = try MTGSet(data: data)
                                } catch {
                                    print("error in URL loop")
                                    print(error)
                                    continue
                                }
                                print("\(set.data?.code ?? ""): \(set.data?.cards?.count ?? 0)")
                                let setDTO = UpdateSetDTO(code: set.data?.code ?? "")
                                var currentSetResult: Set = Set()
                                currentSetResult.cardIDs = []
                                
                                //get previous set
                                let setLastPull = oldFiles.first {
                                    if let code = set.data?.code {
                                        if code == "CON" {
                                            return $0.lastPathComponent == "\(code)_.json"
                                        }
                                        return $0.lastPathComponent == "\(code).json"
                                    }
                                    return false
                                }
                                var oldSet: MTGSet
                                if let setLastPullURL = setLastPull {
                                    let oldData = try Data(contentsOf: setLastPullURL)
                                    do {
                                    oldSet = try MTGSet(data: oldData)
                                    } catch {
                                        print("error getting old file")
                                        print(error)
                                        continue
                                    }
                                    
                                    //compare
                                    //if set date == previous set date then skip, wasnt rebuilt
                                    if set.meta?.date == oldSet.meta?.date {
                                        print("\(String(describing: set.data?.code)) did not update")
                                        continue
                                    }
                                    if set.data?.cards?.count != oldSet.data?.cards?.count {
                                        if let code = set.data?.code {
                                            print("\(code) card count different - add to update")
                                            currentSetResult.code = code
                                            update.sets?.append(currentSetResult)
                                            
                                            //add all cards to the setDTO and add the setDTO to the updateDTO
                                            for card in set.data?.cards ?? [] {
                                                let c = UpdateCardDTO(uuid: card.uuid ?? "", json: try self.replaceNewlines(with: card.jsonString(encoding:.utf8) ?? ""))
                                                setDTO.cards.append(c)
                                            }
                                        }
                                        continue
                                    }
                                    if let cards = set.data?.cards {
                                        for newCard in cards {
                                            if let oldCard = oldSet.data?.cards?.first(where: { $0.uuid == newCard.uuid }) {
                                                if !newCard.compareTo(card: oldCard) {
                                                    if let code = set.data?.code, let uuid = newCard.uuid {
                                                        //print("\(code) has a different card: \(String(describing: newCard.name))")
                                                        currentSetResult.cardIDs?.append(uuid)
                                                        //add the card to the setDTO
                                                        let c = UpdateCardDTO(uuid: uuid, json: try self.replaceNewlines(with: newCard.jsonString(encoding:.utf8) ?? ""))
                                                        setDTO.cards.append(c)
                                                    }
                                                }
                                            } else {
                                                if let code = set.data?.code, let uuid = newCard.uuid {
                                                    print("\(code) has a new card: \(String(describing: newCard.name))")
                                                    currentSetResult.cardIDs?.append(uuid)
                                                    
                                                    //add the card to the setDTO
                                                    let c = UpdateCardDTO(uuid: uuid, json: try self.replaceNewlines(with: newCard.jsonString(encoding:.utf8) ?? ""))
                                                    setDTO.cards.append(c)
                                                }
                                            }
                                        }
                                        if currentSetResult.cardIDs?.count ?? 0 > 0 {
                                            if let code = set.data?.code {
                                                currentSetResult.code = code
                                                update.sets?.append(currentSetResult)
                                            }
                                        }
                                        //if setDTO.cards.count > 0 add to the UpdateDTO, else dont
                                        if setDTO.cards.count > 0 {
                                            updateDTO.sets.append(setDTO)
                                        }
                                    }
                                } else {
                                    if let code = set.data?.code {
                                        print("\(code) does not exist in prior run")
                                        currentSetResult.code = code
                                        update.sets?.append(currentSetResult)
                                        //add all cards to the setDTO and add setDTO to UpdateDTO
                                        for card in set.data?.cards ?? [] {
                                            let c = UpdateCardDTO(uuid: card.uuid ?? "", json: try self.replaceNewlines(with: card.jsonString(encoding:.utf8) ?? ""))
                                            setDTO.cards.append(c)
                                        }
                                    }
                                    continue
                                }
                                
                            }
                            print("Done")
                            let dateFormatter = DateFormatter()
                            let enUSPosixLocale = Locale(identifier: "en_US_POSIX")
                            dateFormatter.locale = enUSPosixLocale
                            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
                            dateFormatter.calendar = Calendar(identifier: .gregorian)
                            
                            if update.sets?.count ?? 0 > 0 {
                                updates?.updates?.append(update)
                            }
                            
                            if let updates = updates {
                                
                                self.writeUpdateFile(updates: updates)
                            }
                            //if updateDTO has sets write file
                            if updateDTO.sets.count > 0 {
                                self.writeDTOtoFile(updates: updateDTO)
                                    Task {
                                        await self.postToAPIAsync(update: updateDTO)
                                    }
                            } else {
                                print("No sets to update")
                            }
                            //move from current to dates folder
                            archiveURL = archiveURL.appendingPathComponent("\(formatter1.string(from: Date()))")
                            try FileManager.default.createDirectory(at: archiveURL, withIntermediateDirectories: true, attributes: nil)
                            let files = try FileManager.default.contentsOfDirectory(at: destinationUrl, includingPropertiesForKeys: nil)
                            for file in files {
                                try FileManager.default.moveItem(at: file , to: archiveURL.appendingPathComponent(file.lastPathComponent))
                            }
                        } catch {
                            print("error getting files")
                            print(error)
                            
                        }
                    }
                    catch {
                        print("Something went wrong")
                        print(error.localizedDescription)
                    }
                }
                
            } catch {
                print(error)
            }
        }
    }
    func loadUpdatesJson() -> Updates? {
        var u: Updates?
        do {
            let url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("updates.json")
            let data = try Data(contentsOf: url)
            u = try Updates(data: data)
        }
        catch {
            print(error)
        }
        return u
    }
    func writeUpdateFile(updates: Updates) {
        do {
            let url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("updates.json")
            let str = try updates.jsonString()
            try str?.write(to: url, atomically: true, encoding: .utf8)
        }
        catch {
            print(error )
        }
    }
    func writeDTOtoFile(updates: UpdateDTO) {
        do {
            let url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("updateDTO.json")
            let str = try updates.jsonString()
            try str?.write(to: url, atomically: true, encoding: .utf8)
            print("DTO File Written to disk.")
        }
        catch {
            print(error )
        }
    }
    func postToAPI(update: UpdateDTO) {
        
       
        
        guard (try? JSONEncoder().encode(update)) != nil else {
            return
        }
        let url = URL(string: "http://10.0.0.177:8080/updates")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.uploadTask(with: request, from: try? update.jsonData()) { data, response, error in
                if let error = error {
                    print ("error: \(error)")
                    return
                }
                guard let response = response as? HTTPURLResponse,
                    (200...299).contains(response.statusCode) else {
                    print ("server error")
                    return
                }
                if let mimeType = response.mimeType,
                    mimeType == "application/json",
                    let data = data,
                    let dataString = String(data: data, encoding: .utf8) {
                    print ("got data: \(dataString)")
                }
            }
            task.resume()
    }
    func postToAPIAsync(update: UpdateDTO) async {
        guard let uploadData = try? JSONEncoder().encode(update) else {
            return
        }
        let url = URL(string: "http://10.0.0.177:8080/updates")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {

            let (_, response) = try await URLSession.shared.upload(for: request, from: uploadData)
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    print("Post to API failed: \(httpResponse.statusCode)")
                }
                print(httpResponse)
            }
        
            // handle the result
        } catch {
            print("Checkout failed: \(error.localizedDescription)")
        }
    }
    func replaceNewlines(with input: String) -> String {
        let newlineCharacterSet = CharacterSet.newlines

           // Replace invisible new line characters with "\\n"
         var temp = input.components(separatedBy: newlineCharacterSet).joined(separator: "\\n")

        // Replace the newline character (0A) with an empty string or any desired string
        temp = temp.replacingOccurrences(of: "\u{0D}", with: "\\n")
        temp = temp.replacingOccurrences(of: "\u{0009}", with: "")
           return temp.replacingOccurrences(of: "\u{0A}", with: "\\n") // Replace with an empty string


    }
}
extension URL {
    func download(to directory: FileManager.SearchPathDirectory, using fileName: String? = nil, overwrite: Bool = false, completion: @escaping (URL?, Error?) -> Void) throws {
        let sema = DispatchSemaphore( value: 0)
        let directory = try FileManager.default.url(for: directory, in: .userDomainMask, appropriateFor: nil, create: true)
        let destination: URL
        if let fileName = fileName {
            destination = directory
                .appendingPathComponent(fileName)
                .appendingPathExtension(self.pathExtension)
        } else {
            destination = directory
                .appendingPathComponent(lastPathComponent)
        }
        if !overwrite, FileManager.default.fileExists(atPath: destination.path) {
            completion(destination, nil)
            return
        }
        URLSession.shared.downloadTask(with: self) { location, _, error in
            guard let location = location else {
                completion(nil, error)
                return
            }
            do {
                if overwrite, FileManager.default.fileExists(atPath: destination.path) {
                    try FileManager.default.removeItem(at: destination)
                }
                try FileManager.default.moveItem(at: location, to: destination)
                completion(destination, nil)
                sema.signal()
            } catch {
                print(error)
            }
        }.resume()
        sema.wait()
    }
}
