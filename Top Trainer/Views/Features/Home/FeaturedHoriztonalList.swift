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
    @State var isDisabled = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(listData) { data in
                    FeatureCard(item: data, onPress: {
                        withAnimation(.easeInOut) {
                            selectedItem = data
                        }
                    },showOpacity: showOpacity, shouldShowDisplayNameAbove: shouldShowDisplayNameAbove, extraDetailsBackgroundColor: extraDetailsBackgroundColor, animation: animation)
                    .disabled(isDisabled)
                        .padding(.trailing)
                        .padding(.top)
                        .padding(.top)
                        .padding(.bottom)
                        .padding(.bottom)
                }
            }
            .padding(.horizontal)
        }
        .onChange(of: selectedItem?.id) { newValue in
            if newValue != nil {
                    isDisabled = true
                
            } else {
                Task {
                    let duration = UInt64(0.5 * 1_000_000_000)
                    try await Task.sleep(nanoseconds: duration)
                    await MainActor.run {
                        withAnimation {
                            isDisabled = false
                        }
                    }
                }
            }
        }
    }
}

struct FeaturedHorizontalList_Previews: PreviewProvider {
    @Namespace static var nameSpace
    static var previews: some View {
        FeaturedHorizontalList(listData: MealSampleData,showOpacity: true, selectedItem: .constant(nil), animation: nameSpace)
    }
}
