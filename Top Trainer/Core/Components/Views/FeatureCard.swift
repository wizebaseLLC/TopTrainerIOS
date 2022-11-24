//
//  FeatureCard.swift
//  Top Trainer
//
//  Created by Servon Lewis on 9/26/22.
//

import SwiftUI
import CachedAsyncImage

struct FeatureCard: View {
    let item: FeaturedCardProps
    let cornerRadius: CGFloat = 40
    let onPress: () -> Void
    var width: CGFloat = 314
    var height: CGFloat = 200
    var showOpacity: Bool = false
    var extraDetails: String?
    var extraDetailsBackgroundColor: Color?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            imageBackground
            detailsPane
            extraDetailsBubble
        }
        .foregroundColor(.primary)
        .frame(width: width, height: height)
    }
    
    var extraDetailsBubble: some View {
        VStack {
            if extraDetails != nil {
                HStack {
                    Spacer()
                    Text(extraDetails!)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .fontWeight(.heavy)
                        .font(.footnote)
                        .padding()
                        .background(Circle().fill(extraDetailsBackgroundColor ?? Color("Secondary")).blur(radius: 16))
                        .padding(4)
                        .frame(alignment: .topTrailing)
                }
                Spacer()
            }
        }
    }
    
    /// The image background
    var imageBackground: some View {
        Button { onPress() } label:  {
            CachedAsyncImage(url: URL(string: item.imageUrl)) { image in
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
        Group {
            if showOpacity {
                detailBackgroundOpacity
                    .frame(height: 50)
                    .overlay(detailOverlay)
                    .allowsHitTesting(false)
            } else {
                detailBackgroundMaterial
                    .frame(height: 50)
                    .overlay(detailOverlay)
                    .allowsHitTesting(false)
            }
        }
    }
    
    var detailBackgroundMaterial: some View {
        RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: cornerRadius)
            .fill(Material.ultraThin)
    }
    
    var detailBackgroundOpacity: some View {
        RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: cornerRadius)
            .fill(.black.opacity(0.3))
    }
    
    var detailOverlay: some View {
        HStack {
            Text(item.displayName)
                .fontWeight(.heavy)
            Spacer()
            Label {
                Text("\(item.rating.formatted(.number.precision(.fractionLength(1))))")
            } icon: {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            .font(.subheadline)
            .fontWeight(.heavy)
            
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(item: TrainerSampleData[0], onPress: {print("hi")},showOpacity: true, extraDetails: "550 \n kCals")
    }
}
