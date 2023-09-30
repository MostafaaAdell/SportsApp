//
//  APIConstant.swift
//  SportsApp
//
//  Created by Mustafa on 29/09/2023.
//

import Foundation

protocol ApiPreparationDelegate{
    func prepareAPIUrl() -> String
}

struct APIConstant{
    
    
    private  let ApiKey = "10450c41674e1753658fa155979ccb6e59c7649b49a5a0cd3508b5e823f50499"
     private let mainSportsURl = "https://apiv2.allsportsapi.com/"
     private let sportType:String
     private let met:String
     private var leagueId:Int?
     private var teamId:Int?
    
    var URlApi: String {
        get{
            
            return "\(mainSportsURl)\(sportType)\(met)\(ApiKey)"
        }
    }
    
    //init with to type of Sport
    init(sportType:String ){
        
        self.sportType = sportType
        self.met = Met.allLeagues.order
    }
    init(sportType:String , leagueIdWithUpcomiingEvent:Int){
        
        self.sportType = sportType
        self.met = Met.getUpcomingEvents(leagueIdWithUpcomiingEvent).order
        self.leagueId = leagueIdWithUpcomiingEvent
    }
    
    //init with sport type and league ID updated event
    init(sportType:String , leagueIdWithLatestEvent:Int){
        
        self.sportType = sportType
        self.met = Met.getLatestResults(leagueIdWithLatestEvent).order
        self.leagueId = leagueIdWithLatestEvent
    }
    
    //init with sport type and league ID for latest Event
    init(sportType:String , teamId:Int){
        
        self.sportType = sportType
        self.met = Met.getTeamDetails(teamId).order
        self.teamId = teamId
    }
   
   
    // switch to choose the type of Getting Api
    enum Met {
        case allLeagues
        case getUpcomingEvents(Int)
        case getLatestResults(Int)
        case getTeamDetails(Int)
        
        var order:String{
            switch self {
            case .allLeagues: return "/?met=Leagues&APIkey="
                
            case .getUpcomingEvents (let leagueID): return "?met=Fixtures&leagueId=\(leagueID)&from=\(Date.getCurrentDate())&to=\(Date.getNextYeatDate())&APIkey="
            case .getLatestResults (let leagueID): return "?met=Fixtures&leagueId=\(leagueID)&from=\(Date.getLastYearDate())&to=\(Date.getCurrentDate())&APIkey="
            case .getTeamDetails (let teamID): return "?&met=Teams&teamId=\(teamID)&APIkey="
            }
        }
    }
    
    
    

    
}


//MARK: - Applying protocol for get Url
extension APIConstant: ApiPreparationDelegate {
    func prepareAPIUrl() -> String {
        return URlApi
    }
    
    
}


// MARK: ADding extenision to The Date To Get Current ANd Next And Last Year
extension Date {
    static func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter.string(from: Date())

        }
    
    static func getNextYeatDate() -> String {
            
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        return dateFormatter.string(from:calendar.date(byAdding: .year, value: 1, to: Date()) ?? Date())

        }
    
    static func getLastYearDate() -> String {
            
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var dateComponents = DateComponents()
        dateComponents.year = -1

        return dateFormatter.string(from:calendar.date(byAdding: dateComponents , to: Date()) ?? Date())

        }
    

}



