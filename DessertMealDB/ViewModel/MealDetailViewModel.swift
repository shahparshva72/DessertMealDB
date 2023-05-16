//
//  MealDetailViewModel.swift
//  DessertMealDB
//
//  Created by Parshva Shah on 5/15/23.
//

import SwiftUI

class MealDetailViewModel: ObservableObject {
    @Published var mealDetailResponse: MealDetailResponse?
    @Published var error: Error?
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    func fetchMealDetail(mealId: String) {
        Task {
            do {
                let mealDetailData = try await networkManager.getMealInformation(for: mealId)
                DispatchQueue.main.async {
                    if mealDetailData.meals != nil {
                        self.mealDetailResponse = mealDetailData
                    } else {
                        print("Cant find meal information")
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
