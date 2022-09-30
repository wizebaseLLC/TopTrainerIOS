//
//  FeaturedTrainerList.swift
//  Top Trainer
//
//  Created by Servon Lewis on 9/27/22.
//

import SwiftUI

struct FeaturedTrainerList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(TrainerSampleData) { trainer in
                    FeatureCard(trainer: trainer, onPress: {print("hi")})
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct FeaturedTrainerList_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedTrainerList()
    }
}
