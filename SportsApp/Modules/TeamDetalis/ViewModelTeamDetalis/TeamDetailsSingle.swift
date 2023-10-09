//
//  TeamDetailsSingle.swift
//  SportsApp
//
//  Created by Mustafa on 04/10/2023.
//

import Foundation
protocol TeamDetailsProtocol{
    func getDataFromApiForTeamDetails()
    func getTeamIdArray ()->TeamDetailsModel?
    func getNumberOfTeamDetails() -> Int?
    var handerDataOfTeamDetails : (() -> Void)?{get set}
}

class TeamDetailsEvent:TeamDetailsProtocol{
    
    var services: NetworkServiceDelegate?
    var handerDataOfTeamDetails: (() -> Void)?

    private(set) var teamIdDetalis: TeamDetailsModel? {
        didSet{
            if let validHander =  handerDataOfTeamDetails {
                validHander()
            }
        }
    }
    

    init(services: NetworkServiceDelegate?){
        self.services = services
    }
    
    // MARK: - Congigure Call Getting Data From Api for REam Details
    func getDataFromApiForTeamDetails() {
        services?.fetchDataFromAPIForFootball(Handler: { (dataValue:TeamDetailsModel?, error: Error?) in

            if let data = dataValue {
                self.teamIdDetalis = data
            }else {
                if let error = error{
                    print(error.localizedDescription)
                }
            }
        })
    }
    
    // MARK: - Congigure Getting Team Details Model

    func getTeamIdArray() -> TeamDetailsModel? {
        return teamIdDetalis
    }
    
    // MARK: - Congigure Getting Team Details Model Count

    func getNumberOfTeamDetails() -> Int? {
        return teamIdDetalis?.result.count
    }
    
    
    
}
