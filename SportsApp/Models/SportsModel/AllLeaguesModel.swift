//
//  getAllLeagues.swift
//  SportsApp
//
//  Created by Mustafa on 29/09/2023.
//

import Foundation

// MARK: - AllLeagueModel
struct AllLeagueModel: Codable {
    let success: Int
    let result: [Leagues]
}

// MARK: - Leagues
struct Leagues: Codable ,Equatable{
    let leagueKey: Int
    let leagueName: String
    let countryKey: Int
    let countryName: String
    let leagueLogo, countryLogo: String?
    static func == (lhs:Leagues,rhs:Leagues)->Bool{
        return lhs.leagueKey == rhs.leagueKey
    }

    enum CodingKeys: String, CodingKey {
        case leagueKey = "league_key"
        case leagueName = "league_name"
        case countryKey = "country_key"
        case countryName = "country_name"
        case leagueLogo = "league_logo"
        case countryLogo = "country_logo"
    }
    
    
 
}
