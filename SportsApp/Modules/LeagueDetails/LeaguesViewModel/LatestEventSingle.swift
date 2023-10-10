//
//  LatestEventSingle.swift
//  SportsApp
//
//  Created by Mustafa on 04/10/2023.
//

import Foundation
protocol LatestEventProtocol{
    func getDataFromApiForLatest()
    func getLatestEventArray ()->LatestEventsModel?
    func getNumberOfLatestEvent() -> Int?
    var handerDataOfLatestEvent : (() -> Void)?{get set}
    func retrivedTeamsFromLatestEvent(avaliableTeams:inout[TeamModel]?)
}

class LatestEvent:LatestEventProtocol{
    
    
    var services: NetworkServiceDelegate?
    var handerDataOfLatestEvent: (() -> Void)?
    
    private var latestEvent: LatestEventsModel? {
        didSet{
            if let validHander =  handerDataOfLatestEvent {
                validHander()
            }
        }
    }
    
    init(services: NetworkServiceDelegate?){
        self.services = services
    }
    
    //MARK: - Get Data From Api to Latest Event
    
    func getDataFromApiForLatest() {
        services?.fetchDataFromAPIForFootball(Handler: { (dataValue:LatestEventsModel?, error: Error?) in
            
            if let data = dataValue {
                self.latestEvent = data
            }else {
                if let error = error{
                    print(error.localizedDescription)
                }
            }
        })
    }
    
    //MARK: - Get Data to Latest Event Model
    func getLatestEventArray() -> LatestEventsModel? {
        return latestEvent
    }
    
    //MARK: - Get Count of Latest Event Model
    
    func getNumberOfLatestEvent() -> Int? {
        return 3
        //return latestEvent?.result.count
    }
    
    //MARK: - Get All Teams in latest Event
    
    func retrivedTeamsFromLatestEvent(avaliableTeams:inout[TeamModel]?){
        if let allTeams = latestEvent?.result{
            
            for team in allTeams{
                
                var everyTeam = TeamModel(teamName: team.eventHomeTeam,teamLogo: team.homeTeamLogo,teamkey: team.homeTeamKey)
                if let check = avaliableTeams?.contains(where: {$0 == everyTeam}) {
                    if check == false{
                        avaliableTeams?.append(everyTeam)
                    }
                    
                }
                everyTeam = TeamModel(teamName: team.eventAwayTeam,teamLogo: team.awayTeamLogo,teamkey: team.awayTeamKey)
                if let check = avaliableTeams?.contains(where: {$0 == everyTeam}) {
                    if check == false{
                        avaliableTeams?.append(everyTeam)
                    }
                }
                
                
                
            }
        }
    }
    
    
    
    
}
