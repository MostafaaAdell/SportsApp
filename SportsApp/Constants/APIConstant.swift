//
//  APIConstant.swift
//  SportsApp
//
//  Created by Mustafa on 29/09/2023.
//

import Foundation

struct APIConstant{
    private static let ApiKey = "10450c41674e1753658fa155979ccb6e59c7649b49a5a0cd3508b5e823f50499"
    static let mainSportsURl = "https://allsportsapi.com/"
    static let soccerSportsURl = "https://apiv2.allsportsapi.com/football/"
    static let basketballSportsURl = "https://apiv2.allsportsapi.com/basketball/"
    static let cricketSportsURl = "https://apiv2.allsportsapi.com/cricket/"
    static let tennisSportsURl = "https://apiv2.allsportsapi.com/tennis/"
    static var sportType:String?
    
    static let allLeagues = "mainSportsURl\(sportType ?? "football"+ApiKey)"
    static let getUpComingEvent = "https://apiv2.allsportsapi.com/football?met=Fixtures&leagueId=[leagueId]&from=[CurrentDate]&to=[CurrentDate + OneYear]&APIkey=[YourKey]"
    static let getLatestResult = "https://apiv2.allsportsapi.com/football?met=Fixtures&leagueId=[leagueId]&from=[CurrentDate - OneYear]&to=[CurrentDate]&APIkey=[YourKey]"
    
    
}
