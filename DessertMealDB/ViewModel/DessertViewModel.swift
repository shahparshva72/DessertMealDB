//
//  DessertViewModel.swift
//  DessertMealDB
//
//  Created by Parshva Shah on 5/11/23.
//

import SwiftUI

class DessertViewModel: ObservableObject {
    @Published var desserts: MealsModel?
    @Published var error: Error?
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
        fetchDesserts()
    }
    
    func fetchDesserts() {
        Task {
            do {
                let dessertsData = try await networkManager.getMeals(for: "Dessert")
                DispatchQueue.main.async {
                    if dessertsData.meals != nil {
                        self.desserts = dessertsData
                    } else {
                        print("No meals found")
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    self.error = error
                }
            }
        }
    }
}
