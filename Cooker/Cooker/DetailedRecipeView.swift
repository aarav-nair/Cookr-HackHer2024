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
                }
                Spacer()
            }
            Text(recipe.recipeName)
                .font(.title)
            Image(recipe.imageName)
                .resizable()
                .frame(width: 150, height: 150)
            
            Text("Cook Time: \(recipe.cookTime)")
                .font(.subheadline)
            if (recipe.funFact != nil) {
                Text("Fun Fact: " + recipe.funFact!)
                    .font(.subheadline)
            }
            
            Spacer()
            Text("Ingredients:")
                .font(.title2)
            ForEach(recipe.ingredients, id: \.self) { ingredient in
                Text("• " + ingredient)
                    .font(.body)
            }
            
            Spacer()
            Text("Instructions:")
                .font(.title2)
            ForEach(recipe.instructions.indices) { i in
                Text("\(i+1). \(recipe.instructions[i])")
            }
        }
    }
}

#Preview {
    let rec = Recipe(id: 1, imageName: "cheesepizza", recipeName: "Cheese Pizza", cookTime: 12, cuisine: "Italian", dietaryPreferences: ["Vegetarian"], ingredients: ["Dough", "Cheese", "Sauce"], instructions: ["Spread the pizza sauce onto the dough.",  "Sprinkle with cheeses.", "Bake for 12 to 14 minutes."])
    return DetailedRecipeView(recipe: rec)
}
    
