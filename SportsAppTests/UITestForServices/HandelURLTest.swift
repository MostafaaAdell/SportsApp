//
//  HandelURLTest.swift
//  SportsAppTests
//
//  Created by Mustafa on 11/10/2023.
//

import XCTest
@testable import SportsApp

final class HandelURLTest: XCTestCase {


    
    var sportType = "football"
    var leagueId = 152
    var teamId = 141
    
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    //MARK: - Testing Sport Type Url
    func testULRForSports(){
         
        let url = HandelURL(sportType: sportType)
        
        switch url.sportChossen{
            
        case .football:
            XCTAssertEqual(url.URlApi, "https://apiv2.allsportsapi.com/\(sportType)/?met=Leagues&APIkey=10450c41674e1753658fa155979ccb6e59c7649b49a5a0cd3508b5e823f50499", "Url Prepared For Football APi Call is invalid")
            break
        case .basketball:
            XCTAssertEqual(url.URlApi, "https://apiv2.allsportsapi.com/\(sportType)/?met=Leagues&APIkey=10450c41674e1753658fa155979ccb6e59c7649b49a5a0cd3508b5e823f50499", "Url Prepared For BasketBall APi Call is invalid")
            break
        case .tennis:
            XCTAssertEqual(url.URlApi, "https://apiv2.allsportsapi.com/\(sportType)/?met=Leagues&APIkey=10450c41674e1753658fa155979ccb6e59c7649b49a5a0cd3508b5e823f50499", "Url Prepared For Tennis APi Call is invalid")
            break
        case .cricket:
            XCTAssertEqual(url.URlApi, "https://apiv2.allsportsapi.com/\(sportType)/?met=Leagues&APIkey=10450c41674e1753658fa155979ccb6e59c7649b49a5a0cd3508b5e823f50499", "Url Prepared For Cricket APi Call is invalid")
            break
         default:
           XCTFail("Invalid Type of Sport Entered")
            break
       
        }
            
            
        
        
    }
    
    //MARK: - Testing Upcomming Event of Sport Url

    func testULRForUpCommingSports(){
         
        let url = HandelURL(sportType: sportType,leagueIdWithUpcomiingEvent: leagueId)
        
        switch url.sportChossen{
            
        case .football:
            XCTAssertEqual(url.URlApi, "https://apiv2.allsportsapi.com/\(sportType)?met=Fixtures&leagueId=\(leagueId)&from=\(Date.getCurrentDate())&to=\(Date.getNextYeatDate())&APIkey=10450c41674e1753658fa155979ccb6e59c7649b49a5a0cd3508b5e823f50499", "Url Prepared For Football League Upcomming Event APi Call is invalid")
            break
        case .basketball:
            XCTAssertEqual(url.URlApi, "https://apiv2.allsportsapi.com/\(sportType)?met=Fixtures&leagueId=\(leagueId)&from=\(Date.getCurrentDate())&to=\(Date.getNextYeatDate())&APIkey=10450c41674e1753658fa155979ccb6e59c7649b49a5a0cd3508b5e823f50499", "Url Prepared For BasketBall League Upcomming Event APi Call is invalid")
            break
        case .tennis:
            XCTAssertEqual(url.URlApi, "https://apiv2.allsportsapi.com/\(sportType)?met=Fixtures&leagueId=\(leagueId)&from=\(Date.getCurrentDate())&to=\(Date.getNextYeatDate())&APIkey=10450c41674e1753658fa155979ccb6e59c7649b49a5a0cd3508b5e823f50499", "Url Prepared For Tennis League Upcomming Event APi Call is invalid")
            break
        case .cricket:
            XCTAssertEqual(url.URlApi, "https://apiv2.allsportsapi.com/\(sportType)?met=Fixtures&leagueId=\(leagueId)&from=\(Date.getCurrentDate())&to=\(Date.getNextYeatDate())&APIkey=10450c41674e1753658fa155979ccb6e59c7649b49a5a0cd3508b5e823f50499", "Url Prepared For Cricket League Upcomming Event APi Call is invalid")
            break
         default:
           XCTFail("There is no UpComming Event For This League")
            break
       
        }
            
            
        
        
    }
    
    //MARK: - Testing Latest Event of Sport Url
    func testULRForLatestSports(){
         
        let url = HandelURL(sportType: sportType , leagueIdWithLatestEvent: leagueId)
        
        switch url.sportChossen{
            
        case .football:
            XCTAssertEqual(url.URlApi, "https://apiv2.allsportsapi.com/\(sportType)?met=Fixtures&leagueId=\(leagueId)&from=\(Date.getLastYearDate())&to=\(Date.getCurrentDate())&APIkey=10450c41674e1753658fa155979ccb6e59c7649b49a5a0cd3508b5e823f50499", "Url Prepared For Football League Latest Event APi Call is invalid")
            break
        case .basketball:
            XCTAssertEqual(url.URlApi, "https://apiv2.allsportsapi.com/\(sportType)?met=Fixtures&leagueId=\(leagueId)&from=\(Date.getLastYearDate())&to=\(Date.getCurrentDate())&APIkey=10450c41674e1753658fa155979ccb6e59c7649b49a5a0cd3508b5e823f50499", "Url Prepared For Basketball League Latest Event APi Call is invalid")
        case .tennis:
            XCTAssertEqual(url.URlApi, "https://apiv2.allsportsapi.com/\(sportType)?met=Fixtures&leagueId=\(leagueId)&from=\(Date.getLastYearDate())&to=\(Date.getCurrentDate())&APIkey=10450c41674e1753658fa155979ccb6e59c7649b49a5a0cd3508b5e823f50499", "Url Prepared For Tennis League Latest Event APi Call is invalid")
            break
        case .cricket:
            XCTAssertEqual(url.URlApi, "https://apiv2.allsportsapi.com/\(sportType)?met=Fixtures&leagueId=\(leagueId)&from=\(Date.getLastYearDate())&to=\(Date.getCurrentDate())&APIkey=10450c41674e1753658fa155979ccb6e59c7649b49a5a0cd3508b5e823f50499", "Url Prepared For Cricket League Latest Event APi Call is invalid")
            break
         default:
            XCTFail("There is no Latest Event For This League")
            break
       
        }
            
            
        
        
    }
    
    //MARK: - Testing Team Details of Sport Url
    func testULRForTeamSports(){
         
        let url = HandelURL(sportType: sportType , teamId: teamId)
        
        switch url.sportChossen{
            
        case .football:
            XCTAssertEqual(url.URlApi, "https://apiv2.allsportsapi.com/\(sportType)?&met=Teams&teamId=\(teamId)&APIkey=10450c41674e1753658fa155979ccb6e59c7649b49a5a0cd3508b5e823f50499", "Url Prepared For Football Team APi Call is invalid")
            break
        case .basketball:
            XCTAssertEqual(url.URlApi, "https://apiv2.allsportsapi.com/\(sportType)?&met=Teams&teamId=\(teamId)&APIkey=10450c41674e1753658fa155979ccb6e59c7649b49a5a0cd3508b5e823f50499", "Url Prepared For Basketball Team APi Call is invalid")
            break
        case .tennis:
            XCTAssertEqual(url.URlApi, "https://apiv2.allsportsapi.com/\(sportType)?&met=Teams&teamId=\(teamId)&APIkey=10450c41674e1753658fa155979ccb6e59c7649b49a5a0cd3508b5e823f50499", "Url Prepared For Tennis Team APi Call is invalid")
            break
        case .cricket:
            XCTAssertEqual(url.URlApi, "https://apiv2.allsportsapi.com/\(sportType)?&met=Teams&teamId=\(teamId)&APIkey=10450c41674e1753658fa155979ccb6e59c7649b49a5a0cd3508b5e823f50499", "Url Prepared For Cricket Team APi Call is invalid")
            break
         default:
           XCTFail("Invalid Teams For This League")
            break
       
        }
            
            
        
        
    }
    

}
