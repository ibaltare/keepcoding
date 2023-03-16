//
//  ProfileViewControllerTests.swift
//  NutrisTests
//
//  Created by Rodrigo Latorre on 15/03/23.
//

import XCTest
import Combine
@testable import Nutris

final class ProfileViewControllerTests: XCTestCase {

    var sut: ProfileViewModel!
    
    override func setUp() {
        super.setUp()
        self.sut = ProfileViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        self.sut = nil
    }
    
//    func testGetUserProfile() throws {
//
//        self.sut = ProfileViewModel()
//
//        let expectation = self.expectation(description: "Espera a llamada de Profile")
//
//        sut.getUserProfile()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            expectation.fulfill()
//        }
//        self.waitForExpectations(timeout: 6)
        
//        XCTAssert(sut.userName != "")
//        XCTAssert(sut.userPhoto != "")
//        XCTAssert(sut.status == .done)
//    }

}
