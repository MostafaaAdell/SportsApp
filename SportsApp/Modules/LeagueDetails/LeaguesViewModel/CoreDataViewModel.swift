//
//  CoreDataViewModel.swift
//  SportsApp
//
//  Created by Mustafa on 09/10/2023.
//

import Foundation

protocol CoreDataLeagueProtocaol{
   // func retriveleagueModel()->[Leagues]?
    func removeLeagueFromFavorite(league:Leagues)
    func addLeagueFromFavorite(league:Leagues)
    func checkExistanceOfFavorite(league:Leagues)->Bool
}
class CoreDataLeagueViewModel:CoreDataLeagueProtocaol{
  
 
    
    
    
    let leagueCoreData = LeaguesCoreData.sharedDataLeagues
    lazy var leagueArray = retriveleagueModel()
    
    
    
   private func retriveleagueModel()->[Leagues]?{
        if let (_,retrivedData) = leagueCoreData.retrivedLeagueList(){
            return retrivedData
            
        }
        return nil
    }
    
    func removeLeagueFromFavorite(league:Leagues) {
        if let getIndexLeague = leagueArray?.firstIndex(of:league){
            leagueCoreData.deleteLeague(index: getIndexLeague)
            leagueArray = retriveleagueModel()
        }
          
    }
    
    func addLeagueFromFavorite(league:Leagues) {
        leagueCoreData.setLeaguesDetalis(leagueKey: league.leagueKey, leagueName: league.leagueName, leagueLogo: league.leagueLogo ?? K.defaultLeagueLogo, countryName: league.countryName, countryLogo: league.countryLogo ?? "No Country Logo", countryKey: league.countryKey)
        
        leagueArray?.removeAll()
        leagueArray = retriveleagueModel()
         
    }
    func checkExistanceOfFavorite(league:Leagues) -> Bool {
        if let _ = leagueArray?.first(where: {$0.leagueKey == league.leagueKey}){
            return true
        }
        return false
    }
    
    
    
    
    
}
