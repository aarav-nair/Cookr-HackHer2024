//
//  DetailedRecipeView.swift
//  Cooker
//
//  Created by Aarav Nair on 2/17/24.
//

import Foundation
import SwiftUI

struct DetailedRecipeView: View {
    @Environment(\.dismiss) var dismiss
    var recipe: Recipe
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "x.circle")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                        .padding(.horizontal)
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "trash")
                        .padding()
                        .foregroundColor(Color.red)
                }
            }
            Text(recipe.recipeName)
                .font(.title)
            Image(recipe.imageName)
                .resizable()
                .frame(width: 150, height: 150)
            
            Text("Cook Time: \(recipe.cookTime) minutes")
                .font(.subheadline)
            if (recipe.funFact != nil) {
                Text("Fun Fact: " + recipe.funFact!)
                    .font(.subheadline)
            }

            Text("Ingredients:")
                .font(.title2)
            ForEach(recipe.ingredients, id: \.self) { ingredient in
                HStack {
                    Text("• " + ingredient)
                        .font(.body)
                        .padding(.horizontal)
                    Spacer()
                }
            }
            
            Text("Instructions:")
            ForEach(recipe.instructions.indices) { i in
                HStack {
                    Text("\(i+1). \(recipe.instructions[i])")
                        .padding(.horizontal)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    let rec = Recipe(id: 1, imageName: "cheesepizza", recipeName: "Cheese Pizza", cookTime: 12, calories: 300, cuisine: "Italian", dietaryPreferences: ["Vegetarian"], ingredients: ["Dough", "Cheese", "Sauce"], instructions: ["Spread the pizza sauce onto the dough.",  "Sprinkle with cheeses.", "Bake for 12 to 14 minutes."])
    return DetailedRecipeView(recipe: rec)
}
    
