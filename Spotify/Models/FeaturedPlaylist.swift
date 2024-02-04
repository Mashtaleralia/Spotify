//
//  FeaturedPlaylist.swift
//  Spotify
//
//  Created by Admin on 30.10.2023.
//

import Foundation


struct CategoryPlaylistsResponse: Codable {
    var playlists: PlaylistResponse
    
}

struct PlaylistResponse: Codable {
    var items: [Playlist]
}



//playlists =     {
//    href = "https://api.spotify.com/v1/browse/featured-playlists?country=DE&timestamp=2023-10-30T06%3A57%3A30&offset=0&limit=20";
//    items =         (
//                    {
//            collaborative = 0;
//            description = "50 Hits in einer Playlist! Cover: Ellice";
//            "external_urls" =                 {
//                spotify = "https://open.spotify.com/playlist/37i9dQZF1DX4jP4eebSWR9";
//            };
//            href = "https://api.spotify.com/v1/playlists/37i9dQZF1DX4jP4eebSWR9";
//            id = 37i9dQZF1DX4jP4eebSWR9;
//            images =                 (
//                                    {
//                    height = "<null>";
//                    url = "https://i.scdn.co/image/ab67706f00000003caa10e6679a782a73e1692e5";
//                    width = "<null>";
//                }
//            );
//            name = "Hot Hits Deutschland";
//            owner =                 {
//                "display_name" = Spotify;
//                "external_urls" =                     {
//                    spotify = "https://open.spotify.com/user/spotify";
//                };
//                href = "https://api.spotify.com/v1/users/spotify";
//                id = spotify;
//                type = user;
//                uri = "spotify:user:spotify";
//            };
//            "primary_color" = "<null>";
//            public = "<null>";
//            "snapshot_id" = MTY5ODM5MDg0MSwwMDAwMDAwMDg3OTUwNDM3MmQzNTc0NzE3ZjExMGQxZjMwOTcxYjE4;
//            tracks =                 {
//                href = "https://api.spotify.com/v1/playlists/37i9dQZF1DX4jP4eebSWR9/tracks";
//                total = 50;
//            };
//            type = playlist;
//            uri = "spotify:playlist:37i9dQZF1DX4jP4eebSWR9";
//        },
//                    {
//            collaborative = 0;
//            description = "Die wichtigsten Deutschrap Releases der letzten Wochen - jeden Freitag aktualisiert. Cover: RAF Camora, Ski Aggu";
//            "external_urls" =                 {
//                spotify = "https://open.spotify.com/playlist/37i9dQZF1DWSTqUqJcxFk6";
//            };
//            href = "https://api.spotify.com/v1/playlists/37i9dQZF1DWSTqUqJcxFk6";
//            id = 37i9dQZF1DWSTqUqJcxFk6;
//            images =                 (
//                                    {
//                    height = "<null>";
//                    url = "https://i.scdn.co/image/ab67706f000000035bcc92d34d74376fdeac70a0";
//                    width = "<null>";
//                }
//            );
//            name = "Deutschrap Brandneu";
//            owner =                 {
//                "display_name" = Spotify;
//                "external_urls" =                     {
//                    spotify = "https://open.spotify.com/user/spotify";
//                };
//                href = "https://api.spotify.com/v1/users/spotify";
//                id = spotify;
//                type = user;
//                uri = "spotify:user:spotify";
//            };
//            "primary_color" = "<null>";
//            public = "<null>";
//            "snapshot_id" = MTY5ODM1NzYwMCwwMDAwMDAwMDU1MzYzYjYyNDY3NDQzYWFjNzAyZmQ5ZDc3ZTRhOWI1;
//            tracks =                 {
//                href = "https://api.spotify.com/v1/playlists/37i9dQZF1DWSTqUqJcxFk6/tracks";
//                total = 80;
//            };
//            type = playlist;
//            uri = "spotify:playlist:37i9dQZF1DWSTqUqJcxFk6";
//        },
//                    {
//            collaborative = 0;
//            description = "Die wichtigste Hip-Hop Playlist Deutschlands. Cover: badm\U00f3mzjay";
//            "external_urls" =                 {
//                spotify = "https://open.spotify.com/playlist/37i9dQZF1DX36edUJpD76c";
//            };
//            href = "https://api.spotify.com/v1/playlists/37i9dQZF1DX36edUJpD76c";
//            id = 37i9dQZF1DX36edUJpD76c;
//            images =                 (
//                                    {
//                    height = "<null>";
//                    url = "https://i.scdn.co/image/ab67706f000000039af942fd49ecd146423e22af";
//                    width = "<null>";
//                }
//            );
