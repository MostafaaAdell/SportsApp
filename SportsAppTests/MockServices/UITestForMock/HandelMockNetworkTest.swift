//
//  HandelMockNetworkTest.swift
//  SportsAppTests
//
//  Created by Mustafa on 11/10/2023.
//

import XCTest
@testable import SportsApp

final class HandelMockNetworkTest: XCTestCase {

    
    var networkMockTest = MockNetworkManager(shouldReturnError: false)
    
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
    
    //MARK: - Test Load Data for Json Leagues
    func testloadDataFromJsonLeagues(){
        networkMockTest.fetchDataFromApi(jsonData: networkMockTest.leagueMockData) { (data:AllLeagueModel?, error:Error?) in
            guard let leagues = data?.result else{
                XCTFail()
                return
            }
            XCTAssertEqual(leagues.count, 3,"Leagues Count Not Equal")
        }
        
    }
    
    //MARK: - Test Load Data for Json Upcomming Event
    func testloadDataFromJsonUpCommingEvent(){
        networkMockTest.fetchDataFromApi(jsonData: networkMockTest.upcommingEventData) { (data:UpcommingEventModel?, error:Error?) in
            guard let upcommingEvent = data?.result else{
                XCTFail()
                return
            }
            XCTAssertEqual(upcommingEvent.count, 2,"Upcomming Event Count Not Equal")
        }
        
    }
    
    
    //MARK: - Test Load Data for Json Latest Event
    func testloadDataFromJsonLatestEvent(){
        networkMockTest.fetchDataFromApi(jsonData: networkMockTest.LatestEventData) { (data:LatestEventsModel?, error:Error?) in
            guard let latestEvent = data?.result else{
                XCTFail()
                return
            }
            XCTAssertEqual(latestEvent.count, 2,"Latest Event Count Not Equal")
        }
        
    }
    
    
    //MARK: - Test Load Data for Json Team Details
    func testloadDataFromJsonTeamDetails(){
        networkMockTest.fetchDataFromApi(jsonData: networkMockTest.teamDetailsData) { (data:TeamDetailsModel?, error:Error?) in
            guard let teamDeatils = data else{
                XCTFail()
                return
            }
            XCTAssertEqual(teamDeatils.success , 1 ,"Team Details not Found")
        }
        
    }



}
