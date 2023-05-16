//
//  MockNetworkManager.swift
//  DessertMealDB
//
//  Created by Parshva Shah on 5/15/23.
//

import Foundation

class MockNetworkManager: NetworkManagerProtocol {
    func getMealInformation(for meal_id: String) async throws -> MealDetailResponse {
        let mockMealInfo: MealDetailResponse = JSONLoader().load("mealdetailresponse.json")
        
        return mockMealInfo
    }
    
    func getMeals(for filterName: String) async throws -> Meals {
        let mockMeals = [
            Meal(strMeal: "Apam balik",
                 strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
                 idMeal: "53049"),
            Meal(strMeal: "Apple & Blackberry Crumble",
                 strMealThumb: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
                 idMeal: "52893")
        ]
        
        return Meals(meals: mockMeals)
    }
    
}
