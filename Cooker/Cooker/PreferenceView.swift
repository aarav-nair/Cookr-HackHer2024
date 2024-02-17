//
//  PreferencesView.swift
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
            .font(.system(size: 14, weight: .medium, design: .rounded))
            .frame(width: 150, height: 50)
            .background(isSelectablePreference ? Color(red: 232/256, green: 222/256, blue: 248/256) : Color(red: 103/256, green: 80/256, blue: 164/256), in: RoundedRectangle(cornerRadius: 99.97))
            .foregroundColor(isSelectablePreference ? .black : .white)
            .shadow(color: .black.opacity(0.1), radius: 99.97, x:0, y:0)
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
            .font(.system(size: 14, weight: .medium, design: .rounded))
            .frame(width: 150, height: 50)
            .background(isSelectableCuisine ? Color(red: 232/256, green: 222/256, blue: 248/256) : Color(red: 103/256, green: 80/256, blue: 164/256), in: RoundedRectangle(cornerRadius: 99.97))
            .shadow(color: .black.opacity(0.1), radius: 99.97, x:0, y:0)
            .foregroundColor(isSelectableCuisine ? .black : .white)
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
            Color(red: 0.87, green: 0.8, blue: 0.87)
                .ignoresSafeArea()
            ScrollView {
                VStack (alignment: .center, spacing: 10){
                    Spacer()
                    
                    Text("Welcome back! Chef...")
                        .font(.system(size: 30, weight: .light, design: .serif))
                    HStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 75, height: 75)
                            .background(
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 75)
                                
                            )
                        
                        Text("Kat")
                            .font(.system(size: 30, weight: .medium, design: .serif))
                            .padding()
                    }
                    .padding()
                    VStack {
                        
                        Text("Choose your Dietary Preferences")
                        
                            .font(.system(size: 20 ,weight: .medium ,design: .serif))
                        LazyVGrid(columns: [GridItem(), GridItem()]) {
                            ForEach(dietaryPreferences, id: \.self) { pref in
                                Preference(pref: pref, selectedPreferences: $selectedPreferences)
                            }
                        }
                    }
                    .padding()
                    .frame(alignment: .topTrailing)
                    .background(Color(red: 255/256, green: 245/256, blue: 253/256))
                    .cornerRadius(35.26923)
                    
                    
                    
                    Spacer()
                    VStack {
                        Text("Choose your Cuisine Preferences")
                            .font(.system(size: 20 ,weight: .medium ,design: .serif))
                        LazyVGrid(columns: [GridItem(), GridItem()]) {
                            ForEach(cuisines, id: \.self) { cuisine in
                                Cuisine(cuisine: cuisine, selectedCuisines: $selectedCuisines)
                            }
                        }
                    }
                    .padding()
                    .frame(alignment: .topTrailing)
                    .background(Color(red: 255/256, green: 245/256, blue: 253/256))
                    .cornerRadius(35.26923)
                    Spacer()
                    
                    Button {
                        
                    } label : {
                        Text("Done")
                            .font(.system(size: 15, weight: .semibold, design: .default))
                            .foregroundStyle(.black)
                    }
                    .padding(.horizontal, 41.97567)
                    .padding(.vertical, 17.48986)
                    .background(Color(red: 0.82, green: 0.74, blue: 1))
                    .cornerRadius(174.89862)
                }
                .padding()
            }
            
            
        }
        
        
    }
}

#Preview {
    PreferencesScreen()
}
