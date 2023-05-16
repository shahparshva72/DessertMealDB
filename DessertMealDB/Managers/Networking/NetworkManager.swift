//
//  NetworkingManager.swift
//  DessertMealDB
//
//  Created by Parshva Shah on 5/11/23.
//

import Foundation

class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    
    func getMeals(for filterName: String) async throws -> Meals {
        
        let dessertURL = "https://themealdb.com/api/json/v1/1/filter.php?c=\(filterName)"
        
        guard let url = URL(string: dessertURL) else {
            throw DMError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw DMError.responseError
        }
        
        guard let decodedData = try? JSONDecoder().decode(Meals.self, from: data) else {
            throw DMError.decodeError
        }
        
        return decodedData
        
    }
    
    func getMealInformation(for meal_id: String) async throws -> MealDetailResponse {
        
        let mealURL = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(meal_id)"
        
        guard let url = URL(string: mealURL) else {
            throw DMError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw DMError.responseError
        }
                
        guard let decodedData = try? JSONDecoder().decode(MealDetailResponse.self, from: data) else {
            throw DMError.decodeError
        }
        
        return decodedData
    }
}
