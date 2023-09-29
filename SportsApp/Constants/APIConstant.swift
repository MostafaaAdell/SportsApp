//
//  APIConstant.swift
//  SportsApp
//
//  Created by Mustafa on 29/09/2023.
//

import Foundation

struct APIConstant{
    
    
    private  let ApiKey = "10450c41674e1753658fa155979ccb6e59c7649b49a5a0cd3508b5e823f50499"
     private let mainSportsURl = "https://apiv2.allsportsapi.com/"
     private let sportType:String
     private let met:String
     private var leagueId:Int?
     private var teamId:Int?
    
    var URlAApi: String {
        get{
            
            return "\(mainSportsURl)\(sportType)\(met)\(ApiKey)"
        }
    }
    init(sportType:String ){
        
        self.sportType = sportType
        self.met = Met.allLeagues.order
    }
    init(sportType:String , leagueIdWithUpcomiingEvent:Int){
        
        self.sportType = sportType
        self.met = Met.getUpcomingEvents(leagueIdWithUpcomiingEvent).order
        self.leagueId = leagueIdWithUpcomiingEvent
    }
    init(sportType:String , leagueIdWithLatestEvent:Int){
        
        self.sportType = sportType
        self.met = Met.getLatestResults(leagueIdWithLatestEvent).order
        self.leagueId = leagueIdWithLatestEvent
    }
    
    init(sportType:String , teamId:Int){
        
        self.sportType = sportType
        self.met = Met.getTeamDetails(teamId).order
        self.teamId = teamId
    }
   
   
    enum Met {
        case allLeagues
        case getUpcomingEvents(Int)
        case getLatestResults(Int)
        case getTeamDetails(Int)
        
        var order:String{
            switch self {
            case .allLeagues: return "/?met=Leagues&APIkey="
                
            case .getUpcomingEvents (let leagueID): return "?met=Fixtures&leagueId=\(leagueID)&from=\(Date.getCurrentDate())&to=\(Date.getNextYeatDate())&APIkey="
            case .getLatestResults (let leagueID): return "?met=Fixtures&leagueId=\(leagueID)&from=\(Date.getLastYeatDate())&to=\(Date.getCurrentDate())&APIkey="
            case .getTeamDetails (let teamID): return "?&met=Teams&teamId=\(teamID)&APIkey="
            }
        }
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
    
    static func getLastYeatDate() -> String {
            
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var dateComponents = DateComponents()
        dateComponents.year = -1

        return dateFormatter.string(from:calendar.date(byAdding: dateComponents , to: Date()) ?? Date())

        }
    

}



