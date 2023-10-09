//
//  UpCommingEventSingle.swift
//  SportsApp
//
//  Created by Mustafa on 04/10/2023.
//

import Foundation
protocol UpCommingEventProtocol{
    func getDataFromApiForUpcomming()
    func getUpcomingEventArray ()->UpcommingEventModel?
    func getNumberOfUpcommingEvent() -> Int?
    func retrivedTeamsFromUpCommingEvent()->[TeamModel]?
    var handerDataOfUpcommingEvent : (() -> Void)?{get set}
    

}

class UpcommingEvent:UpCommingEventProtocol{
    
    
   
    
    
    var handerDataOfUpcommingEvent: (() -> Void)?
    
    private var upCommingEvent: UpcommingEventModel? {
        didSet{
            if let validHander =  handerDataOfUpcommingEvent {
                validHander()
            }
        }
    }
    var services: NetworkServiceDelegate?

    init(services: NetworkServiceDelegate?){
        self.services = services
    }
    
    func getDataFromApiForUpcomming() {
        services?.fetchDataFromAPIForFootball(Handler: { (dataValue:UpcommingEventModel?, error: Error?) in

            if let data = dataValue {
                self.upCommingEvent = data
            }else {
                if let error = error{
                    print(error.localizedDescription)
                }
            }
        })
    }
    
    func getUpcomingEventArray() -> UpcommingEventModel? {
        return upCommingEvent
    }
    
    func getNumberOfUpcommingEvent() -> Int? {
        return upCommingEvent?.result.count
    }
    
    func retrivedTeamsFromUpCommingEvent() -> [TeamModel]? {
        
        
        var teamsDetalis:[TeamModel]? = [TeamModel]()
        if let allTeams = upCommingEvent?.result{
            
            for team in allTeams{
                
                var everyTeam = TeamModel(teamName: team.eventHomeTeam,teamLogo: team.homeTeamLogo,teamkey: team.homeTeamKey)
                if let check = teamsDetalis?.contains(where: {$0 == everyTeam}) {
                    if check == false{
                        teamsDetalis?.append(everyTeam)
                    }
                    
                }
                everyTeam = TeamModel(teamName: team.eventAwayTeam,teamLogo: team.awayTeamLogo,teamkey: team.awayTeamKey)
                if let check = teamsDetalis?.contains(where: {$0 == everyTeam}) {
                    if check == false{
                        teamsDetalis?.append(everyTeam)
                    }
                }
                
                
                
            }
        }
        return teamsDetalis
    }
    
    
}
