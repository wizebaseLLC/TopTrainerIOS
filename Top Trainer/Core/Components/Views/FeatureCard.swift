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
    var shouldShowDisplayNameAbove = false
    var extraDetailsBackgroundColor: Color?
    var animation: Namespace.ID
    
    var body: some View {
        ZStack(alignment: .bottom) {
            imageBackground
            detailsPane
            extraDetailsBubble
        }
        .matchedGeometryEffect(id: item.id.uuidString + "Background", in: animation)
        .foregroundColor(.primary)
        .frame(width: width, height: height)
    }
    
    var extraDetailsBubble: some View {
        VStack {
            if let extraDetails = item.extraDetails {
                HStack {
                    Spacer()
                    Text(extraDetails)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .fontWeight(.heavy)
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
        ZStack {
            Button {
                onPress()
            } label:  {
                CachedAsyncImage(url: URL(string: item.imageUrl)) { image in
                    image.resizable()
                        .matchedGeometryEffect(id: item.id.uuidString + "Image", in: animation)
                } placeholder: {
                    ProgressView()
                }
                .overlay(shouldShowDisplayNameAbove ? Color.black.opacity(0.4) : nil)
                .cornerRadius(cornerRadius)
                .shadow(color: .black.opacity(0.6), radius: 16, x: 8, y: 8 )
            }
            if shouldShowDisplayNameAbove {
                Text(item.displayName)
                    .fontWeight(.heavy)
                    .lineLimit(1)
            }
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
            if let trainer = item.trainer {
                Label {
                    Text(trainer.name)
                        .fontWeight(.heavy)
                } icon: {
                    CachedAsyncImage(url: URL(string: trainer.imageUrl)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }
                }
                
            } else {
                if !shouldShowDisplayNameAbove {
                    Text(item.displayName)
                        .fontWeight(.heavy)
                }
            }
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
    @Namespace static var nameSpace
    static var previews: some View {
        ZStack {
            //  Color.white
            FeatureCard(item: WorkoutSampleData[0], onPress: {print("hi")},showOpacity: false, shouldShowDisplayNameAbove: true, extraDetailsBackgroundColor: Color("AccentColor"), animation: nameSpace)
        }
        
    }
}
