//
//  SearchResult.swift
//  Spotify
//
//  Created by Admin on 20.11.2023.
//

import Foundation

enum SearchResult {
    case artist(model: Artist)
    case album(model: Album)
    case track(model: AudioTrack)
    case playlist(model: Playlist)
}
