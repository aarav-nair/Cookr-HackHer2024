//
//  MyRecipesView.swift
//  Cooker
//
//  Created by Aarav Nair on 2/17/24.
//

import Foundation
import SwiftUI

struct MyRecipesView: View {
    var recipeArray: [Recipe]
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text("Recipes")
                    .font(Font.custom("MyFont", size: 50, relativeTo: .title))
                ForEach(recipeArray, id: \.self) { recipe in
                    IndividualRecipeView(recipe: recipe)
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct IndividualRecipeView: View {
    @State private var showingSheet = false
    var recipe: Recipe
    
    
    var body: some View {
        Button {
            showingSheet.toggle()
        } label: {
            VStack {
                HStack {
                    Image(recipe.imageName)
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .padding()
                    VStack {
                        Text(recipe.recipeName)
                            .font(.title)
                        if (recipe.funFact != nil) {
                            Text("Fun Fact: " + recipe.funFact!)
                                .font(.subheadline)
                        }
                    }
                }
                HStack {
                    Spacer()
                    Image(systemName: "star")
                    Text("Rate")
                        .font(.subheadline)
                    Spacer()
                    Image(systemName: "clock")
                    Text("\(recipe.cookTime)")
                        .font(.subheadline)
                    Spacer()
                    Image(systemName: "flame")
                    Text("Calories")
                        .font(.subheadline)
                    Spacer()
                }
            }
            .sheet(isPresented: $showingSheet) {
                DetailedRecipeView(recipe: recipe)
            }
        }
        .padding(.horizontal)
        .background(Color.mint)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
    }
}
    
#Preview {
    let rec = Recipe(id: 1, imageName: "cheesepizza", recipeName: "Cheese Pizza", cookTime: 12, cuisine: "Italian", dietaryPreferences: ["Vegetarian"], ingredients: ["Dough", "Cheese", "Sauce"], instructions: ["Spread the pizza sauce onto the dough.",  "Sprinkle with cheeses.", "Bake for 12 to 14 minutes."])
    let rec2 = Recipe(id: 2, imageName: "cheesepizza", recipeName: "Cheese Pizza", cookTime: 12, cuisine: "Italian", dietaryPreferences: ["Vegetarian"], ingredients: ["Dough", "Cheese", "Sauce"], instructions: ["Spread the pizza sauce onto the dough.",  "Sprinkle with cheeses.", "Bake for 12 to 14 minutes."])
    let rec3 = Recipe(id: 3, imageName: "cheesepizza", recipeName: "Cheese Pizza", cookTime: 12, cuisine: "Italian", dietaryPreferences: ["Vegetarian"], ingredients: ["Dough", "Cheese", "Sauce"], instructions: ["Spread the pizza sauce onto the dough.",  "Sprinkle with cheeses.", "Bake for 12 to 14 minutes."])
    return MyRecipesView(recipeArray: [rec, rec2, rec3])
}
