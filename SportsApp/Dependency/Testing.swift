
import Foundation
import Alamofire

protocol TabViewModelProtocol{
    func getLeaguesFromApi()
    func getLeaguesArray ()->GetAllLeagues?
    func getNumberOfItem() -> Int?
    var handerDataRetrived : (() -> Void)?{get set}
    
}



class TabViewModel:TabViewModelProtocol {
    var handerDataRetrived: (() -> Void)?
    
    
    
    
    var getAllLeagues: GetAllLeagues? {
        didSet{
            if let validHander =  handerDataRetrived {
                validHander()
            }
        }
    }
    
    var services:NetworkServiceDelegate?
    
    
    
    init(netWorkServies:NetworkServiceDelegate){
        self.services = netWorkServies
    }
    
    
    
    func getLeaguesFromApi(){
        
        services?.fetchDataFromAPIForFootball { (data: AFDataResponse<Data?>? , error: Error?)in
            if let validData = data?.data{
                do{
                    let dataRetivied = try JSONDecoder().decode(GetAllLeagues.self, from: validData)
                    self.getAllLeagues = dataRetivied
                    print(self.getAllLeagues?.result )
                    
                }catch let error{print(error.localizedDescription.description)}
            }
            else{print("there is error in Casting Data")}
            
            
        }
        
    }
    
    func getLeaguesArray() -> GetAllLeagues? {
        return getAllLeagues
    }
    func getNumberOfItem() -> Int?{
        return getAllLeagues?.result.count
    }
    
}
