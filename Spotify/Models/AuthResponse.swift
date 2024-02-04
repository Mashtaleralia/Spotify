//
//  AuthResponse.swift
//  Spotify
//
//  Created by Admin on 20.10.2023.
//

import Foundation

struct AuthResponse: Codable {
    let access_token: String
    let expires_in: Int
    let refresh_token: String?
    let scope: String
    let token_type: String
}


//"access_token" = "BQCi_mG1boBGyp6wV-KV2udYBSt4wGmDxM-dgNH8dIcQxq_A1rmFqMP8feN4-qxr1AGqMY5uUov69ubx4iR17PRjEAdlRQd-X5AAVwownvWdG7vFJVIi9byes_JCfGS5gWNnUfgwy5bZi6LHVMP2urdYk3OdLAAB7LQID0108zEX8zGYbAad4LPMFP-_JJK2z0P8dccSULq9bYgWVX8";
//"expires_in" = 3600;
//"refresh_token" = "AQBhHEQC9sZGp89ZiR_Krzva1tyN3TvBkXuX6TFzDyZ2pz4gxS74fktwJeIxorZjdMSMMZ0qBYeDBuEC5DyStt7Eay1ECs54iPKFUQZDc5M3ESZ2xYPg5OmfFGzYLi9thwE";
//scope = "user-read-private";
//"token_type" = Bearer;
