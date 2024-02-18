//
//  ContentView.swift
//  Cooker
//
//  Created by Aarav Nair on 2/17/24.
//

import SwiftUI

enum Selection {
    case preference
    case card
    case cookbook
}

struct ContentView: View {
    
    @State private var selection: Selection = .preference
    
    var body: some View {
        TabView(selection: $selection) {
            PreferencesScreen(tabSelection: $selection)
                .tag(Selection.preference)
                .tabItem {
                    Label("Preference", systemImage: "person.circle.fill")
                }

            CardStackView()
                .tag(Selection.card)
                .tabItem {
                    Label("Swipe", systemImage: "menucard")
                }
            MyRecipesView()
                .tag(Selection.cookbook)
                .tabItem {
                    Label("Cookbook", systemImage: selection == .cookbook ? "book.fill": "book.closed")
                }

        }
    }
}

#Preview {
    ContentView()
}
