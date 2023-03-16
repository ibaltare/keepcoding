//
//  DashboardViewModelTests.swift
//  NutrisTests
//
//  Created by Rodrigo Latorre on 15/03/23.
//

import XCTest
import Combine
@testable import Nutris


final class DashboardViewModelTests: XCTestCase {
    
    var sut: DashboardViewModel!
    
    override func setUp() {
        super.setUp()
        self.sut = DashboardViewModel(testing: true)
    }
    
    override func tearDown() {
        super.tearDown()
        self.sut = nil
    }
    
    func testSetRecipesSuccess() throws {
        sut = DashboardViewModel(testing: true)
        let exp = XCTestExpectation(description: "wait for setRecipes()")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2.0)
        XCTAssert(self.sut.breakfastRecipe != nil)
        XCTAssert(self.sut.lunchRecipe != nil)
        XCTAssert(self.sut.dinnerRecipe != nil)
    }
    
    func testPopRecipeSuccess() throws {
        sut = DashboardViewModel(testing: true)
        let exp = XCTestExpectation(description: "wait for setRecipes()")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.sut.popRecipe(id: 1, food: "Breakfast")
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2.0)
        XCTAssert(sut.breakfastArray.isEmpty)
    }
    
    func testGetAllRecipesSuccess() throws {
        var suscriptor = Set<AnyCancellable>()
        let expectation = self.expectation(description: "Get All Reipes")
        
        sut.breakfastRecipe.publisher
            .sink { completion in
                switch completion {
                case .finished:
                    XCTAssertEqual(1,1)
                    expectation.fulfill()
                case .failure(let err):
                    XCTAssertEqual(1,2)
                    expectation.fulfill()
                }
            } receiveValue: { data in
                XCTAssertEqual(1,1)
            }
            .store(in: &suscriptor)

        sut.getAllRecipes()
        self.waitForExpectations(timeout: 5)
    }
    
    
}

