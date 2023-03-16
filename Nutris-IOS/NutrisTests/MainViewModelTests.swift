//
//  MainViewModelTests.swift
//  NutrisTests
//
//  Created by Rodrigo Latorre on 15/03/23.
//

import XCTest
import Combine
@testable import Nutris

final class MainViewModelTests: XCTestCase {
    var sut: MainViewModel!
    
    override func setUp() {
        super.setUp()
        self.sut = MainViewModel(testing: true)
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testLoginSuccess() throws {
        sut.login(email: "nutris@nutris.com", password: "123456")
        
        let accessToken = getToken(type: .access)
        let refreshToken = getToken(type: .refresh)

        XCTAssert(accessToken != "")
        XCTAssert(refreshToken != "")
    }
    
    func testRegisterSuccess() throws {
        
        let expectation = self.expectation(description: "Espera el cambio de estado")
        
        sut.email = "test\(Int.random(in: 1...1000))@gmail.com"
        sut.password = "123456"
        sut.fullname = "TestFullname"
        sut.age = "20"
        sut.gender = "man"
        sut.weight = "75"
        sut.height = "170"
        sut.photo = ""
        sut.photoExtension = "jpg"
        sut.countryId = 1
        sut.goalId = 1
        sut.activityId = 1
        sut.terms = true
        sut.allergiesIds = [Allergy.Server(id: 1)]
        
        sut.register()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 4)
        
        let accessToken = getToken(type: .access)
        let refreshToken = getToken(type: .refresh)

        XCTAssert(accessToken != "")
        XCTAssert(refreshToken != "")
        XCTAssert(sut.status == Status.Dashboard)
        

    }
    
    func testGetCountriesSuccess() throws {
        let expectation = self.expectation(description: "Obteniendo las Countries")
        
        sut = MainViewModel(testing: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 4)
        XCTAssert(!sut.countries.isEmpty)
    }
    
    func testGetGoalsSuccess() throws {
        let expectation = self.expectation(description: "Obteniendo los Goals")
        
        sut = MainViewModel(testing: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 4)
        XCTAssert(!sut.goals.isEmpty)
    }

    func testGetActivitiesSuccess() throws {
        let expectation = self.expectation(description: "Obteniendo las Activities")
        
        sut = MainViewModel(testing: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 4)
        XCTAssert(!sut.activities.isEmpty)
    }
    
    func testGetAllergiesSuccess() throws {
        let expectation = self.expectation(description: "Obteniendo las Allergies")
        
        sut = MainViewModel(testing: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 4)
        XCTAssert(!sut.allergies.isEmpty)
    }
    
}
