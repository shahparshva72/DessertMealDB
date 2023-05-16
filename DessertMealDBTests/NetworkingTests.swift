//
//  NetworkingTests.swift
//  DessertMealDBTests
//
//  Created by Parshva Shah on 5/15/23.
//

import Foundation
import XCTest

@testable import DessertMealDB

class NetworkingTests: XCTestCase {
    func testFetchDesserts() async {
        let expectation = XCTestExpectation(description: "Loading desserts")
        let mockNetworkManager = MockNetworkManager()
        let viewModel = DessertViewModel(networkManager: mockNetworkManager)
        
        let expectedMeals = MealsModel(meals: [
            Meal(strMeal: "Apam balik",
                 strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
                 idMeal: "53049"),
            Meal(strMeal: "Apple & Blackberry Crumble",
                 strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
                 idMeal: "52893")
        ])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let result = viewModel.desserts
            XCTAssertEqual(result, expectedMeals)
            expectation.fulfill()
        }
        
        // wait(for: [expectation], timeout: 1.0)
        await fulfillment(of: [expectation], timeout: 1.0, enforceOrder: true)
    }
}
