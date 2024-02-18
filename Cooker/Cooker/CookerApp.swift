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
            ContentView()
                .environment(cookViewModel)
        }
    }
}
