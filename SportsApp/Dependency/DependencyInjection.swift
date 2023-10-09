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
    static var leagueDetails:Leagues?
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
    static var networkServicesForLeague:NetworkServiceDelegate{
        return NetworkServices(setUrl: ApiLeaguesSports)
    }
    //Network Call for sports leagues
    static var networkServicesForUpcommingEvent:NetworkServiceDelegate{
        return NetworkServices(setUrl: ApiUpCommingEventSports)
    }
    //Network Call for sports leagues
    static var networkServicesForLatestEvent:NetworkServiceDelegate{
        return NetworkServices(setUrl: ApiUpLatestEventSports)
    }
    //Network Call for sports leagues
    static var networkServicesForTeamDetails:NetworkServiceDelegate{
        return NetworkServices(setUrl: ApiTeamsDetalistSports)
    }
    
    
    
    //setup Network Detalis To Return Certain Url
    static var leaguesNetwork:AllLeagueProtocol{
        
        return AllLeagues(services: networkServicesForLeague)
    }
    static var upCommingEventNetwork:UpCommingEventProtocol{
        
        return UpcommingEvent(services: networkServicesForUpcommingEvent)

    }
    static var latestEventNetwork:LatestEventProtocol{
        
       return LatestEvent(services: networkServicesForLatestEvent)
    }
    static var teamDetalisNetwork:TeamDetailsProtocol{
        
        return TeamDetailsEvent(services: networkServicesForTeamDetails)
    }
 
    
    
   //leagues
    static var leagueViewController:LeaguesViewController {
        let vc = LeaguesViewController(nibName: K.leaguesViewController, bundle: nil)
         vc.viewAllLeague = leaguesNetwork
         vc.view.backgroundColor = .white
         vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         vc.modalPresentationStyle = .fullScreen
        return vc
    }
    //Events
    static var eventForLeagues:LeaguesVC {
        let storyboard = UIStoryboard(name:K.storyBoardLeagueIdentfier , bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: K.leaguesAllEvent) as! LeaguesVC
         vc.viewUpcommingEvent = upCommingEventNetwork
         vc.viewlatestEvent = latestEventNetwork
         vc.leagueCoreDataSaved = CoreDataLeagueViewModel()
         vc.leagueDetails = leagueDetails
         vc.view.backgroundColor = .white
         vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         vc.modalPresentationStyle = .fullScreen
        return vc
    }
    //Team Details
    static var teamDetailsViewController:TeamDetalisViewController {
        let vc = TeamDetalisViewController(nibName: K.customNibTeamDetalis, bundle: nil)
         vc.viewTEamDetalis = teamDetalisNetwork
         vc.view.backgroundColor = .white
         vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         vc.modalPresentationStyle = .fullScreen
        return vc
    }
  

}








