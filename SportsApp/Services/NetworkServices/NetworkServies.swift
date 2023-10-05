//
//  NetworkServies.swift
//  SportsApp
//
//  Created by Mustafa on 27/09/2023.
//

import Foundation
import Alamofire

protocol NetworkServiceDelegate{
    var setUrl:ApiPreparationDelegate {get set}
    func fetchDataFromAPIForFootball<T:Codable>(Handler:@escaping(T? , Error?)->Void)
}

class NetworkServices: NetworkServiceDelegate {
    var setUrl: ApiPreparationDelegate
    
    init(setUrl:ApiPreparationDelegate){
        self.setUrl = setUrl
    }
  
    // Fetching Data From Api
    func fetchDataFromAPIForFootball<T:Codable>(Handler: @escaping (T?,Error?) -> Void) {
        AF.request(setUrl.prepareAPIUrl()).response { data in
            if let validData = data.data {
                do{
                    let dataRetivied = try JSONDecoder().decode(T.self, from: validData)
                    Handler(dataRetivied,nil)
                }catch let error{
                    Handler(nil,error)
                }
                
            }
            else{print("There is error in casting data")}
            
        }
    }
    
}
  

//VC
//var leagues: GetUpcommingEvent?
//var networkService:NetworkServiceDelegate?
//networkService = NetworkServices(setUrl: APIConstant(sportType: K.football,leagueIdWithUpcomiingEvent: 205))
//networkService?.fetchDataFromAPIForFootball { (data: AFDataResponse<Data?>? , error: Error?)in
//    if let validData = data?.data{
//        do{
//            let leagues = try JSONDecoder().decode(GetUpcommingEvent.self, from: validData)
//            print(leagues.result)
//            
//        }catch let error{print(error.localizedDescription.description)}
//    }
//    else{print("there is error in Casting Data")}
//    
//    
//}


//////////////
//let url = URL(string: setUrl.prepareAPIUrl())
//guard let validUrl = url else{Handler(nil,nil);return }
//
//let request = URLRequest(url: validUrl)
//let session = URLSession(configuration: .default)
//let task = session.dataTask(with: request) { data, response, error in
//    if let validData = data as? T{Handler(validData,nil)}
//    else{print("There is error in casting data")}
//}
//
//task.resume()


//do{
//    let leagues = try JSONDecoder().decode(T.self, from: validData)
//    Handler(leagues  ,nil)
//}catch let error{
//    print(error.localizedDescription.description)
//    Handler(nil,error)
//}


