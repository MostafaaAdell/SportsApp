//
//  NetworkServies.swift
//  SportsApp
//
//  Created by Mustafa on 27/09/2023.
//

import Foundation

protocol NetworkServiceDelegate{
      func fetchDataFromAPIForFootball(Handler:@escaping(getLeagues? , Error?)->Void)
}

class NetworkServices: NetworkServiceDelegate {
    
    var apiURL = APIConstant(sportType: "football")
    
    
    func fetchDataFromAPIForFootball(Handler: @escaping (getLeagues?,Error?) -> Void) {
        
        let url = URL(string: apiURL.URlAApi)
        guard let validUrl = url else{Handler(nil,nil);return }
        
        let request = URLRequest(url: validUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
         
            guard let validData = data else{Handler(nil, error);return}
            do{
                let leagues = try JSONDecoder().decode(getLeagues.self, from: validData)
                Handler(leagues  ,nil)
            }catch let error{
                print(error.localizedDescription.description)
                Handler(nil,error)
            }
        
        }
        
        task.resume()
        
    }
    
    
}
