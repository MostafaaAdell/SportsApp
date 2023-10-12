//
//  MockNetworkManager.swift
//  SportsAppTests
//
//  Created by Mustafa on 11/10/2023.
//

import Foundation
@testable import SportsApp
class MockNetworkManager {
    
    var shouldReturnError:Bool
    init(shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    
    enum ErrorResponse:Error {
        case responseError
    }
    let leagueMockData = """
    {
    "success": 1,
    "result":
    [
      {
      "league_key": 4,
      "league_name": "UEFA Europa League",
      "country_key": 1,
      "country_name": "eurocups",
      "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/",
      "country_logo": null
      },
      {
      "league_key": 1,
      "league_name": "UEFA European Championship",
      "country_key": 1,
      "country_name": "eurocups",
      "league_logo": null,
      "country_logo": null
      },
      {
      "league_key": 683,
      "league_name": "UEFA Europa Conference League",
      "country_key": 1,
      "country_name": "eurocups",
      "league_logo": null,
      "country_logo": null
      }
    ]
    }
    """.data(using: .utf8)!
    
    
    let upcommingEventData = """
    { "success": 1,
    "result":
    [
      {
      "event_key": 1226163,
      "event_date": "2024-05-19",
      "event_time": "17:00",
      "event_home_team": "Arsenal",
      "home_team_key": 141,
      "event_away_team": "Everton",
      "away_team_key": 3073,
      "event_halftime_result": "",
      "event_final_result": "-",
      "event_ft_result": "",
      "event_penalty_result": "",
      "event_status": "",
      "country_name": "England",
      "league_name": "Premier League",
      "league_key": 152,
      "league_round": "Round 38",
      "league_season": "2023/2024",
      "event_live": "0",
      "event_stadium": "Emirates Stadium (London)",
      "event_referee": "",
      "home_team_logo": "https://apiv2.allsportsapi.com/logo/141_arsenal.jpg",
      "away_team_logo": "https://apiv2.allsportsapi.com/logo/3073_everton.jpg",
      "event_country_key": 44,
      "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/152_premier-league.png",
      "country_logo": "https://apiv2.allsportsapi.com/logo/logo_country/44_england.png",
      "event_home_formation": "",
      "event_away_formation": "",
      "fk_stage_key": 6,
      "stage_name": "Current"
      },
      {
      "event_key": 1226164,
      "event_date": "2024-05-19",
      "event_time": "17:00",
      "event_home_team": "Brentford",
      "home_team_key": 3086,
      "event_away_team": "Newcastle United",
      "away_team_key": 3100,
      "event_halftime_result": "",
      "event_final_result": "-",
      "event_ft_result": "",
      "event_penalty_result": "",
      "event_status": "",
      "country_name": "England",
      "league_name": "Premier League",
      "league_key": 152,
      "league_round": "Round 38",
      "league_season": "2023/2024",
      "event_live": "0",
      "event_stadium": "Gtech Community Stadium (Brentford, Middlesex)",
      "event_referee": "",
      "home_team_logo": "https://apiv2.allsportsapi.com/logo/3086_brentford.jpg",
      "away_team_logo": "https://apiv2.allsportsapi.com/logo/3100_newcastle-united.jpg",
      "event_country_key": 44,
      "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/152_premier-league.png",
      "country_logo": "https://apiv2.allsportsapi.com/logo/logo_country/44_england.png",
      "event_home_formation": "",
      "event_away_formation": "",
      "fk_stage_key": 6,
      "stage_name": "Current"
      }
    ]
    }
    """.data(using: .utf8)!
    
    let LatestEventData = """
    {
    "success": 1,
    "result": [
    {
    "event_key": 1225863,
    "event_date": "2023-10-08",
    "event_time": "17:30",
    "event_home_team": "Arsenal",
    "home_team_key": 141,
    "event_away_team": "Manchester City",
    "away_team_key": 80,
    "event_halftime_result": "0 - 0",
    "event_final_result": "1 - 0",
    "event_ft_result": "1 - 0",
    "event_penalty_result": "",
    "event_status": "Finished",
    "country_name": "England",
    "league_name": "Premier League",
    "league_key": 152,
    "league_round": "Round 8",
    "league_season": "2023/2024",
    "event_live": "0",
    "event_stadium": "Emirates Stadium (London)",
    "event_referee": "M. Oliver",
    "home_team_logo": "https://apiv2.allsportsapi.com/logo/141_arsenal.jpg",
    "away_team_logo": "https://apiv2.allsportsapi.com/logo/80_manchester-city.jpg",
    "event_country_key": 44,
    "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/152_premier-league.png",
    "country_logo": "https://apiv2.allsportsapi.com/logo/logo_country/44_england.png",
    "event_home_formation": "4-3-3",
    "event_away_formation": "4-3-3",
    "fk_stage_key": 6,
    "stage_name": "Current"
    },
    {
    "event_key": 1225864,
    "event_date": "2023-10-08",
    "event_time": "15:00",
    "event_home_team": "Brighton & Hove Albion",
    "home_team_key": 3079,
    "event_away_team": "Liverpool",
    "away_team_key": 84,
    "event_halftime_result": "1 - 2",
    "event_final_result": "2 - 2",
    "event_ft_result": "2 - 2",
    "event_penalty_result": "",
    "event_status": "Finished",
    "country_name": "England",
    "league_name": "Premier League",
    "league_key": 152,
    "league_round": "Round 8",
    "league_season": "2023/2024",
    "event_live": "0",
    "event_stadium": "The American Express Community Stadium (Falmer, East Sussex)",
    "event_referee": "A. Taylor",
    "home_team_logo": "https://apiv2.allsportsapi.com/logo/3079_brighton--hove-albion.jpg",
    "away_team_logo": "https://apiv2.allsportsapi.com/logo/84_liverpool.jpg",
    "event_country_key": 44,
    "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/152_premier-league.png",
    "country_logo": "https://apiv2.allsportsapi.com/logo/logo_country/44_england.png",
    "event_home_formation": "4-2-3-1",
    "event_away_formation": "4-3-3",
    "fk_stage_key": 6,
    "stage_name": "Current"
    }
    ]
    }
    """.data(using: .utf8)!
    
    
    
    let teamDetailsData = """
    {
    "success": 1,
    "result": [
    {
    "team_key": 141,
    "team_name": "Arsenal",
    "team_logo": "https://apiv2.allsportsapi.com/logo/141_arsenal.jpg",
    "players": [
    {
    "player_key": 3376420635,
    "player_image": "https://apiv2.allsportsapi.com/logo/players/4782_cedric-soares.jpg",
    "player_name": "Cédric Soares",
    "player_number": "17",
    "player_country": null,
    "player_type": "Defenders",
    "player_age": "32",
    "player_match_played": "0",
    "player_goals": "0",
    "player_yellow_cards": "0",
    "player_red_cards": "0",
    "player_injured": "No",
    "player_substitute_out": "0",
    "player_substitutes_on_bench": "1",
    "player_assists": "0",
    "player_birthdate": "1991-08-31",
    "player_is_captain": "0",
    "player_shots_total": "",
    "player_goals_conceded": "0",
    "player_fouls_committed": "1",
    "player_tackles": "",
    "player_blocks": "",
    "player_crosses_total": "3",
    "player_interceptions": "",
    "player_clearances": "1",
    "player_dispossesed": "",
    "player_saves": "",
    "player_inside_box_saves": "",
    "player_duels_total": "3",
    "player_duels_won": "",
    "player_dribble_attempts": "",
    "player_dribble_succ": "",
    "player_pen_comm": "",
    "player_pen_won": "",
    "player_pen_scored": "0",
    "player_pen_missed": "0",
    "player_passes": "20",
    "player_passes_accuracy": "18",
    "player_key_passes": "",
    "player_woordworks": "",
    "player_rating": "6.30"
    },
    {
    "player_key": 1737340146,
    "player_image": "https://apiv2.allsportsapi.com/logo/players/8519_mohamed-elneny.jpg",
    "player_name": "Mohamed Elneny",
    "player_number": "25",
    "player_country": null,
    "player_type": "Midfielders",
    "player_age": "31",
    "player_match_played": "0",
    "player_goals": "0",
    "player_yellow_cards": "0",
    "player_red_cards": "0",
    "player_injured": "No",
    "player_substitute_out": "0",
    "player_substitutes_on_bench": "2",
    "player_assists": "0",
    "player_birthdate": "1992-07-11",
    "player_is_captain": "0",
    "player_shots_total": "",
    "player_goals_conceded": "0",
    "player_fouls_committed": "1",
    "player_tackles": "1",
    "player_blocks": "",
    "player_crosses_total": "",
    "player_interceptions": "",
    "player_clearances": "",
    "player_dispossesed": "",
    "player_saves": "",
    "player_inside_box_saves": "",
    "player_duels_total": "5",
    "player_duels_won": "2",
    "player_dribble_attempts": "",
    "player_dribble_succ": "",
    "player_pen_comm": "",
    "player_pen_won": "",
    "player_pen_scored": "0",
    "player_pen_missed": "0",
    "player_passes": "60",
    "player_passes_accuracy": "57",
    "player_key_passes": "",
    "player_woordworks": "",
    "player_rating": "6.46"
    }
    ]
    }
    ]
    }
    """.data(using: .utf8)!

    
}


extension MockNetworkManager {
    func fetchDataFromApi<T:Codable>(jsonData:Data , Handler: @escaping (T?, Error?) -> Void) {
        if shouldReturnError{
            
            Handler(nil,ErrorResponse.responseError)
        }else{
            do{
                let dataRetrived = try JSONDecoder().decode(T.self, from: jsonData)
                Handler(dataRetrived,nil)
                
            }catch{
                Handler(nil,error)
            }
        }
    }
    
    
    
    
}
