//
//  MissionListTests.swift
//  MissionListTests
//
//  Created by Maciej Szostak on 13/11/2021.
//

import XCTest
@testable import MissionList

class MissionListTests: XCTestCase {

    func missionListDecoding() {
        // tu uzyc apimanagera
        // DI
//        let bundle = Bundle(for: type(of: self))
//        guard let url = bundle.url(forResource: "Missions", withExtension: "json"),
//              let data = try? Data(contentsOf: url) else {
//                  return
//              }
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        guard let mission = try? decoder.decode(Mission.self, from: data) else {
//            return
//        }
        
//        XCTAssertEqual(mission.missionName, "Thaicom")
//        XCTAssertEqual(mission.missionId, "9D1B7E0")
        
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
