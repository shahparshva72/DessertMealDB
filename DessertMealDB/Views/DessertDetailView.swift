//
//  DessertDetailView.swift
//  DessertMealDB
//
//  Created by Parshva Shah on 5/14/23.
//

import SwiftUI

struct DessertDetailView: View {
    @ObservedObject var viewModel = MealDetailViewModel()
    let mealId: String
    
    var body: some View {
        ScrollView {
            if let dessertDetail = viewModel.mealDetailResponse?.meals?.first {
                DessertDetailContent(dessert: dessertDetail)
            } else if viewModel.error != nil {
                VStack{
                    Text(viewModel.error?.localizedDescription ?? "")
                    Button("Try again") {
                        viewModel.fetchMealDetail(mealId: mealId)
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchMealDetail(mealId: mealId)
        }
        .navigationTitle("Dessert Detail")
    }
}

struct DessertDetailContent: View {
    let dessert: MealDetail
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(dessert.strMeal)
                    .font(.title)
                    .fontWeight(.medium)
                
                AsyncImage(url: URL(string: dessert.strMealThumb)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFit()
                .cornerRadius(10)
                
                SourceButtons(dessert: dessert)
                
                IngredientList(ingredients: dessert.ingredients)
                
                InstructionText(instructions: dessert.strInstructions)
            }
            .padding()
        }
    }
}

struct IngredientList: View {
    let ingredients: [Ingredient]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Ingredients")
                .font(.headline)
                .padding(.vertical, 9)
            
            ForEach(ingredients, id: \.name) { ingredient in
                IngredientRow(ingredient: ingredient)
            }
        }
    }
}

struct IngredientRow: View {
    let ingredient: Ingredient
    
    var body: some View {
        HStack {
            Text(ingredient.name)
                .fontWeight(.semibold)
            Spacer()
            Text(ingredient.measure)
        }
    }
}

struct InstructionText: View {
    let instructions: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Instructions")
                .font(.headline)
                .padding(.vertical, 9)
            
            Text(instructions)
                .font(.body)
        }
    }
}

struct SourceButtons: View {
    @State private var showYoutube: Bool = false
    @State private var showSource: Bool = false
    
    let dessert: MealDetail
    
    var body: some View {
        HStack(spacing: 18) {
            Image("youtube-icon")
                .resizable()
                .frame(width: 44, height: 44)
                .onTapGesture {
                    showYoutube.toggle()
                }
                .fullScreenCover(isPresented: $showYoutube) {
                    if let ytLink = dessert.strYoutube {
                        SFSafariViewWrapper(url: URL(string: ytLink)!)
                    } else {
                        CustomAlertView(title: "No video available", message: "Video for this recipe is unavailable", showAlert: $showYoutube)
                    }
                }
            
            Image(systemName: "link")
                .frame(width:44, height: 44)
                .onTapGesture {
                    showSource.toggle()
                }
                .fullScreenCover(isPresented: $showSource) {
                    if let srcLink = dessert.strSource {
                        SFSafariViewWrapper(url: URL(string: srcLink)!)
                    } else {
                        CustomAlertView(title: "No source available", message: "Link to this recipe in unavailable", showAlert: $showSource)
                    }
                }
        }
    }
}
