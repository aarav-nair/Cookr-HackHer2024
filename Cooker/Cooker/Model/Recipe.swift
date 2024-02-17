//
//  Recipe.swift
//  Cooker
//
//  Created by Yongye Tan on 2/17/24.
//

import Foundation

struct Recipe: Hashable {
    
    var imageName: String
    
    var recipeName: String
    
    var cookTime: Int
    
    var cuisine: String
    
    var dietaryPreferences: [String]
    
    var ingredients: [String]
    
    var instructions: [String]
    
    var funFact: String?
    
}
