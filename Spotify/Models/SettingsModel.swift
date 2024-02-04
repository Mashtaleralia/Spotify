//
//  SettingsModel.swift
//  Spotify
//
//  Created by Admin on 21.10.2023.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
