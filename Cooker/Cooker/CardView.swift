//
//  CardView.swift
//  Cooker
//
//  Created by Yongye Tan on 2/17/24.
//

import SwiftUI

struct CardView: View {
    
    @State private var translation: CGSize = .zero
    
    var body: some View {
        
        // geometry reader to size our content within the frame of its parent view.
        GeometryReader { geometry in
            
            VStack(alignment: .leading) {
                
                // MARK: Image of the card
                Image("food")
                    .resizable()
                    .scaledToFill()
                // set 75% of parent's height
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                    .clipped()
                
                // MARK: Info the card
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
            .cornerRadius(20)
            .shadow(radius: 10)
            
            .animation(.interactiveSpring, value: translation.width)
            
            
            // make the card horizontally
            .offset(x: translation.width, y: 0)
            
            // make the rotation
            .rotationEffect(.degrees(Double(translation.width / geometry.size.width) * 25), anchor: .bottomLeading)
            
            // add the drag gesture
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.translation = value.translation
                    }
                    .onEnded { value in
                        self.translation = .zero
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
