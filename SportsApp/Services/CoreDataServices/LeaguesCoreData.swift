//
//  LeaguesCoreData.swift
//  SportsApp
//
//  Created by Mustafa on 30/09/2023.
//

import UIKit
import Foundation
import CoreData

class LeaguesCoreData{
    
    private let appDelegate : AppDelegate
    private let context : NSManagedObjectContext
    private let tableName :String
    lazy var leagueList:(leagueArrayObject:[NSManagedObject]? , leagueArrayItem:[Leagues]?)?  = retrivedLeagueList()
    
    //MARK: - Singletone to save data and create one instance only
    static let sharedDataLeagues = LeaguesCoreData()
    
    private  init(){
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        tableName = "Leagues"
        
    }
    
    
    //MARK: - Function to set value of league in Core Data
    func setLeaguesDetalis( leagueKey:Int, leagueName:String, leagueLogo:String, countryName:String, countryLogo:String,countryKey:Int) ->Void {
        
        guard let entity = NSEntityDescription.entity(forEntityName: tableName, in: context) else{
            print("There error in access Entity")
            return
        }
        let league = NSManagedObject(entity: entity, insertInto: context)
        
        league.setValue(leagueKey, forKey: "leagueKey")
        league.setValue(leagueName, forKey: "leagueName")
        league.setValue(leagueLogo, forKey: "leagueLogo")
        league.setValue(countryName, forKey: "countryName")
        league.setValue(countryLogo, forKey: "countryLogo")
        league.setValue(countryKey, forKey: "countryKey")
        do{
            try context.save()
        }catch let error as NSError{
            print("Error\(error)")
        }
        
        
    }
    
    
    //MARK: - Function retrivied League List
    func retrivedLeagueList() ->([NSManagedObject] ,[Leagues])?{
        
        var leagueArray = [Leagues]()
        var leaguesNSObject = [NSManagedObject]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: tableName)
        
        do{
            leaguesNSObject = try context.fetch(fetchRequest)
            for league in leaguesNSObject {
                guard let leagueKey  = league.value(forKey: "leagueKey") as? Int else {return nil}
                guard let countryKey  = league.value(forKey: "countryKey") as? Int else {return nil}
                guard let leagueName  = league.value(forKey: "leagueName")as? String else {return nil}
                guard let leagueLogo  = league.value(forKey: "leagueLogo")as? String else {return nil}
                guard let countryName  = league.value(forKey: "countryName")as? String else {return nil}
                guard let countryLogo  = league.value(forKey: "countryLogo")as? String else {return nil}
                
                let leauesValues = Leagues(leagueKey: leagueKey, leagueName: leagueName, countryKey: countryKey, countryName: countryName, leagueLogo: leagueLogo, countryLogo: countryLogo)
                leagueArray.append(leauesValues)
                
            }
            
        }catch let error as NSError{
            print("Error\(error)")
        }
        leagueList = (leaguesNSObject,leagueArray)
        return(leaguesNSObject,leagueArray)
    }
    
    
    
    //MARK: - Delete All Data leages in Core Data
    private func deleteLeagueCoreData(){
        if let (leagues,_) = retrivedLeagueList() {
            for league in leagues{
                context.delete(league)
                leagueList?.leagueArrayObject?.remove(at: 0)
                
            }
        }
        
        leagueList?.leagueArrayItem?.removeAll()
        do{
            try context.save()
        }catch let error as NSError{
            print(error)
        }
    }
    
    
    
    //MARK: - Load All Leagues Data
    func loadAllLeagueData(loadLeagueList:[Leagues]){
        deleteLeagueCoreData()
        for league in loadLeagueList{
            
            setLeaguesDetalis(leagueKey: league.leagueKey , leagueName: league.leagueName , leagueLogo: league.leagueLogo ?? K.defaultLeagueLogo , countryName: league.countryName , countryLogo: league.countryLogo ?? "No Country Logo", countryKey: league.countryKey )
        }
        
        leagueList =  retrivedLeagueList()
    }
    
    
    //MARK: - Delete Single League
    func deleteLeague (index: Int){
        
        context.delete((leagueList?.leagueArrayObject?[index])!)
        leagueList?.leagueArrayObject?.remove(at: index)
        leagueList?.leagueArrayItem?.remove(at: index)
        
        do{
            try context.save()
        }catch let error as NSError{
            print(error)
        }
        
        
    }
    
}
