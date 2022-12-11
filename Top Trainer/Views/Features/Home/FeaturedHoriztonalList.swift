//
//  FeaturedTrainerList.swift
//  Top Trainer
//
//  Created by Servon Lewis on 9/27/22.
//

import SwiftUI

struct FeaturedHorizontalList: View {
    let listData: [FeaturedCardProps]
    var showOpacity: Bool = false
    var extraDetailsBackgroundColor = Color("Secondary")
    var shouldShowDisplayNameAbove = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(listData) { data in
                    FeatureCard(item: data, onPress: { print("hi") },showOpacity: showOpacity, shouldShowDisplayNameAbove: shouldShowDisplayNameAbove, extraDetailsBackgroundColor: extraDetailsBackgroundColor)
                        .padding(.trailing)
                        .padding(.top)
                        .padding(.top)
                        .padding(.bottom)
                        .padding(.bottom)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct FeaturedHorizontalList_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedHorizontalList(listData: MealSampleData,showOpacity: true)
    }
}
