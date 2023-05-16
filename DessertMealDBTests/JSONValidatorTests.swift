//
//  JSONValidtorTests.swift
//  DessertMealDBTests
//
//  Created by Parshva Shah on 5/15/23.
//

import Foundation
import XCTest

@testable import DessertMealDB

class JSONValidatorTests: XCTestCase {
    
    func test_meal_json() throws {
        let json = """
        {
            "strMeal": "Apam balik",
            "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
            "idMeal": "53049"
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let meal = try decoder.decode(Meal.self, from: json)
        
        XCTAssertEqual(meal.strMeal, "Apam balik")
        XCTAssertEqual(meal.strMealThumb, "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
        XCTAssertEqual(meal.idMeal, "53049")
    }
    
    func test_meal_detail_json() throws {
        // Loading a sample response file for this json validation case
        let meal: MealDetailResponse = JSONLoader().load("mealdetailresponse.json")
        
        XCTAssertEqual(meal.meals![0].strMeal, "Apam balik")
        XCTAssertEqual(meal.meals![0].strMealThumb, "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
        XCTAssertEqual(meal.meals![0].idMeal, "53049")
        XCTAssertEqual(meal.meals![0].strCategory, "Dessert")
        XCTAssertEqual(meal.meals![0].strArea, "Malaysian")
        XCTAssertEqual(meal.meals![0].strInstructions, "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm.")
        XCTAssertEqual(meal.meals![0].strYoutube, "https://www.youtube.com/watch?v=6R8ffRRJcrg")
        // Can perform this for remaining ingredients and measures.
        XCTAssertEqual(meal.meals![0].ingredients[0].name, "Milk")
        XCTAssertEqual(meal.meals![0].ingredients[0].measure, "200ml")
        XCTAssertEqual(meal.meals![0].strSource, "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ")
    }
    
}
