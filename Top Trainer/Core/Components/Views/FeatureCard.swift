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
        ZStack(alignment: .bottom) {
            imageBackground
            detailsPane
        }
        .foregroundColor(.primary)
        .frame(width: 314, height: 200)
    }
    
    /// The image background
    var imageBackground: some View {
        Button { onPress() } label:  {
            CachedAsyncImage(url: URL(string: trainer.imageUrl)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .cornerRadius(cornerRadius)
            .shadow(color: .black.opacity(0.6), radius: 16, x: 8, y: 8 )
        }
    }
    
    /// The Pane that specifies the name and star rating
    var detailsPane: some View {
        RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: cornerRadius)
            .fill(Material.thinMaterial)
            .frame(height: 50)
            .overlay(
                HStack {
                    Text(trainer.displayName)
                        .bold()
                    
                    Spacer()
                    
                    
                    Label {
                        Text("\(trainer.rating.formatted(.number.precision(.fractionLength(1))))")
                    } icon: {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    .font(.footnote)
                    
                    
                }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
            )
            .allowsHitTesting(false)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(trainer: TrainerSampleData[0], onPress: {print("hi")})
    }
}
