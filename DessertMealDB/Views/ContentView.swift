//
//  ContentView.swift
//  DessertMealDB
//
//  Created by Parshva Shah on 5/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DessertViewModel()
    @State private var mealName = ""
    @State private var navTitle = "Desserts"
    
    var body: some View {
        NavigationView {
            if let meals = viewModel.desserts?.meals {
                let filteredDesserts = meals.filter{ meal in
                    mealName.isEmpty || meal.strMeal.lowercased().contains(mealName.lowercased())
                }.sorted {
                    $0.strMeal.lowercased() < $1.strMeal.lowercased()
                }
                
                List(filteredDesserts) { dessert in
                    NavigationLink(destination: DessertDetailView(mealId: dessert.idMeal)) {
                        ThumbnailView(meal: dessert)
                    }
                }
                .searchable(text: $mealName)
                .listStyle(.insetGrouped)
                .navigationTitle(navTitle)
                
            } else if viewModel.error != nil {
                VStack {
                    Text(viewModel.error?.localizedDescription ?? "")
                    Button("Try again") {
                        mealName = ""
                        navTitle = "Desserts"
                        viewModel.fetchDesserts()
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
