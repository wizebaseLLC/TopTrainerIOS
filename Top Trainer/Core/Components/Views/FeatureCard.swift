//
//  FeatureCard.swift
//  Top Trainer
//
//  Created by Servon Lewis on 9/26/22.
//

import SwiftUI
import CachedAsyncImage

struct FeatureCard: View {
    let trainer: Trainer
    let cornerRadius: CGFloat = 40
    let onPress: () -> Void
    
    var body: some View {
        Button {} label:  {
            ZStack(alignment: .bottom) {
                imageBackground
                detailsPane
            }
        }
        .foregroundColor(.primary)
    }
    
    /// The image background
    var imageBackground: some View {
        CachedAsyncImage(url: URL(string: trainer.imageUrl)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 314, height: 200)
        .cornerRadius(cornerRadius)
        .shadow( radius: 14 )
    }
    
    /// The Pane that specifies the name and star rating
    var detailsPane: some View {
        RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: cornerRadius)
            .fill(Material.ultraThinMaterial)
            .frame(width: 314, height: 50)
            .overlay(
                HStack {
                    Text(trainer.displayName)
                        .bold()
                    
                    Spacer()
                    
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        
                        Text("\(trainer.rating.formatted(.number.precision(.fractionLength(1))))")
                            .font(.footnote)
                    }
                    
                }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
            )
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(trainer: TrainerSampleData[3], onPress: {print("hi")})
    }
}
