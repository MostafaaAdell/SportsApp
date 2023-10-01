//
//  DependencyInjection.swift
//  SportsApp
//
//  Created by Mustafa on 30/09/2023.
//

import Foundation
import UIKit
struct DependencyProvider{
    static var sportType:String = "football"
    static var leaugeID:Int = 0
    static var teamId:Int = 0
    //Leagues
    static var ApiLeaguesSports:ApiPreparationDelegate {
        return HandelURL(sportType: sportType)
    }
    //Upcomming
    static var ApiUpCommingEventSports:ApiPreparationDelegate {
        return HandelURL(sportType: sportType,leagueIdWithUpcomiingEvent: leaugeID)
    }
    
    //latest Event
    static var ApiUpLatestEventSports:ApiPreparationDelegate {
        return HandelURL(sportType: sportType,leagueIdWithLatestEvent: leaugeID)
    }
 
    //Team Details
    static var ApiTeamsDetalistSports:ApiPreparationDelegate {
        return HandelURL(sportType: sportType,teamId:  teamId)
    }
    
    
    
    
    //Network Call for sports leagues
    static var NetworkServicesForLeagues:NetworkServiceDelegate{
        return NetworkServices(setUrl: ApiLeaguesSports)
    }
    
    //Network Call for sports Upcooming Event
    static var NetworkServicesForUpcommingEvent:NetworkServiceDelegate{
        return NetworkServices(setUrl: ApiUpCommingEventSports)
    }
    
    //Network Call for sports Latest Event
    static var NetworkServicesForLatestEvent:NetworkServiceDelegate{
        return NetworkServices(setUrl: ApiUpLatestEventSports)
    }
    
    //Network Call for sports Team Detalis
    static var NetworkServicesForTeamDetalis:NetworkServiceDelegate{
        return NetworkServices(setUrl: ApiTeamsDetalistSports)
    }
    
    
    
//    static var tabViewSports:TabViewModelProtocol{
//        
//       return TabViewModel(netWorkServies: NetworkServicesForLeagues)
//    }
// 
//    
//    
//
//    static var tabViewController:TapSportVC {
//        let vc = UIStoryboard(name: "TapSportVC", bundle: nil).instantiateInitialViewController() as! TapSportVC
//        
//        
//        return vc
//    }

}
