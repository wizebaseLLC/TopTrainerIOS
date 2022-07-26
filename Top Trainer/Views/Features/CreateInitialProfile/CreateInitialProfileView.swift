//
//  CreateInitialProfileView.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/25/22.
//

import SwiftUI

struct CreateInitialProfileView: View {
    @State private var currentIndex = 0
    private let maxTagNumber = 3
    
    init() {
        // Add color to the paging view indicators
        UIPageControl.appearance().pageIndicatorTintColor = .gray
        UIPageControl.appearance().currentPageIndicatorTintColor = .green
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                TabView(selection: $currentIndex) {
                    GenderSelectionView().tag(0)
                    AgePickerView().tag(1)
                    WeightPickerView().tag(2)
                    HeightPickerView().tag(3)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                
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
                        text: "Next",
                        background: currentIndex == maxTagNumber ? .gray : Color("AccentColor"),
                        shouldHideShadow: false,
                        height: 35
                    ) {
                        if currentIndex < maxTagNumber {
                            withAnimation {
                                currentIndex += 1
                            }
                            
                        }
                    }
                    .disabled(currentIndex == maxTagNumber )
                    .frame(width: 91)
                }
                .padding([.horizontal, .bottom], 24)
            }
            
        }
    }
}

struct CreateInitialProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateInitialProfileView()
            .preferredColorScheme(.light)
    }
}
