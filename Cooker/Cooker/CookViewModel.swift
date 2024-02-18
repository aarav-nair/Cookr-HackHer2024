//
//  CookViewModel.swift
//  Cooker
//
//  Created by Yongye Tan on 2/17/24.
//

import Foundation

@Observable class CookViewModel {
    
    var selectedPreferences: [String] = []
    var selectedCuisines: [String] = []
    
    var selectedRecipe: [Recipe] = []
    
    var allRecipes: [Recipe] = []
    
    init() {
        allRecipes = [
            Recipe(id: 1, imageName: "cheesepizza", recipeName: "1", cookTime: 30, calories: 212, cuisine: "USA", dietaryPreferences: ["no milk"], ingredients: ["apple"], instructions: ["cook", "clean", "eat"]),
            Recipe(id: 2, imageName: "food", recipeName: "1", cookTime: 30, calories: 321, cuisine: "USA", dietaryPreferences: ["no milk"], ingredients: ["apple"], instructions: ["cook", "clean", "eat"], funFact: "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.")]
    }
}
