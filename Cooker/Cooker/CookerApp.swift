//
//  CookerApp.swift
//  Cooker
//
//  Created by Aarav Nair on 2/17/24.
//

import SwiftUI

@main
struct CookerApp: App {
    
    @State private var cookViewModel = CookViewModel()
    
    var body: some Scene {
        WindowGroup {
            let rec = Recipe(id: 1, imageName: "cheesepizza", recipeName: "Cheese Pizza", cookTime: 12, calories: 300, cuisine: "Italian", dietaryPreferences: ["Vegetarian"], ingredients: ["Dough", "Cheese", "Sauce"], instructions: ["Spread the pizza sauce onto the dough.",  "Sprinkle with cheeses.", "Bake for 12 to 14 minutes."], funFact: "Pizza tastes good")
            let rec2 = Recipe(id: 2, imageName: "cheesepizza", recipeName: "Cheese Pizza", cookTime: 12, calories: 300, cuisine: "Italian", dietaryPreferences: ["Vegetarian"], ingredients: ["Dough", "Cheese", "Sauce"], instructions: ["Spread the pizza sauce onto the dough.",  "Sprinkle with cheeses.", "Bake for 12 to 14 minutes."])
            let rec3 = Recipe(id: 3, imageName: "cheesepizza", recipeName: "Random food", cookTime: 12, calories: 300, cuisine: "Italian", dietaryPreferences: ["Vegetarian"], ingredients: ["Dough", "Cheese", "Sauce"], instructions: ["Spread the pizza sauce onto the dough.",  "Sprinkle with cheeses.", "Bake for 12 to 14 minutes."])
            let rec4 = Recipe(id: 4, imageName: "cheesepizza", recipeName: "Random food", cookTime: 12, calories: 300, cuisine: "Italian", dietaryPreferences: ["Vegetarian"], ingredients: ["Dough", "Cheese", "Sauce"], instructions: ["Spread the pizza sauce onto the dough.",  "Sprinkle with cheeses.", "Bake for 12 to 14 minutes."], funFact: "kjfdsahfdslk")
            let rec5 = Recipe(id: 5, imageName: "cheesepizza", recipeName: "Random food", cookTime: 12, calories: 300, cuisine: "Italian", dietaryPreferences: ["Vegetarian"], ingredients: ["Dough", "Cheese", "Sauce"], instructions: ["Spread the pizza sauce onto the dough.",  "Sprinkle with cheeses.", "Bake for 12 to 14 minutes."], funFact: "kjfdsahfdslk")
            let rec6 = Recipe(id: 6, imageName: "cheesepizza", recipeName: "Random food", cookTime: 12, calories: 300, cuisine: "Italian", dietaryPreferences: ["Vegetarian"], ingredients: ["Dough", "Cheese", "Sauce"], instructions: ["Spread the pizza sauce onto the dough.",  "Sprinkle with cheeses.", "Bake for 12 to 14 minutes."], funFact: "kjfdsahfdslk")
            let rec7 = Recipe(id: 7, imageName: "cheesepizza", recipeName: "Random food", cookTime: 12, calories: 300, cuisine: "Italian", dietaryPreferences: ["Vegetarian"], ingredients: ["Dough", "Cheese", "Sauce"], instructions: ["Spread the pizza sauce onto the dough.",  "Sprinkle with cheeses.", "Bake for 12 to 14 minutes."], funFact: "kjfdsahfdslk")
            let rec8 = Recipe(id: 8, imageName: "cheesepizza", recipeName: "Random food", cookTime: 12, calories: 300, cuisine: "Italian", dietaryPreferences: ["Vegetarian"], ingredients: ["Dough", "Cheese", "Sauce"], instructions: ["Spread the pizza sauce onto the dough.",  "Sprinkle with cheeses.", "Bake for 12 to 14 minutes."], funFact: "kjfdsahfdslk")
            MyRecipesView(recipeArray: [rec, rec2, rec3, rec4, rec5, rec6, rec7, rec8])

        }
    }
}
