//
//  TabSportViewModel.swift
//  SportsApp
//
//  Created by Mustafa on 27/09/2023.
//

import Foundation
import Alamofire
protocol TabViewModelProtocol: AllLeagueProtocol,UpCommingEventProtocol,LatestEventProtocol,TeamDetailsProtocol{
    
    
}



class TabViewModel:TabViewModelProtocol{
 
    
    var handerDataOfLeagues: (() -> Void)?

    var handerDataOfTeamDetails: (() -> Void)?
    

    
    var handerDataOfLatestEvent: (() -> Void)?
    

    
    var handerDataOfUpcommingEvent: (() -> Void)?
    

    
    
    
    let allLeagues :AllLeagues?
    let upCommingEvent : UpcommingEvent?
    let latestEvent : LatestEvent?
    let teamDetails :TeamDetailsEvent?
    init(allLeague:AllLeagues){
        self.allLeagues = allLeague
        self.allLeagues!.handerDataOfLeagues = handerDataOfLeagues
        upCommingEvent = nil
        latestEvent = nil
        teamDetails = nil
        
    }
    init(upCommingEvents:UpcommingEvent){
        self.allLeagues = nil
        self.upCommingEvent = upCommingEvents
        latestEvent = nil
        teamDetails = nil
        
    }
    init(latestEvents:LatestEvent){
        self.allLeagues = nil
        upCommingEvent = nil
        latestEvent = latestEvents
        teamDetails = nil
        
    }
    init(teamDetails:TeamDetailsEvent){
        self.allLeagues = nil
        upCommingEvent = nil
        latestEvent = nil
        self.teamDetails = teamDetails
        
    }
 
    
    //All Leagues
    func getDataFromApiForLeagues() {
        if let allLeagues  = allLeagues{
            allLeagues.getDataFromApiForLeagues()
        }
    }
    
    func getLeaguesArray() -> AllLeagueModel? {
        if let allLeagues  = allLeagues{
          return   allLeagues.getLeaguesArray()
        }
        return nil
    }
    
    func getNumberOfLeagues() -> Int? {
        return allLeagues?.getNumberOfLeagues()
    }
    
    //UpComming Event
    func getDataFromApiForUpcomming() {
        if let upCommingEvent  = upCommingEvent{
            upCommingEvent.getDataFromApiForUpcomming()
        }
    }
    
    func getUpcomingEventArray() -> UpcommingEventModel? {
        if let upCommingEvent  = upCommingEvent{
          return   upCommingEvent.getUpcomingEventArray()
        }
        return nil
    }
    
    func getNumberOfUpcommingEvent() -> Int? {
        return upCommingEvent?.getNumberOfUpcommingEvent()
    }
    
    //Latest Event
    func getDataFromApiForLatest() {
        if let latestEvent  = latestEvent{
            latestEvent.getDataFromApiForLatest()
        }
    }
    
    func getLatestEventArray() -> LatestEventsModel? {
        if let latestEvent  = latestEvent{
          return   latestEvent.getLatestEventArray()
        }
        return nil
    }
    
    func getNumberOfLatestEvent() -> Int? {
        return latestEvent?.getNumberOfLatestEvent()
    }
    
    //Team Details
    func getDataFromApiForTeamDetails() {
        if let teamDetails  = teamDetails{
            teamDetails.getDataFromApiForTeamDetails()
        }
    }
    
    func getTeamIdArray() -> TeamDetailsModel? {
        if let teamDetails  = teamDetails{
          return   teamDetails.getTeamIdArray()
        }
        return nil
    }
    
    func getNumberOfTeamDetails() -> Int? {
        return latestEvent?.getNumberOfLatestEvent()

    }
    func retrivedTeamsFromUpCommingEvent() -> [TeamModel]? {
        return  nil
    }
    
    func retrivedTeamsFromLatestEvent(avaliableTeams:inout[TeamModel]?) {
    }


 
    
}
