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
  




