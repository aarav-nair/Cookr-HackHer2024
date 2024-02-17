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
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
//            Spacer()
//            ScrollView {
                Text("Recipes")
                    .font(.title)
                    .bold()
                Text("Your Favorites")
                    .font(.title2)
                NavigationStack {
                    
                    ForEach(searchResults, id: \.self) { recipe in
                        IndividualRecipeView(recipe: recipe)
                    }
                    
                }
                .background(Color.defaultBackgroundColor)
                .searchable(text: $searchText)
                
//            }
//            Spacer()
        }
        .background(Color.defaultBackgroundColor)
    }
    
    var searchResults: [Recipe] {
        if searchText.isEmpty {
            return recipeArray
        } else {
            return recipeArray.filter { $0.recipeName.lowercased().contains(searchText.lowercased()) }
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
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .padding()
                    
                    VStack {
                        Text(recipe.recipeName)
                            .font(.title)
                            .bold()
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                            .foregroundStyle(.black)
                        Text(recipe.funFact ?? "")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                    }
                }
                HStack {
                    Spacer()
                    Image(systemName: "takeoutbag.and.cup.and.straw")
                        .bold()
                        .foregroundStyle(.black)
                    Text("\(recipe.ingredients.count) Ingredients")
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.black)
                    Spacer()
                    Image(systemName: "clock")
                        .bold()
                        .foregroundStyle(.black)
                    Text("\(recipe.cookTime) Min")
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.black)
                    Spacer()
                    Image(systemName: "flame")
                        .foregroundStyle(.black)
                        .bold()
                    Text("\(recipe.calories) Cal")
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.black)
                    Spacer()
                }
            }
            .sheet(isPresented: $showingSheet) {
                DetailedRecipeView(recipe: recipe)
            }
        }
        .padding(.horizontal)
        .background(Color.defaultForegroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
    }
}
    
#Preview {
    let rec = Recipe(id: 1, imageName: "cheesepizza", recipeName: "Cheese Pizza", cookTime: 12, calories: 300, cuisine: "Italian", dietaryPreferences: ["Vegetarian"], ingredients: ["Dough", "Cheese", "Sauce"], instructions: ["Spread the pizza sauce onto the dough.",  "Sprinkle with cheeses.", "Bake for 12 to 14 minutes."], funFact: "Pizza tastes good")
    let rec2 = Recipe(id: 2, imageName: "cheesepizza", recipeName: "Cheese Pizza", cookTime: 12, calories: 300, cuisine: "Italian", dietaryPreferences: ["Vegetarian"], ingredients: ["Dough", "Cheese", "Sauce"], instructions: ["Spread the pizza sauce onto the dough.",  "Sprinkle with cheeses.", "Bake for 12 to 14 minutes."])
    let rec3 = Recipe(id: 3, imageName: "cheesepizza", recipeName: "Random food", cookTime: 12, calories: 300, cuisine: "Italian", dietaryPreferences: ["Vegetarian"], ingredients: ["Dough", "Cheese", "Sauce"], instructions: ["Spread the pizza sauce onto the dough.",  "Sprinkle with cheeses.", "Bake for 12 to 14 minutes."])
    return MyRecipesView(recipeArray: [rec, rec2, rec3])
}
