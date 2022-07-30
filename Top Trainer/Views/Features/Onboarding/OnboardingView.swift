//
//  OnboardingView.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/18/22.
//

import SwiftUI

struct OnboardingView: View {
    @State var currentIndex = 0
    
    init() {
        UIPageControl.appearance().pageIndicatorTintColor = .gray
        UIPageControl.appearance().currentPageIndicatorTintColor = .green
    }
    
    var body: some View {
        NavigationStack{
            TabView(selection: $currentIndex) {
                OnboardingA(
                    illustrationName: "onboarding1",
                    header: "Time",
                    subHeader: "Dont waste your Time &",
                    subHeaderCont: "Start your Journey"
                )
                .tag(0)
                OnboardingB(
                    illustrationName: "onboarding2",
                    header: "Workout",
                    subHeader: "Create or find a workout",
                    subHeaderCont: "& diet plan to stay fit"
                )
                .tag(1)
                OnboardingA(
                    illustrationName: "onboarding3",
                    header: "Track",
                    subHeader: "Track your workout &",
                    subHeaderCont: "diet activity"
                )
                .tag(2)
                OnboardingB(
                    illustrationName: "onboarding4",
                    header: "Trainer",
                    subHeader: "Browse our top trainers",
                    subHeaderCont: "to help reach your goals"
                )
                .tag(3)
                GetStartedOnboarding()
                    .tag(4)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .toolbar {
                ToolbarItem(placement: .primaryAction){
                    Button("Skip"){
                        withAnimation(.easeInOut) {
                            currentIndex = 4
                        }
                    }
                    .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
