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
    let onPress: () -> Void
    
    var body: some View {
        Button {
            onPress()
        } label: {
            Text(text)
                .fontWeight(.bold)
                .padding(.horizontal)
                .frame(height: kInputHeight)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(background)
                .cornerRadius(kInputHeight)
                .shadow(color: background.opacity(0.8), radius: shouldHideShadow ? 0 : 4, y: shouldHideShadow ? 0 : 4)
            
        }
    }
}

struct ButtonCapsule_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCapsule(text: "Get Started", background: Color("AccentColor"),shouldHideShadow: true, onPress: {print("tapped button")})
    }
}
