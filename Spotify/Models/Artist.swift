//
//  Artist.swift
//  Spotify
//
//  Created by Admin on 16.10.2023.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let images: [APIImage]?
    let external_urls: [String: String]
}
