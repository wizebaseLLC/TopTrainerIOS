//
//  CapsuleTextFieldModifier.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/23/22.
//

import SwiftUI

struct CapsuleTextFieldModifier: ViewModifier {
    // Option to modify the color if needed.
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .frame(height: kInputHeight)
            .overlay(
                RoundedRectangle(cornerRadius: kInputHeight)
                    .stroke(color, lineWidth: 3)
            )
    }
}


extension View {
    func capsuleTextField(_ color: Color = Color("AccentColor")) -> some View {
        modifier(CapsuleTextFieldModifier(color: color))
    }
}

