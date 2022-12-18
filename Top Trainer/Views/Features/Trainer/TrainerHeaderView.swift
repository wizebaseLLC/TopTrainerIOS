//
//  TrainerHeaderView.swift
//  Top Trainer
//
//  Created by Servon Lewis on 12/11/22.
//

import SwiftUI
import CachedAsyncImage

struct TrainerHeaderView: View {
    let id: String
    let imageUrl: String
    let name: String
    let totalHeight: CGFloat = 557
    let nameBoxHeight: CGFloat = 448
    let imageHeight: CGFloat = 308
    var animation: Namespace.ID
    @State var backgroundOpacity: CGFloat = .zero
    @State var textOpacity: CGFloat = .zero

    
    var body: some View {
        ZStack(alignment: .top)   {
            valuesPane.opacity(backgroundOpacity)
            detailPane.opacity(backgroundOpacity)
            imageHeader
                .matchedGeometryEffect(id: id + "Background", in: animation)
        }
        .onAppear {
            withAnimation(.easeIn.delay(0.2)) {
                backgroundOpacity = 1
            }
            withAnimation(.easeIn.delay(0.4)) {
                textOpacity = 1
            }
        }
    }
    
    var valuesPane: some View {
        Rectangle()
            .fill(Color("Tertiary"))
            .cornerRadius(80, corners: [.bottomRight])
            .shadow(color: .cyan.opacity(0.5), radius: 16)
            .frame(height: totalHeight)
            .overlay(
                Text("Hello")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: totalHeight)
                    .offset(x: 0, y: (imageHeight + nameBoxHeight) - totalHeight)
                    .opacity(textOpacity)
            )
        
    }
    
    var detailPane: some View {
        Rectangle()
            .fill(.indigo)
            .cornerRadius(80, corners: [.bottomRight])
            .shadow(color: .indigo, radius: 16)
            .frame(height: nameBoxHeight)
            .overlay(
                VStack {
                    Text(name)
                        .font(.title2.weight(.heavy))
                        .offset(x: 0, y: totalHeight - nameBoxHeight)
                        .opacity(textOpacity)
                    
                }
            )
    }
    
    var imageHeader: some View {
        CachedAsyncImage(url: URL(string: imageUrl)) { image in
            image.resizable()
                .matchedGeometryEffect(id: id + "Image", in: animation)
                .frame(height: imageHeight)
        } placeholder: {
            ProgressView()
        }
        .cornerRadius(80, corners: [.bottomRight])
        .shadow(color: Color("Background").opacity(0.8), radius: 16)
        
    }
}

struct TrainerHeaderView_Previews: PreviewProvider {
    @Namespace static var nameSpace
    static var previews: some View {
        VStack {
            TrainerHeaderView(id: UUID().uuidString, imageUrl: TrainerSampleData[1].imageUrl, name: TrainerSampleData[0].displayName, animation: nameSpace)
            Spacer()
        }
        .ignoresSafeArea(edges: .top)
    }
}
