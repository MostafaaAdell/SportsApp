//
//  GetAllLeagueSingle.swift
//  SportsApp
//
//  Created by Mustafa on 04/10/2023.
//

import Foundation

protocol AllLeagueProtocol{
    func getDataFromApiForLeagues()
    func getLeaguesArray ()->AllLeagueModel?
    func getNumberOfLeagues() -> Int?
    var handerDataOfLeagues : (() -> Void)?{get set}
}

class AllLeagues:AllLeagueProtocol{
 
    
    
    
    var handerDataOfLeagues: (() -> Void)? 
    
    var getAllLeagues: AllLeagueModel? {
        didSet{
            if let validHander =  handerDataOfLeagues {
                validHander()
            }
        }
    }
    var services: NetworkServiceDelegate?

    init(services: NetworkServiceDelegate?){
        self.services = services
    }
    
    func getLeaguesArray() -> AllLeagueModel? {
        return getAllLeagues
    }
    
    func getDataFromApiForLeagues() {
        services?.fetchDataFromAPIForFootball(Handler: { (dataValue:AllLeagueModel?, error: Error?) in

            if let data = dataValue {
                self.getAllLeagues = data
            }else {
                if let error = error{
                    print(error.localizedDescription)
                }
            }
        })
    }
  
    
    func getNumberOfLeagues() -> Int? {
        return getAllLeagues?.result.count
    }
    
  
    
    
}


