//
//  K.swift
//  SportsApp
//
//  Created by Mustafa on 27/09/2023.
//

import Foundation


struct K {
    
    //Custom Cell League Constat
    static let customNibNameLeagues = "CustomNibCell"
    static let customNibNameIdentfier = "LeagueCell"
    static let customNibTapSports = "TabCustomCell"
    static let customNibEvent = "eventCell"
    static let customNibLatestEvent = "latestEventCell"
    static let customNibTeams = "TeamsCell"
    static let customNibHeaderView = "MyHeaderView"
    
    //Custom Constraint of Cell
    static let customNibNameLeaguesHeight:CGFloat = 80
    static let customCellOfCollectionViewCornerRadius:CGFloat = 15
    
    //Custom Team Controller & Storyboard
    static let customNibTeamDetalis = "TeamDetalisViewController"
    static let leaguesViewController = "LeaguesViewController"
    static let leaguesAllEvent = "LeaguesVC"
    static let storyBoardLeagueIdentfier = "LeauguesView"
    static let storyBoardLeauguesView = "LeauguesView"
    static let TapSportVC = "TapSportVC"
    
    // Sports title name Navigation bar
    static let sportGame = "Sports"
    static let favourites = "Favourites"
    static let upCommingEventHeader =  "Upcoming Events"
    static let latestEventHeader =  "Latest Events"
    static let teamHeader =  "Teams"

    
    //typr of Sports os sport App
    static let football = "football"
    static let basketball = "basketball"
    static let cricket = "cricket"
    static let tennis = "tennis"
    
    
    //Constant Name for Json Api League
//    static let leagueName = "leaguesName"
//    static let leagueKey = "leaguesKey"
//    static let leagueLogo = "leagueLogo"
//    static let countryName = "countryName"
//    static let countryLogo = "countryLogo"
//    static let countryKey = "countryKey"
    

    
    //Indicator of Type of Sport
    static let allLeagueIndicator = 1
    static let upCommingEventIndicator = 2
    static let latestEventIndicator = 3
    static let teamIdIndicator = 4
    
    //Load Data To Tab Controller Of Sports
    static  let sports = ["Football", "Basketball", "MotorSport", "Fighting", "Tennis", "American Football","Ice Hockey" , "Cricket"]
    static  let sportsImg = ["Football", "Basketball", "MotorSport", "Fighting", "Baseball", "American Football","Ice Hockey" , "Gulf"]
    
    
    static let leaguesCollectionView = "cell"
    static let forSupplementaryViewOfKind = "header"
    
    
    //Default Values
    static let defaultValuesForImage =  "https://www.pngall.com/wp-content/uploads/1/Sports-Download-PNG.png"
    
    
    //Status of match
    static let matchStatue = "Match Finish"
    
    //Default Link
    static let defaultPermiumLeagueLink = "https://www.premierleague.com"
    static let defaultLeagueLogo = "Premier League"
    
    //image system Name
    static let favoriteIconNotSave = "heart"
    static let favoriteIconSave = "heart.fill"
    

    
    
    
    
}
