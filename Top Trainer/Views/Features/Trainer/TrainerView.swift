//
//  TrainerView.swift
//  Top Trainer
//
//  Created by Servon Lewis on 12/11/22.
//

import SwiftUI
import CachedAsyncImage

struct TrainerView: View {
    let imageUrl: String
    let name: String
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ZStack(alignment: .top)   {
                    Rectangle()
                        .fill(.cyan)
                        .cornerRadius(80, corners: [.bottomRight])
                        .shadow(color: .cyan, radius: 16)
                        .frame(height: 557)
                        .overlay(
                            Text("Hello")
                                .foregroundColor(.white)
                                .font(.headline)
                                .frame(height: 557)
                                .offset(x: 0, y: (308 + 448) - 557)
                        )
                    Rectangle()
                        .fill(.indigo)
                        .cornerRadius(80, corners: [.bottomRight])
                        .shadow(color: .indigo, radius: 16)
                        .frame(height: 448)
                        .overlay(
                            Text("Hello")
                                .foregroundColor(.white)
                                .font(.headline)
                                .offset(x: 0, y: 557 - 448)
                                .frame(height: 448)
                        )
                    
                    CachedAsyncImage(url: URL(string: imageUrl)) { image in
                        image.resizable()
                        //     .aspectRatio(contentMode: .fill)
                            .frame(height: 308)
                    } placeholder: {
                        ProgressView()
                    }
                    .cornerRadius(80, corners: [.bottomRight])
                    .shadow(color: Color("Background"), radius: 16)
                    
                    
                }
            }
        }
        .gradientBackground()
        .edgesIgnoringSafeArea(.top)
    }
}

struct TrainerView_Previews: PreviewProvider {
    static var previews: some View {
        TrainerView(imageUrl: TrainerSampleData[0].imageUrl, name: TrainerSampleData[0].displayName)
    }
}

