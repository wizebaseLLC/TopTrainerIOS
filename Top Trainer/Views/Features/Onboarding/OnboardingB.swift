//
//  WorkoutOnboarding.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/17/22.
//

import SwiftUI

struct OnboardingB: View {
    
    @Environment(\.colorScheme) var colorScheme
    let illustrationName: String
    let header: String
    let subHeader: String
    let subHeaderCont: String
    @State var appear = [false,false]
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            backgroundImages
            VStack {
            
                Image(illustrationName)
                    .resizable()
                    .frame(width: 275, height: 275)
                    .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .leading)
                    .padding(33)
                
                text
       
            }
        }
    }
    
    var text: some View {
        VStack(alignment: .leading) {
            
            Text(header)
                .font(.largeTitle.bold())
                .padding(.bottom, 8)
                .offset(y: appear[0] ? 0 : -120)
                .opacity(appear[0] ? 1 : 0)
            Group {
                Text(subHeader)
                    .offset(y: appear[1] ? 0 : 120)
                    .opacity(appear[1] ? 1 : 0)
                Text(subHeaderCont)
                    .offset(y: appear[1] ? 0 : 120)
                    .opacity(appear[1] ? 1 : 0)
                
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(33)
        .offset(y: -48)
        .onAppear {
            withAnimation(.easeOut.delay(0.3)) {
                appear[0] = true
            }
            withAnimation(.easeOut.delay(0.4)) {
                appear[1] = true
            }
        }
        .onDisappear {
            appear[0] = false
            appear[1] = false
        }
    }
    
    
    var backgroundImages: some View {
        Group{
            Image("onboardingBlob3")
                .resizable()
                .offset(x: -33)
            
            Image(colorScheme == .dark ? "onboardingBlob4Dark" : "onboardingBlob4")
                .resizable()
                .offset(x: -33)
            
        }
    }
}

struct OnboardingB_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingB(
            illustrationName: "onboarding2",
            header: "Workout",
            subHeader: "Create or find a workout",
            subHeaderCont: "& diet plan to stay fit"
        )
        .preferredColorScheme(.dark)
    }
}
