//
//  DependencyInjection.swift
//  SportsApp
//
//  Created by Mustafa on 30/09/2023.
//

import Foundation
import UIKit
struct DependencyProvider{
    static var sportType:String = "football"
    static var leaugeID:Int = 0
    static var teamId:Int = 0
    //Leagues
    static var ApiLeaguesSports:ApiPreparationDelegate {
        return HandelURL(sportType: sportType)
    }
    //Upcomming
    static var ApiUpCommingEventSports:ApiPreparationDelegate {
        return HandelURL(sportType: sportType,leagueIdWithUpcomiingEvent: leaugeID)
    }
    
    //latest Event
    static var ApiUpLatestEventSports:ApiPreparationDelegate {
        return HandelURL(sportType: sportType,leagueIdWithLatestEvent: leaugeID)
    }
 
    //Team Details
    static var ApiTeamsDetalistSports:ApiPreparationDelegate {
        return HandelURL(sportType: sportType,teamId:  teamId)
    }
    
    
    
    
    //Network Call for sports leagues
    static var NetworkServicesForLeagues:NetworkServiceDelegate{
        return NetworkServices(setUrl: ApiLeaguesSports)
    }
    
    //Network Call for sports Upcooming Event
    static var NetworkServicesForUpcommingEvent:NetworkServiceDelegate{
        return NetworkServices(setUrl: ApiUpCommingEventSports)
    }
    
    //Network Call for sports Latest Event
    static var NetworkServicesForLatestEvent:NetworkServiceDelegate{
        return NetworkServices(setUrl: ApiUpLatestEventSports)
    }
    
    //Network Call for sports Team Detalis
    static var NetworkServicesForTeamDetalis:NetworkServiceDelegate{
        return NetworkServices(setUrl: ApiTeamsDetalistSports)
    }
    
    
    
//    static var tabViewSports:TabViewModelProtocol{
//        
//       return TabViewModel(netWorkServies: NetworkServicesForLeagues)
//    }
// 
    
    
//
//    static var tabViewController:LeaguesViewController {
////        let vc = LeaguesViewController(nibName: K.leaguesViewController, bundle: nil)
////         vc.viewFootballLeague = tabViewSports
////         vc.view.backgroundColor = .white
////         vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
////         vc.modalPresentationStyle = .fullScreen
////        return vc
//    }

}





//import Foundation
//import Alamofire
//
//protocol TabViewModelProtocol{
//    func getLeaguesFromApi()
//    func getLeaguesArray ()->GetAllLeagues?
//    func getNumberOfItem() -> Int?
//    var handerDataRetrived : (() -> Void)?{get set}
//
//}
//
//
//
//class TabViewModel:TabViewModelProtocol {
//    var handerDataRetrived: (() -> Void)?
//
//
//
//
//    var getAllLeagues: GetAllLeagues? {
//        didSet{
//            if let validHander =  handerDataRetrived {
//                validHander()
//            }
//        }
//    }
//
//    var services:NetworkServiceDelegate?
//
//
//
//    init(netWorkServies:NetworkServiceDelegate){
//        self.services = netWorkServies
//    }
//
//
//
//    func getLeaguesFromApi(){
//
//        services?.fetchDataFromAPIForFootball { (data: AFDataResponse<Data?>? , error: Error?)in
//            if let validData = data?.data{
//                do{
//                    let dataRetivied = try JSONDecoder().decode(GetAllLeagues.self, from: validData)
//                    self.getAllLeagues = dataRetivied
//                    print(self.getAllLeagues?.result )
//
//                }catch let error{print(error.localizedDescription.description)}
//            }
//            else{print("there is error in Casting Data")}
//
//
//        }
//
//    }
//
//    func getLeaguesArray() -> GetAllLeagues? {
//        return getAllLeagues
//    }
//    func getNumberOfItem() -> Int?{
//        return getAllLeagues?.result.count
//    }
//
//}


