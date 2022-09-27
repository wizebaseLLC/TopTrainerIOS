//
//  GetStartedOnboarding.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/17/22.
//

import SwiftUI

struct GetStartedOnboarding: View {
    @Environment(\.colorScheme) var colorScheme
    @State var appear = [false,false]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(colorScheme == .dark ? "onboardingBlob4Dark" : "onboardingBlob4")
                    .resizable()
                    .offset(x: -33, y: -180)
                    .shadow(radius: 1)
                    .blur(radius: 3)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
                
                Image("onboarding5")
                    .resizable()
                    .frame(height:geometry.size.height * 0.45)
                    .offset(y: 60)
                
                VStack {
                    logoAndText
                    getStartedButton
                }
                .zIndex(2)
                
            }
        }
    }
    
    var logoAndText: some View {
        VStack {
            Image("Logo")
                .resizable()
                .frame(width: 150, height: 150)
            
            Text("Welcome to Top Trainer")
                .font(.title3.weight(.bold))
                .padding(.bottom, 1)
                .offset(y: appear[0] ? 0 : -120)
                .opacity(appear[0] ? 1 : 0)
            
            Group {
                Text("Let your new Health & Fitness ")
                    .offset(y: appear[1] ? 0 : 120)
                    .opacity(appear[1] ? 1 : 0)
                
                Text("Journey start with us!")
                    .offset(y: appear[1] ? 0 : 120)
                    .opacity(appear[1] ? 1 : 0)
            }
            .foregroundColor(.secondary)
            .font(.callout)
        }
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
    
    var getStartedButton: some View {
        VStack {
            ButtonCapsule(
                text: "Get Started",
                background: Color("AccentColor"),
                shouldHideShadow: false
            ){
                print("Button Tapped")
            }
            .padding(.horizontal)
            .padding(.bottom)
            HStack {
                Text("Already have an Account? ")
                Button("Sign In"){
                    print("tapped sign in")
                }
                .fontWeight(.bold)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .padding(.bottom, 48)
    }
}

struct GetStartedOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedOnboarding().preferredColorScheme(.dark)
    }
}
