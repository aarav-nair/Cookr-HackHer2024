//
//  GetDifficulty.swift
//  Cooker
//
//  Created by Aarav Nair on 2/18/24.
//

import Foundation
import SwiftUI

func GetDifficulty(rec: Recipe) -> String {
    let num = rec.cookTime + rec.ingredients.count
    switch num {
    case 0...20:
        return "Very Easy"
    case 20...30:
        return "Easy"
    case 30...40:
        return "Medium"
    case 40...50:
        return "Hard"
    default:
        "return Hard"
    }
    return ""
}
