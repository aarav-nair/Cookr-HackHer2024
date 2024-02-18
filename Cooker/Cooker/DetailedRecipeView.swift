//
//  DetailedRecipeView.swift
//  Cooker
//
//  Created by Aarav Nair on 2/17/24.
//

import Foundation
import SwiftUI

struct DetailedRecipeView: View {
    @Environment(CookViewModel.self) private var cookViewModel
    @Environment(\.dismiss) var dismiss
    @State var doesNothing = false
    var recipe: Recipe
    
    var body: some View {
        ZStack {
            Color.defaultBackgroundColor
            ScrollView {
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
                        cookViewModel.selectedRecipe.removeAll(where: { 
                            let x = $0 == recipe
                             return x} )
                        dismiss()
                    } label: {
                        Image(systemName: "trash")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(Color.red)
                            .padding()
                    }
                }
                Text(recipe.recipeName)
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.black)
                Image(recipe.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .padding()
                
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
                    Spacer()
                }
                
                Text("Ingredients:")
                    .font(.title2)
                    .foregroundStyle(Color.black)
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    HStack {
                        Text("• " + ingredient)
                            .font(.body)
                            .padding(.horizontal)
                            .foregroundStyle(Color.black)
                        Spacer()
                    }
                }
                
                Text("Instructions:")
                    .font(.title2)
                    .foregroundStyle(Color.black)
                ForEach(recipe.instructions.indices) { i in
                    HStack {
                        Text("\(i+1). \(recipe.instructions[i])")
                            .padding(.horizontal)
                            .foregroundStyle(Color.black)
                        Spacer()
                    }
                }
            }
        }
    }
}


#Preview {
    let rec = Recipe(id: 1, imageName: "cheesepizza", recipeName: "Cheese Pizza", cookTime: 12, cuisine: "Italian", dietaryPreferences: ["Vegetarian"], ingredients: ["Dough", "Cheese", "Sauce"], instructions: ["Spread the pizza sauce onto the dough.",  "Sprinkle with cheeses.", "Bake for 12 to 14 minutes."])
    return DetailedRecipeView(recipe: rec)
        .environment(CookViewModel())
}
    
