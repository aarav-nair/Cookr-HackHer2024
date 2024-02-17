//
//  CookerApp.swift
//  Cooker
//
//  Created by Aarav Nair on 2/17/24.
//

import SwiftUI

@main
struct CookerApp: App {
    var body: some Scene {
        WindowGroup {
            let rec = Recipe(id: 1, imageName: "cheesepizza", recipeName: "Cheese Pizza", cookTime: 12, cuisine: "Italian", dietaryPreferences: ["Vegetarian"], ingredients: ["Dough", "Cheese", "Sauce"], instructions: ["Spread the pizza sauce onto the dough.",  "Sprinkle with cheeses.", "Bake for 12 to 14 minutes."])
            let rec2 = Recipe(id: 2, imageName: "cheesepizza", recipeName: "Cheese Pizza", cookTime: 12, cuisine: "Italian", dietaryPreferences: ["Vegetarian"], ingredients: ["Dough", "Cheese", "Sauce"], instructions: ["Spread the pizza sauce onto the dough.",  "Sprinkle with cheeses.", "Bake for 12 to 14 minutes."])
            let rec3 = Recipe(id: 3, imageName: "cheesepizza", recipeName: "Cheese Pizza", cookTime: 12, cuisine: "Italian", dietaryPreferences: ["Vegetarian"], ingredients: ["Dough", "Cheese", "Sauce"], instructions: ["Spread the pizza sauce onto the dough.",  "Sprinkle with cheeses.", "Bake for 12 to 14 minutes."])
            MyRecipesView(recipeArray: [rec, rec2, rec3])
        }
    }
}
