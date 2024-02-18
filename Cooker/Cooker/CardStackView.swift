//
//  CardStackView.swift
//  Cooker
//
//  Created by Yongye Tan on 2/17/24.
//

import SwiftUI

struct CardStackView: View {
    
    @Environment(CookViewModel.self) private var cookViewModel
    
    @State private var recipes: [Recipe] = []
    
    @State private var allCuisinesIncluded: Bool = true
    @State private var allPrefsIncluded: Bool = true
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Color.defaultBackgroundColor.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 30) {
                    
                    Spacer()
                    
                    Spacer()
                    
                    GeometryReader { geometry in
                        
                        VStack {
                            
                            ZStack {
                                
                                ForEach(recipes, id: \.self) { recipe in
                                    
                                    
                                    CardView(handler: removeRecipe, recipe: recipe)
                                        .frame(width: getCardWidth(geometry, id: recipe.id), height: 400)
                                        .offset(x: 0, y: getCardOffset(geometry, id: recipe.id))
                                    
                                }
                                
                            }
                            
                        }
                    }
                    
                }
            }
            .navigationTitle("Choose recipes")
        }
//        .padding()
        .background(Color.defaultBackgroundColor)
        
        .onAppear(perform: {
            
            recipes = cookViewModel.selectedPreferences.count > 0 ?
            cookViewModel.allRecipes.filter { recipe in
                recipe.dietaryPreferences.contains { dietaryPreference in
                    cookViewModel.selectedPreferences.contains(dietaryPreference)
                }
            }
            : cookViewModel.allRecipes
        })
    }
    
    private func removeRecipe(_ id: Int) {
        recipes = recipes.filter { $0.id != id }
        cookViewModel.selectedRecipe = cookViewModel.selectedRecipe.filter { $0.id != id }
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
        .environment(CookViewModel())
}
