//
//  GetLatestEvent.swift
//  SportsApp
//
//  Created by Mustafa on 02/10/2023.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - LatestEventsModel
struct LatestEventsModel: Codable {
    let success: Int
    let result: [latestEvent]
}

// MARK: - latestEvent
struct latestEvent: Codable {
    let eventKey: Int?
    let eventDate, eventTime, eventHomeTeam: String?
    let homeTeamKey: Int?
    let eventAwayTeam: String?
    let awayTeamKey: Int?
    let eventHalftimeResult, eventFinalResult, eventFtResult: String?
    let leagueName: String?
    let leagueKey: Int?
    let eventLive, eventStadium, eventReferee: String?
    let homeTeamLogo, awayTeamLogo: String?
    let eventCountryKey: Int?
    let leagueLogo, countryLogo: String?
    let eventHomeFormation, eventAwayFormation: String?
    let fkStageKey: Int?
    let stageName: String?
 
    enum CodingKeys: String, CodingKey {
        case eventKey = "event_key"
        case eventDate = "event_date"
        case eventTime = "event_time"
        case eventHomeTeam = "event_home_team"
        case homeTeamKey = "home_team_key"
        case eventAwayTeam = "event_away_team"
        case awayTeamKey = "away_team_key"
        case eventHalftimeResult = "event_halftime_result"
        case eventFinalResult = "event_final_result"
        case eventFtResult = "event_ft_result"
        case leagueName = "league_name"
        case leagueKey = "league_key"
        case eventLive = "event_live"
        case eventStadium = "event_stadium"
        case eventReferee = "event_referee"
        case homeTeamLogo = "home_team_logo"
        case awayTeamLogo = "away_team_logo"
        case eventCountryKey = "event_country_key"
        case leagueLogo = "league_logo"
        case countryLogo = "country_logo"
        case eventHomeFormation = "event_home_formation"
        case eventAwayFormation = "event_away_formation"
        case fkStageKey = "fk_stage_key"
        case stageName = "stage_name"
    }
}

