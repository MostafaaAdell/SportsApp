//
//  CoreDataViewModel.swift
//  SportsApp
//
//  Created by Mustafa on 09/10/2023.
//

import Foundation

protocol CoreDataLeagueProtocaol{
    func retriveleagueModel()->[Leagues]?
    func removeLeagueFromFavorite(league:Leagues)
    func addLeagueFromFavorite(league:Leagues)
    func checkExistanceOfFavorite(league:Leagues)->Bool
    func deleteLeagueFormCollection(index:Int)
}
class CoreDataLeagueViewModel:CoreDataLeagueProtocaol{
  
 
    
    
    
    let leagueCoreData = LeaguesCoreData.sharedDataLeagues
    lazy var leagueArray = retriveleagueModel()
    
    
    //MARK: - Retrived leagues from Local Data
    func retriveleagueModel()->[Leagues]?{
        if let (_,retrivedData) = leagueCoreData.retrivedLeagueList(){
            return retrivedData
            
        }
        return nil
    }
    
    //MARK: -Remove League From reloaded Leagues
    func removeLeagueFromFavorite(league:Leagues) {
        if let getIndexLeague = leagueArray?.firstIndex(of:league){
            leagueCoreData.deleteLeague(index: getIndexLeague)
            leagueArray = retriveleagueModel()
        }
          
    }
    
    //MARK: - Delete League From Core Data
    func deleteLeagueFormCollection(index:Int){
        self.leagueCoreData.deleteLeague(index: index)
    }
    
    
    //MARK: - Adding Legues into Favorites
    func addLeagueFromFavorite(league:Leagues) {
        leagueCoreData.setLeaguesDetalis(leagueKey: league.leagueKey, leagueName: league.leagueName, leagueLogo: league.leagueLogo ?? K.defaultLeagueLogo, countryName: league.countryName, countryLogo: league.countryLogo ?? "No Country Logo", countryKey: league.countryKey)
        
        leagueArray?.removeAll()
        leagueArray = retriveleagueModel()
         
    }
    
    //MARK: - Check Leagues in Favorites Or Not
    func checkExistanceOfFavorite(league:Leagues) -> Bool {
        if let _ = leagueArray?.first(where: {$0.leagueKey == league.leagueKey}){
            return true
        }
        return false
    }
    
    
    
    
    
}
