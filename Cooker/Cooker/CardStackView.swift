//
//  CardStackView.swift
//  Cooker
//
//  Created by Yongye Tan on 2/17/24.
//

import SwiftUI

struct CardStackView: View {
    
    @State private var recipes: [Recipe] = [
        Recipe(id: 1, imageName: "cheesepizza", recipeName: "1", cookTime: 30, calories: 300, cuisine: "USA", dietaryPreferences: ["no milk"], ingredients: ["apple"], instructions: ["cook", "clean", "eat"]),
        Recipe(id: 2, imageName: "food", recipeName: "1", cookTime: 30, calories: 250, cuisine: "USA", dietaryPreferences: ["no milk"], ingredients: ["apple"], instructions: ["cook", "clean", "eat"], funFact: "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.")
    ]
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                VStack(spacing: 30) {
                    
                    Spacer()
                    
                    GeometryReader { geometry in
                        
                        VStack {
                            
                            ZStack {
                                
                                ForEach(recipes, id: \.self) { recipe in
                                    CardView(handler: removeReceipt, recipe: recipe)
                                        .frame(width: getCardWidth(geometry, id: recipe.id), height: 400)
                                        .offset(x: 0, y: getCardOffset(geometry, id: recipe.id))
                                    
                                }
                                
                            }
                            
                        }
                    }
                    
                }
            }
            .navigationTitle("Choose your receipt")
            .background(Color.defaultBackgroundColor)
        }
        .padding()
        .background(Color.defaultBackgroundColor)
    }
    
    private func removeReceipt(_ id: Int) {
        recipes = recipes.filter { $0.id != id }
    }
    
    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(recipes.count - 1 - id) * 10
        return geometry.size.width - offset
    }
    
    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        return  CGFloat(recipes.count - 1 - id) * 15
    }
    
}


#Preview {
    CardStackView()
}
