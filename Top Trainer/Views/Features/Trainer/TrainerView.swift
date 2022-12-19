//
//  TrainerView.swift
//  Top Trainer
//
//  Created by Servon Lewis on 12/11/22.
//

import SwiftUI
import CachedAsyncImage

struct TrainerView: View {
    let id: String
    let imageUrl: String
    let name: String
    var animation: Namespace.ID
    @Binding var selectedItem: FeaturedCardProps?
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                ScrollView(showsIndicators: false) {
                    VStack {
                        TrainerHeaderView(id: id, imageUrl: imageUrl, name: name, animation: animation )
                    }
                    
                }
                .background(.black)
                .edgesIgnoringSafeArea(.top)
            }
        }
        .withDimissButton {
            withAnimation(.closeCard) {
                selectedItem = nil
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .toolbar(.hidden, for: .navigationBar)
        .zIndex(2)
    }
}

struct TrainerView_Previews: PreviewProvider {
    @Namespace static var nameSpace
    static var previews: some View {
        TrainerView(id: UUID().uuidString ,imageUrl: TrainerSampleData[0].imageUrl, name: TrainerSampleData[0].displayName, animation: nameSpace, selectedItem: .constant(nil))
    }
}

