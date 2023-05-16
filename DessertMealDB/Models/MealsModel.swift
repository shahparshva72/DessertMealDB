//
//  MealsModel.swift
//  DessertMealDB
//
//  Created by Parshva Shah on 5/11/23.
//

import Foundation

// Model for decoding data for the dessert filter endpoint

struct MealsModel: Decodable {
    let meals: [Meal]?
}

// MARK: - Meal
struct Meal: Decodable, Identifiable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String

    var thumbnailURL: URL {
        URL(string: strMealThumb)!
    }
    
    var id: Int {
        Int(idMeal)!
    }
}


extension Meal: Equatable {}

extension MealsModel: Equatable {}
