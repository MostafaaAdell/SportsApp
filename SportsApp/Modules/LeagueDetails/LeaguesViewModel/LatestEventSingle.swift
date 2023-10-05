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
}

class LatestEvent:LatestEventProtocol{
    
    var handerDataOfLatestEvent: (() -> Void)?

    private var latestEvent: LatestEventsModel? {
        didSet{
            if let validHander =  handerDataOfLatestEvent {
                validHander()
            }
        }
    }
    var services: NetworkServiceDelegate?

    init(services: NetworkServiceDelegate?){
        self.services = services
    }
    
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
    
    func getLatestEventArray() -> LatestEventsModel? {
        return latestEvent
    }
    
    func getNumberOfLatestEvent() -> Int? {
        return 3
        //return latestEvent?.result.count
    }
    
    
    
}
