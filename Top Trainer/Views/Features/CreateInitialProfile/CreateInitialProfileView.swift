//
//  CreateInitialProfileView.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/25/22.
//

import SwiftUI

struct CreateInitialProfileView: View {
    private let maxTagNumber = 8
    @State private var currentIndex = 0
    // Gender Selection View
    @State private var isMaleSelected: Bool = true
    @State private var isFemaleSelected: Bool = false
    // Age Picker View
    @State private var selectedAge = 14
    // Height Picker View
    @State private var selectedFeetIndex = 3
    @State private var selectedInchIndex = 0
    // Weight Picker View
    @State private var selectedWeight = 60
    // Goal Picker View
    @State private var selectedGoals = 0
    // Name Picker View
    @State private var name = ""
    // Avatar Picker View
    @State private var image: UIImage? = nil
    // Fitness Level Picker View
    @State private var selectedFitnessLevel = 0
    // Interest Picker View
    @State private var interests: [Interest] = [
        Interest(name:"Nutrition", emoji:"🍓", isSelected: false),
        Interest(name:"Meditation", emoji:"🧘🏾‍♀️", isSelected: false),
        Interest(name:"Sports", emoji:"🏈", isSelected: false),
        Interest(name:"Sleep", emoji:"💤", isSelected: false),
        Interest(name:"Health", emoji:"👨🏾‍⚕️", isSelected: false),
        Interest(name:"Running", emoji:"🏃🏾‍♂️", isSelected: false),
        Interest(name:"Vegan", emoji:"🥑", isSelected: false),
        Interest(name:"Strongman", emoji:"🏋🏾‍♂️", isSelected: false),
        Interest(name:"Powerlifting", emoji:"🦾", isSelected: false),
        Interest(name:"BodyBuilding", emoji:"💪🏾", isSelected: false),
        Interest(name:"WeightLifting", emoji:"🥇", isSelected: false),
        Interest(name:"Weight Loss", emoji:"🥗", isSelected: false),
    ]
    
    init() {
        // Add color to the paging view indicators
        UIPageControl.appearance().pageIndicatorTintColor = .gray
        UIPageControl.appearance().currentPageIndicatorTintColor = .green
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                TabView(selection: $currentIndex) {
                    NamePickerView(name: $name).tag(0)
                    GenderSelectionView(isMaleSelected: $isMaleSelected, isFemaleSelected: $isFemaleSelected).tag(1)
                    AvatarPickerView(image: $image).tag(2)
                    AgePickerView(selectedAge: $selectedAge).tag(3)
                    WeightPickerView(selectedWeight: $selectedWeight).tag(4)
                    HeightPickerView(selectedFeetIndex: $selectedFeetIndex, selectedInchIndex: $selectedInchIndex).tag(5)
                    GoalPickerView(selectedGoals: $selectedGoals).tag(6)
                    FitnessLevelPickerView(selectedFitnessLevel: $selectedFitnessLevel).tag(7)
                    InterestPickerView(interests: $interests).tag(8)
                }
                .tabViewStyle(.page)
                
                PageNavigator()
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction){
                    Button("Skip"){
                        withAnimation(.easeInOut) {
                            currentIndex = 8
                        }
                    }
                    .foregroundColor(.secondary)
                }
            }
            .gradientBackground()
        }
    }
    
    @ViewBuilder func PageNavigator() -> some View {
        HStack {
            ButtonCapsule(
                text: "Prev",
                background: currentIndex == 0 ? .gray : Color("AccentColor"),
                shouldHideShadow: false,
                height: 35
            ) {
                if currentIndex > 0 {
                    withAnimation {
                        currentIndex -= 1
                    }
                }
            }
            .disabled(currentIndex == 0 )
            .frame(width: 91)
            
            Spacer()
            
            ButtonCapsule(
                text: currentIndex == maxTagNumber  ? "Submit" :"Next",
                background: currentIndex == maxTagNumber ? Color("Secondary") : Color("AccentColor"),
                shouldHideShadow: false,
                height: 35
            ) {
                if currentIndex < maxTagNumber {
                        currentIndex += 1
                } else {
                    print("Submit")
                }
            }
            .frame(width: 91)
        }
        .animation(.default, value: currentIndex)
        .padding([.horizontal, .bottom], 24)
    }
}

struct CreateInitialProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CreateInitialProfileView()
            CreateInitialProfileView()
                .preferredColorScheme(.dark)
        }

    }
}
