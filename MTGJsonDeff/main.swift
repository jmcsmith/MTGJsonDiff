//
//  main.swift
//  MTGJsonDeff
//
//  Created by Joseph Smith on 9/29/20.
//

import Foundation


let downloader = JsonDownloader()
await downloader.download()
//try await Task.sleep(nanoseconds: 10_000_000_000) // 1 second
print("downloader complete")

exit(EXIT_SUCCESS)


//readLine()
