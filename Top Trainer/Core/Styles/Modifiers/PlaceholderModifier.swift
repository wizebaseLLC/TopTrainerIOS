//
//  PlaceholderModifier.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/24/22.
//

import SwiftUI

extension View {
    func textfieldPlaceholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
