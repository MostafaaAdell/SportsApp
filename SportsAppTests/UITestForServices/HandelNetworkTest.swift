//
//  HandelNetworkTest.swift
//  SportsAppTests
//
//  Created by Mustafa on 11/10/2023.
//

import XCTest
@testable import SportsApp

final class HandelNetworkTest: XCTestCase {

    let networkServicesForLeagues = DependencyProvider.networkServicesForLeague
    let networkServicesForUpcommingEvent = DependencyProvider.networkServicesForUpcommingEvent
    let networkServicesForlatestEvent = DependencyProvider.networkServicesForLatestEvent
    let networkServicesForTeamDetails = DependencyProvider.networkServicesForTeamDetails

    
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
    

    
    //MARK: - Test Data Retirved from APi Call for Leagues
    func testNetworkServicesForLeagues(){
        let expectation = expectation(description: "Wait Data From Api")
        networkServicesForLeagues.fetchDataFromAPIForFootball(Handler: { (dataValue:AllLeagueModel?, error: Error?) in

            guard let Leagues = dataValue else{
                XCTFail("Error To Retrive Data For Leagues")
                expectation.fulfill()
                return
            }
            
            
            XCTAssertEqual(Leagues.success, 1,"Error To found Data Retrived From API")
            expectation.fulfill()
          
        })
        waitForExpectations(timeout: 1000)
        
    }
    
    
    //MARK: - Test Data Retirved from APi Call for UpcommingEvent
    func testNetworkServicesForUpcommingEvent(){
        let expectation = expectation(description: "Wait Data From Api")
        networkServicesForLeagues.fetchDataFromAPIForFootball(Handler: { (dataValue:UpcommingEventModel?, error: Error?) in

            guard let upcommingEvent = dataValue else{
                XCTFail("Error To Retrive Data For Upcomming Event")
                expectation.fulfill()
                return
            }
            
            
            XCTAssertEqual(upcommingEvent.success, 1,"Error To found Data Retrived From API")
            expectation.fulfill()
          
        })
        waitForExpectations(timeout: 10)
        
    }
    
    //MARK: - Test Data Retirved from APi Call for LatestEvent
    func testNetworkServicesForLatestEvent(){
        let expectation = expectation(description: "Wait Data From Api")
        networkServicesForLeagues.fetchDataFromAPIForFootball(Handler: { (dataValue:LatestEventsModel?, error: Error?) in

            guard let latestEvent = dataValue else{
                XCTFail("Error To Retrive Data For Latest Event")
                expectation.fulfill()
                return
            }
            
            
            XCTAssertEqual(latestEvent.success, 1,"Error To found Data Retrived From API")
            expectation.fulfill()
          
        })
        waitForExpectations(timeout: 10)
        
    }
    
    //MARK: - Test Data Retirved from APi Call for Team Details
    func testNetworkServicesForTeamDetails(){
        let expectation = expectation(description: "Wait Data From Api")
        networkServicesForLeagues.fetchDataFromAPIForFootball(Handler: { (dataValue:TeamDetailsModel?, error: Error?) in

            guard let teamDetails = dataValue else{
                XCTFail("Error To Retrive Data For Team Details")
                expectation.fulfill()
                return
            }
            
            
            XCTAssertEqual(teamDetails.success, 1,"Error To found Data Retrived From API")
            expectation.fulfill()
          
        })
        waitForExpectations(timeout: 10)
        
    }
    

}
