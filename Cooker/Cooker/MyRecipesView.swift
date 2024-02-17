//
//  MyRecipesView.swift
//  Cooker
//
//  Created by Aarav Nair on 2/17/24.
//

import Foundation
import SwiftUI

struct MyRecipesView: View {
    @State private var showingSheet = false
    var recipeArray: [Recipe]
    
    var body: some View {
        VStack {
            Text("My Recipes")
                .font(.title)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 20) {
                ForEach(recipeArray, id: \.self) { recipe in
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Image(recipe.imageName)
                    }
                    .sheet(isPresented: $showingSheet) {
                        DetailedRecipeView(recipe: recipe)
                    }
                }
            }
            .padding()
        }
    }
}
    
#Preview {
    let rec = Recipe(id: 1, imageName: "cheesepizza", recipeName: "Cheese Pizza", cookTime: 12, cuisine: "Italian", dietaryPreferences: ["Vegetarian"], ingredients: ["Dough", "Cheese", "Sauce"], instructions: ["Spread the pizza sauce onto the dough.",  "Sprinkle with cheeses.", "Bake for 12 to 14 minutes."])
    return MyRecipesView(recipeArray: [rec])
}
