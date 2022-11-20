//
//  ButtonCapsule.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/18/22.
//

import SwiftUI

struct ButtonCapsule: View {
    
    let text: String
    let background: Color
    let shouldHideShadow: Bool
    var height: CGFloat = kInputHeight
    let onPress: () -> Void
    
    var body: some View {
        Button {
            onPress()
        } label: {
            Text(text)
                .fontWeight(.bold)
                .transition(.opacity.combined(with: .scale))
                .id("ButtonCapsule \(text)")
                .padding(.horizontal)
                .frame(height: height)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(background)
                .cornerRadius(kInputHeight)
                .shadow(
                    color: background.opacity(0.3),
                    radius: shouldHideShadow ? 0 : 12,
                    x: shouldHideShadow ? 0 : 0,
                    y: shouldHideShadow ? 0 : 8
                )
        }
    }
}

struct ButtonCapsule_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCapsule(text: "Get Started", background: Color("AccentColor"),shouldHideShadow: true ) {
            print("tapped button")
        }
    }
}
