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
        .padding(.bottom)
        .padding(.bottom)
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
        .shadow(color: .gray.opacity(0.2), radius: 16, x: 8, y: 8 )
    }
    
    /// The Pane that specifies the name and star rating
    var detailsPane: some View {
        RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: cornerRadius)
            .fill(Material.thinMaterial)
            .frame(width: 314, height: 50)
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
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(trainer: TrainerSampleData[3], onPress: {print("hi")})
    }
}
