//
//  Home.swift
//  Top Trainer
//
//  Created by Servon Lewis on 9/26/22.
//

import SwiftUI

struct Home: View {
    let shouldScheduleCountScroll = workoutListItemSampleData.count < 5
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack {
                        FeatureHeader(title: "Featured Top Trainers", shouldShowSeeAll: true, onSeeAllPress: {print("hi")})
                        FeaturedHorizontalList(listData: TrainerSampleData)
                        FeatureHeader(title: "Today's Activity", shouldShowSeeAll: false, onSeeAllPress: {print("hi")})
                            .padding(.bottom)
                        TodaysActivityGrid()
                            .padding(.bottom)
                        FeatureHeader(title: "Recipes For You", shouldShowSeeAll: true, onSeeAllPress: {print("hi")})
                        FeaturedHorizontalList(listData: MealSampleData, showOpacity: true)
                            .padding(.bottom)
                        FeatureHeader(title: "Today's Workout Schedule", shouldShowSeeAll: true, onSeeAllPress: {print("hi")})
                        if shouldScheduleCountScroll {
                            ScrollView {
                                ScrollView { TodaysScheduleList().frame(height: 71 * CGFloat(workoutListItemSampleData.count)) }
                            }
                        }
                        else {
                            TodaysScheduleList().frame(height: 310)
                        }
                    }
                    .padding(.top)
                }
            }
            .scrollIndicators(.hidden)
            .frame(maxWidth: .infinity, alignment: .leading)
            .gradientBackground()
            .navigationTitle("Home")
            
        }
    }
    
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
