//
//  Home.swift
//  Top Trainer
//
//  Created by Servon Lewis on 9/26/22.
//

import SwiftUI

struct Home: View {
    let shouldScheduleCountScroll = workoutListItemSampleData.count
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack {
                        FeatureHeader(title: "Featured Top Trainers", shouldShowSeeAll: true, onSeeAllPress: {print("hi")})
                        FeaturedHorizontalList(listData: TrainerSampleData)
                        FeatureHeader(title: "Today's Activity", shouldShowSeeAll: false)
                            .padding(.bottom)
                        TodaysActivityGrid()
                            .padding(.bottom)
                        FeatureHeader(title: "Plan For Success", shouldShowSeeAll: false)
                        MealTimeHorizontalList()
                            .padding(.bottom)
                        FeatureHeader(title: "Recipes For You", shouldShowSeeAll: true, onSeeAllPress: {print("hi")})
                        FeaturedHorizontalList(listData: MealSampleData, showOpacity: true)
                            .padding(.bottom)
                        
                        if shouldScheduleCountScroll > 0 {
                            FeatureHeader(title: "Today's Workout Schedule", shouldShowSeeAll: true, onSeeAllPress: {print("hi")}, text: "Calendar")
                            TodaysScheduleList().frame(height: 310)
                                .padding(.bottom)
                        }
                        
        
                    }
                    .padding(.top)
                    .padding(.bottom)
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
