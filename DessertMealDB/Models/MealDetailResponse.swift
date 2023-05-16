//
//  MealDetailResponse.swift
//  DessertMealDB
//
//  Created by Parshva Shah on 5/14/23.
//

import Foundation

// MARK: - MealDetailResponse
struct MealDetailResponse: Decodable {
    let meals: [MealDetail]?
}

// MARK: - MealDetail
struct MealDetail: Decodable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let strYoutube: String?
    let strSource: String?
    let ingredients: [Ingredient]
    
    var id: Int {
        Int(idMeal)!
    }
    
    enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strCategory, strArea, strInstructions, strMealThumb, strYoutube, strSource
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10
        case strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10
        case strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        idMeal = try container.decode(String.self, forKey: .idMeal)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strCategory = try container.decode(String.self, forKey: .strCategory)
        strArea = try container.decode(String.self, forKey: .strArea)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)
        strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        strYoutube = try container.decodeIfPresent(String.self, forKey: .strYoutube)
        strSource = try container.decodeIfPresent(String.self, forKey: .strSource)
        
        var ingredients: [Ingredient] = []
        for i in 1...20 {
            if let ingredientNameKey = CodingKeys(rawValue: "strIngredient\(i)"),
               let ingredientMeasureKey = CodingKeys(rawValue: "strMeasure\(i)"),
               let ingredientName = try container.decodeIfPresent(String.self, forKey: ingredientNameKey),
               let ingredientMeasure = try container.decodeIfPresent(String.self, forKey: ingredientMeasureKey),
               !ingredientName.isEmpty,
               !ingredientMeasure.isEmpty {
                ingredients.append(Ingredient(name: ingredientName, measure: ingredientMeasure))
            }
        }
        self.ingredients = ingredients
    }
    
    var thumbnailURL: URL {
        URL(string: strMealThumb)!
    }
}

// MARK: - Ingredient
struct Ingredient: Decodable {
    let name: String
    let measure: String
}
