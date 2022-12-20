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
    @Binding var selectedItem: FeaturedCardProps?
    var animation: Namespace.ID
    var width: CGFloat = 314
    var height: CGFloat = 200
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(listData) { data in
                    if data.id != selectedItem?.id{
                        FeatureCard(item: data, onPress: {
                                withAnimation(.openCard) {
                                    selectedItem = data
                                }
                        },showOpacity: showOpacity, shouldShowDisplayNameAbove: shouldShowDisplayNameAbove, extraDetailsBackgroundColor: extraDetailsBackgroundColor, animation: animation)
                        .padding(.trailing)
                        .padding(.top)
                        .padding(.top)
                        .padding(.bottom)
                        .padding(.bottom)
                    } else {
                        Color.clear
                            .frame(width: width, height: height)
                            .padding(.trailing)
                            .padding(.top)
                            .padding(.top)
                            .padding(.bottom)
                            .padding(.bottom)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct FeaturedHorizontalList_Previews: PreviewProvider {
    @Namespace static var nameSpace
    static var previews: some View {
        FeaturedHorizontalList(listData: MealSampleData,showOpacity: true, selectedItem: .constant(nil), animation: nameSpace)
    }
}
