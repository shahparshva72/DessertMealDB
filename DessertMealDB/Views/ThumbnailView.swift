//
//  ThumbnailView.swift
//  DessertMealDB
//
//  Created by Parshva Shah on 5/11/23.
//

import SwiftUI

struct ThumbnailView: View {
    
    var meal: Meal
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: meal.thumbnailURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .gray, radius: 5, x: 2, y: 2)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                
            } placeholder: {
                ProgressView()
                    .scaleEffect(1.5, anchor: .center)
            }
            .frame(width: 100, height: 100)
            
            Text(meal.strMeal)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .lineLimit(nil)
        }
        .padding(.horizontal)
    }
}
