//
//  JsonDownloader.swift
//  MTGJsonDeff
//
//  Created by Joseph Smith on 9/29/20.
//

import Foundation
import Zip

class JsonDownloader {
    func download(){
        let setFileZipURL = "https://mtgjson.com/api/v5/AllSetFiles.zip"
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "MM-dd-yyyy"
        if let url = URL(string: setFileZipURL) {
            do {
                try url.download(to: .downloadsDirectory, overwrite: true){ url, error in
                    guard let url = url else { return }
                    print(url)
                    do {
                        
                        var destinationUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("JsonFiles").appendingPathComponent(formatter1.string(from: Date()))
                        try FileManager.default.createDirectory(at: destinationUrl, withIntermediateDirectories: true, attributes: nil)
                        let unzipDirectory = try Zip.unzipFile(url, destination: destinationUrl, overwrite: true, password: nil) // Unzip
//                        try FileManager.default.moveItem(at: url, to: try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("Source").appendingPathComponent("\(formatter1.string(from: Date())).zip"))
//                        print(unzipDirectory)
                        
                    
                        do {
                            let fileURLs = try FileManager.default.contentsOfDirectory(at: destinationUrl, includingPropertiesForKeys: nil)
                            // process files
                            for url in fileURLs {
                                print(url)
                                var data = try Data(contentsOf: url)
                                var set = try MTGSet(data: data)
                                print("\(set.data?.code): \(set.data?.cards?.count)")
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
}
extension URL {
    func download(to directory: FileManager.SearchPathDirectory, using fileName: String? = nil, overwrite: Bool = false, completion: @escaping (URL?, Error?) -> Void) throws {
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
            } catch {
                print(error)
            }
        }.resume()
    }
}
