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
    
    @State private var translation: CGSize = .zero
    @State private var option: Option? = nil
    
    var body: some View {
        
        // geometry reader to size our content within the frame of its parent view.
        GeometryReader { geometry in
            
            VStack(alignment: .leading) {
                
                if let option {
                    Text(option.rawValue)
                }
                
                // MARK: Image of the card
                Image("cheesepizza")
                    .resizable()
                    .scaledToFill()
                // set 75% of parent's height
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                    .clipped()
                
                // MARK: Info of the card
                HStack {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("food")
                            .font(.title)
                            .bold()
                        Text("recipet")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "info.circle")
                        .foregroundStyle(.blue)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 5)
            
            .animation(.interactiveSpring, value: translation.width)
            
            
            // make the card horizontally
            .offset(x: translation.width, y: 0)
            
            // make the rotation
            .rotationEffect(.degrees(Double(translation.width / geometry.size.width) * 25), anchor: .bottomLeading)
            
            // add the drag gesture
            .gesture(
                DragGesture()
                    .onChanged { value in
                        
                        // swipe to left
                        if (abs(self.translation.width) < 90) {
                            self.option = .trash
                        }
                        
                        if (self.translation.width > 180) {
                            self.option = .gallery
                        }
                        
                        self.translation = value.translation
                    }
                    .onEnded { value in
                        self.translation = .zero
                        option = nil
                    }
                
            )
        }
    }
}

#Preview {
    CardView()
        .frame(width: 300, height: 300)
        .padding()
}
