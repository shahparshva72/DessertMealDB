//
//  NetworkingManagerProtocol.swift
//  DessertMealDB
//
//  Created by Parshva Shah on 5/15/23.
//

import Foundation

protocol NetworkManagerProtocol {
    func getMeals(for filterName: String) async throws -> MealsModel
    func getMealInformation(for meal_id: String) async throws -> MealDetailResponse
}
