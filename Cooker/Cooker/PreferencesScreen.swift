//
//  PreferencesScreen.swift
//  myCookr
//
//  Created by Atonbara Diete-Koki on 2/17/24.
//

import SwiftUI

struct Preference: View {
    var pref: String
    @Binding var selectedPreferences: [String]
    
    var isSelectablePreference: Bool {!selectedPreferences.contains(pref)}
    
    var body: some View {
        Text(pref)
            .frame(width: 150, height: 50)
            .background(isSelectablePreference ? .white : .red, in: RoundedRectangle(cornerRadius: 10))
            
            
            .shadow(color: .black.opacity(0.1), radius: 10, x:0, y:0)
            .onTapGesture{
                if selectedPreferences.contains(pref) {
                    selectedPreferences.removeAll(where: {$0 == pref})
                }
                else if isSelectablePreference {
                    selectedPreferences.append(pref)
                }
                print(selectedPreferences)
            }
    }
}

struct Cuisine: View {
    var cuisine: String
    @Binding var selectedCuisines: [String]
    
    var isSelectableCuisine: Bool {!selectedCuisines.contains(cuisine)}
    
    var body: some View {
        Text(cuisine)
            .frame(width: 150, height: 50)
            .background(isSelectableCuisine ? .white : .red, in: RoundedRectangle(cornerRadius: 10))
            .shadow(color: .black.opacity(0.1), radius: 10, x:0, y:0)
            .onTapGesture{
                if selectedCuisines.contains(cuisine) {
                    selectedCuisines.removeAll(where: {$0 == cuisine})
                }
                else if isSelectableCuisine {
                    selectedCuisines.append(cuisine)
                }
                print(selectedCuisines)
            }
    }
}


struct PreferencesScreen: View {
    @State var dietaryPreferences = ["Vegan", "Vegetarian", "Lactose-intolerant", "Gluten Free", "Kosher"]
    @State var cuisines = ["Italian", "Japanese", "Chinese", "Indian", "American", "Nigerian", "Jamaican"]
    @State private var selectedPreferences = [String]()
    @State private var selectedCuisines = [String]()
    

    var body: some View {
        
        ZStack (alignment: .bottom){
            ScrollView {
                VStack (alignment: .leading, spacing: 10){
                    
                    Text("Choose your Dietary Preferences")
                        .font(.title)
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(dietaryPreferences, id: \.self) { pref in
                            Preference(pref: pref, selectedPreferences: $selectedPreferences)
                        }
                    }
                    
                    Spacer()
                    
                    Text("Choose your Cuisine Preferences")
                        .font(.title)
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(cuisines, id: \.self) { cuisine in
                            Cuisine(cuisine: cuisine, selectedCuisines: $selectedCuisines)
                        }
                    }
                    Spacer()
                }
                .padding()
            }
            
        }
        
    }
}

#Preview {
    PreferencesScreen()
}

