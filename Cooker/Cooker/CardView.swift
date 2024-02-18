//
//  CardView.swift
//  Cooker
//
//  Created by Yongye Tan on 2/17/24.
//

import SwiftUI

enum Option: String {
    case trash
    case gallery
}

struct CardView: View {
    
    @Environment(CookViewModel.self) var cookViewModel
    
    @State private var translation: CGSize = .zero
    @State private var option: Option? = nil
    
    let handler: (_ id: Int) -> Void
    
    let recipe: Recipe
    
    var body: some View {
        
        // geometry reader to size our content within the frame of its parent view.
        GeometryReader { geometry in
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text(recipe.recipeName)
                    .font(.title)
                    .bold()
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                
                // MARK: Image of the card
                Image(recipe.imageName)
                    .resizable()
                    .scaledToFill()
                // set 75% of parent's height
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                    .clipped()
                    .mask(
                        RoundedRectangle(cornerRadius: 60)
                            .padding(.horizontal, 20)
                    )
                
                Divider()
                
                // MARK: Info of the card
                VStack(spacing: 10) {
                    HStack {
                        
                        Text(recipe.description)
                            .multilineTextAlignment(.leading)
                            .lineLimit(4)
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                            .frame(height: 80)
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    HStack {
                        
                        Spacer()
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        Text("Rate")
                        
                        Spacer()
                        
                        Spacer()
                        Image(systemName: "clock")
                            .foregroundStyle(.blue)
                        Text("cook time")
                        Spacer()
                        
                        Spacer()
                        Image(systemName: "flame")
                            .foregroundStyle(.red)
                        Text("calories")
                        Spacer()
                    }
                }

            }
            .padding(.bottom)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(radius: 5)
            
            .animation(.interactiveSpring, value: translation.width)
            
            
            // make the card move horizontally
            .offset(x: translation.width, y: 0)
            
            // make the rotation
            .rotationEffect(.degrees(Double(translation.width / geometry.size.width) * 25), anchor: .bottomLeading)
            
            // add the drag gesture
            .gesture(
                DragGesture()
                    .onChanged { value in
                        
                        // swipe to right
                        if (self.translation.width > 180) {
                            self.option = .gallery
                            handler(recipe.id)
                            cookViewModel.selectedRecipe.append(recipe)
                        }
                        
                        // swipe to left
                        if (self.translation.width < -180) {
                            self.option = .trash
                            handler(recipe.id)
                        }
                        
                        self.translation = value.translation
                    }
                    .onEnded { value in
                        self.translation = .zero
                        option = nil
                    }
                
            )
        }
        .frame(width: 325, height: 350)
    }
    
}

#Preview {
    
    let recipe = Recipe(id: 1, imageName: "cheesepizza", recipeName: "Dialog Title", cookTime: 30, cuisine: "USA", dietaryPreferences: ["no milk"], ingredients: ["apple"], instructions: ["cook", "clean", "eat"], funFact: "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. ", description: "")
    
    return CardView(handler: { _ in
        
    }, recipe: recipe)
        .frame(width: 300, height: 300)
        .padding()
}
