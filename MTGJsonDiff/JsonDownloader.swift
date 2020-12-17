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
        print(FileManager.default.currentDirectoryPath)
        let url = URL(string: FileManager.default.currentDirectoryPath)
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
                        //                        try FileManager.default.moveItem(at: url, to: try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("Source").appendingPathComponent("\(formatter1.string(from: Date())).zip"))
                        //                        print(unzipDirectory)
                        
                        var archiveURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("JsonFiles")
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
                            
                            
                            for url in fileURLs {
                                if !url.lastPathComponent.contains(".json") {
                                    continue
                                }
                                let data = try Data(contentsOf: url)
                                let set = try MTGSet(data: data)
                                print("\(set.data?.code ?? ""): \(set.data?.cards?.count ?? 0)")
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
                                    oldSet = try MTGSet(data: oldData)
                                    
                                    //compare
                                    //if set date == previous set date then skip, wasnt rebuilt
                                    if set.meta?.date == oldSet.meta?.date {
                                        print("\(set.data?.code) did not update")
                                        continue
                                    }
                                    if set.data?.cards?.count != oldSet.data?.cards?.count {
                                        if let code = set.data?.code {
                                            print("\(code) card count different - add to update")
                                            currentSetResult.code = code
                                            update.sets?.append(currentSetResult)
                                        }
                                        continue
                                    }
                                    if let cards = set.data?.cards {
                                        for newCard in cards {
                                            if let oldCard = oldSet.data?.cards?.first(where: { $0.uuid == newCard.uuid }) {
                                                if !newCard.compareTo(card: oldCard) {
                                                    if let code = set.data?.code, let uuid = newCard.uuid {
                                                        print("\(code) has a different card: \(newCard.name)")
                                                        currentSetResult.cardIDs?.append(uuid)
                                                    }
                                                }
                                            } else {
                                                if let code = set.data?.code, let uuid = newCard.uuid {
                                                    print("\(code) has a new card: \(newCard.name)")
                                                    currentSetResult.cardIDs?.append(uuid)
                                                }
                                            }
                                        }
                                        if currentSetResult.cardIDs?.count ?? 0 > 0 {
                                            if let code = set.data?.code {
                                                currentSetResult.code = code
                                                update.sets?.append(currentSetResult)
                                            }
                                        }
                                    }
                                } else {
                                    if let code = set.data?.code {
                                        print("\(code) does not exist in prior run")
                                        currentSetResult.code = code
                                        update.sets?.append(currentSetResult)
                                    }
                                    continue
                                }
                                
                                //else
                                //compare meta values
                                //compare cards
                                
                                //if set doesnt exist
                                //if card doesnt exist
                                
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
