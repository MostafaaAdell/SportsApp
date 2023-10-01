//
//  getAllLeagues.swift
//  SportsApp
//
//  Created by Mustafa on 29/09/2023.
//

import Foundation

// MARK: - Welcome
struct GetAllLeagues: Codable {
    let success: Int
    let result: [Leagues]
}

// MARK: - Result
struct Leagues: Codable {
    let leagueKey: Int
    let leagueName: String
    let countryKey: Int
    let countryName: String
    let leagueLogo, countryLogo: String?

    enum CodingKeys: String, CodingKey {
        case leagueKey = "league_key"
        case leagueName = "league_name"
        case countryKey = "country_key"
        case countryName = "country_name"
        case leagueLogo = "league_logo"
        case countryLogo = "country_logo"
    }
}
