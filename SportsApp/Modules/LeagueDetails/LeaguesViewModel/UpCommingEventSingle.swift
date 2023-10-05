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
    
   
    
    
}
