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
            PreferencesScreen()
                .tag(Selection.preference)
                .tabItem {
                    Label("Preference", systemImage: "tray.and.arrow.down.fill")
                }

            CardStackView()
                .tag(Selection.card)
                .tabItem {
                    Label("Card Stack", systemImage: "menucard")
                }
            Text("Cookbook")
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
