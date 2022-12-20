//
//  MealTimeCard.swift
//  Top Trainer
//
//  Created by Servon Lewis on 11/27/22.
//

import SwiftUI
import CachedAsyncImage

struct MealTimeCard: View {
    let imageUrl: String
    let title: String
    let width: CGFloat = 300
    let height: CGFloat = 170
    let onPress: () -> Void
    
    var body: some View {
        Button { onPress() } label:  {
            ZStack(alignment: .bottom) {
                imageBackground
                
                    .frame(width: width, height: height)
                    .cornerRadius(60)
                    .overlay(
                        RoundedRectangle(cornerRadius: 60.0)
                            .stroke(lineWidth: 6)
                    )
            }
            .overlay(alignment: .bottom) {
                detailPane
            }
        }
        .buttonStyle(.plain)
    }
    
    var detailPane: some View {
        Text(title)
            .foregroundStyle(.black)
            .font(.headline)
            .fontWeight(.heavy)
            .padding()
            .frame(width: 200, height: 50)
            .background(Capsule().fill(.white))
            .offset(x: 0, y: 25)
        
    }
    
    /// The image background
    var imageBackground: some View {
        CachedAsyncImage(url: URL(string: imageUrl)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        // .cornerRadius(30)
        .shadow(color: .black.opacity(0.6), radius: 16, x: 8, y: 8 )
    }
}

struct MealTimeCard_Previews: PreviewProvider {
    static var previews: some View {
        MealTimeCard(imageUrl: "https://insanelygoodrecipes.com/wp-content/uploads/2020/12/Chocolate-Chip-Pancakes.png", title: "Breakfast", onPress: {})
    }
}
