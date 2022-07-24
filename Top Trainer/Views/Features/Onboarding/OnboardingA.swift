//
//  Time.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/17/22.
//

import SwiftUI

struct OnboardingA: View {
    
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
                text
                Image(illustrationName)
                    .resizable()
                    .frame(width: 275, height: 275)
                    .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottom)
                    .padding(60)
                    .offset(y: -48)
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
        .offset(y: 24)
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
            Image(colorScheme == .dark ? "onboardingBlob2Dark" :"onboardingBlob1")
                .resizable()
                .offset(x: -33)
            
            Image("onboardingBlob2")
                .resizable()
                .offset(x: -33)
            
        }
    }
}

struct OnboardingA_Previews: PreviewProvider {
    @Environment(\.colorScheme) var colorScheme
    static var previews: some View {
        OnboardingA(
            illustrationName: "onboarding1",
            header: "Time",
            subHeader: "Dont waste your Time &",
            subHeaderCont: "Start your Journey"
        ) //.preferredColorScheme(.dark)
    }
}
