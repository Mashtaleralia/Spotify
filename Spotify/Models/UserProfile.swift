//
//  UserProfile.swift
//  Spotify
//
//  Created by Admin on 16.10.2023.
//

import Foundation

struct UserProfile: Codable {
    let country: String
    let display_name: String
    let explicit_content: [String: Bool]
    let external_urls: [String: String]
//
    let id: String
    let product: String
    let images: [APIImage]
}

struct UserImage: Codable {
    let url: String
}

struct User: Codable {
    let display_name: String
    let external_urls: [String: String]
    let id: String
}
//
//{
//    country = NL;
//    "display_name" = "Alevtina M";
//    "explicit_content" =     {
//        "filter_enabled" = 0;
//        "filter_locked" = 0;
//    };
//    "external_urls" =     {
//        spotify = "https://open.spotify.com/user/31bhetvqshel6za7odufuflkkhly";
//    };
//    followers =     {
//        href = "<null>";
//        total = 0;
//    };
//    href = "https://api.spotify.com/v1/users/31bhetvqshel6za7odufuflkkhly";
//    id = 31bhetvqshel6za7odufuflkkhly;
//    images =     (
//                {
//            height = 64;
//            url = "https://scontent-ams2-1.xx.fbcdn.net/v/t1.30497-1/84628273_176159830277856_972693363922829312_n.jpg?stp=c15.0.50.50a_cp0_dst-jpg_p50x50&_nc_cat=1&ccb=1-7&_nc_sid=810bd0&_nc_ohc=lZs5q2uizGMAX8c-YFv&_nc_ht=scontent-ams2-1.xx&edm=AP4hL3IEAAAA&oh=00_AfCJ2pYubvOdIswXQ2ajSe9cTyJ98F2BGY10sTvsp1LQSg&oe=655B9499";
//            width = 64;
//        },
//                {
//            height = 300;
//            url = "https://scontent-ams2-1.xx.fbcdn.net/v/t1.30497-1/84628273_176159830277856_972693363922829312_n.jpg?stp=c94.0.320.320a_dst-jpg_p320x320&_nc_cat=1&ccb=1-7&_nc_sid=810bd0&_nc_ohc=lZs5q2uizGMAX8c-YFv&_nc_ht=scontent-ams2-1.xx&edm=AP4hL3IEAAAA&oh=00_AfCr2dvWFBMjhJQESOA7sTRUyw6u7rm8Z3h7iDNaetAurg&oe=655B9499";
//            width = 300;
//        }
//    );
//    product = free;
//    type = user;
//    uri = "spotify:user:31bhetvqshel6za7odufuflkkhly";
//}
