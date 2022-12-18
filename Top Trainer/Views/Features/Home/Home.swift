//
//  Home.swift
//  Top Trainer
//
//  Created by Servon Lewis on 9/26/22.
//

import SwiftUI

struct Home: View {
    let shouldScheduleCountScroll = workoutListItemSampleData.count
    @State private var selectedItem: FeaturedCardProps?
    @Namespace private var animation
    
    var body: some View {
            NavigationStack {
                ZStack {
                    ScrollView {
                        VStack  {
                            Group {
                                FeatureHeader(title: "Featured Top Trainers", shouldShowSeeAll: true, onSeeAllPress: {print("hi")})
                                FeaturedHorizontalList(listData: TrainerSampleData, selectedItem: $selectedItem, animation: animation)
                                
                            }
                            .padding(.top)
                            Group {
                                FeatureHeader(title: "Today's Activity", shouldShowSeeAll: false)
                                    .padding(.bottom)
                                TodaysActivityGrid()
                            }
                            .padding(.bottom)
                            Group {
                                FeatureHeader(title: "Plan For Success", shouldShowSeeAll: false)
                                MealTimeHorizontalList()
                            }
                            .padding(.bottom)
                            Group {
                                FeatureHeader(title: "Cookbooks For You", shouldShowSeeAll: true, onSeeAllPress: {print("hi")})
                                FeaturedHorizontalList(listData: MealSampleData, showOpacity: true, selectedItem: $selectedItem, animation: animation)
                            }
                            .padding(.bottom)
                            
                            if shouldScheduleCountScroll > 0 {
                                Group {
                                    FeatureHeader(title: "Today's Workout Schedule", shouldShowSeeAll: true, onSeeAllPress: {print("hi")}, text: "Calendar")
                                    TodaysScheduleList().frame(height: 310)
                                }
                                .padding(.bottom)
                            }
                            Group {
                                FeatureHeader(title: "Workouts You May Enjoy", shouldShowSeeAll: true, onSeeAllPress: {print("hi")})
                                FeaturedHorizontalList(listData: WorkoutSampleData, extraDetailsBackgroundColor: Color("AccentColor"),shouldShowDisplayNameAbove: true, selectedItem: $selectedItem, animation: animation)
                            }
                            .padding(.top)
                            .padding(.bottom)
                            
                        }
                    }
                    .scrollIndicators(.hidden)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .gradientBackground()
                    
                    if selectedItem != nil  {
                        TrainerView(id: selectedItem!.id.uuidString, imageUrl: selectedItem!.imageUrl, name: selectedItem!.displayName, animation: animation, selectedItem: $selectedItem)
                        
                    }
                }
                .navigationTitle("Home")
            }
        }
    }

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
