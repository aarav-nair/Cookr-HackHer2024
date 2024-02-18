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
                .font(Font.custom("MyFont", size: 50, relativeTo: .title))
            LazyVGrid(columns: [GridItem(), GridItem()], spacing: 20) {
                ForEach(recipeArray, id: \.self) { recipe in
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Image(recipe.imageName)
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .padding()
                    }
                    .sheet(isPresented: $showingSheet) {
                        DetailedRecipeView(recipe: recipe)
                    }
                }
            }
            Spacer()
        }
    }
}
    
#Preview {
    let rec = Recipe(id: 1, imageName: "cheesepizza", recipeName: "Cheese Pizza", cookTime: 12, cuisine: "Italian", dietaryPreferences: ["Vegetarian"], ingredients: ["Dough", "Cheese", "Sauce"], instructions: ["Spread the pizza sauce onto the dough.",  "Sprinkle with cheeses.", "Bake for 12 to 14 minutes."], description: "")
    return MyRecipesView(recipeArray: [rec, rec, rec, rec, rec, rec, rec])
}
