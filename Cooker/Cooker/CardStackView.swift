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
                    
                    GeometryReader { geometry in
                        
                        VStack {
                            
                            ZStack {
                                
                                ForEach(recipes, id: \.self) { recipe in
                                    
//                                    for element in cookViewModel.selectedCuisines {
//                                        if !recipe.cuisines.contains(element) {
//                                            allCuisinesIncluded = false
//                                        }
//                                    }
                                    
                                    CardView(handler: removeReceipt, recipe: recipe)
                                        .frame(width: getCardWidth(geometry, id: recipe.id), height: 400)
                                        .offset(x: 0, y: getCardOffset(geometry, id: recipe.id))
                                    
                                }
                                
                            }
                            
                        }
                    }
                    
                }
            }
            .navigationTitle("Choose your recipes")
        }
        .padding()
        .background(Color.defaultBackgroundColor)
        .onAppear {
            print("selected preference ")
            print(cookViewModel.selectedPreferences)
            
            print("selected cusines ")
            print(cookViewModel.selectedCuisines)
        }
        
        .onAppear(perform: {
            
            recipes = cookViewModel.allRecipes.filter { recipe in
                recipe.dietaryPreferences.contains { dietaryPreference in
                    cookViewModel.selectedPreferences.contains(dietaryPreference)
//                    
//                    (recipe.cuisine.contains { c in
//                        cookViewModel.contains(c))
                    
                }
            }
        })
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
        .environment(CookViewModel())
}
