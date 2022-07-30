//
//  GenderSelectionView.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/25/22.
//

import SwiftUI

struct GenderSelectionView: View {
    @Binding var isMaleSelected: Bool
    @Binding var isFemaleSelected: Bool
    @State private var appear = [false,false]
    
    var body: some View {
        VStack {
            Text("Gender")
                .font(.title.bold())
                .multilineTextAlignment(.center)
                .offset(y: appear[0] ? 0 : -120)
                .opacity(appear[0] ? 1 : 0)
                .padding(.bottom)
            
            Text("Help us to create your \npersonalized plan")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .offset(y: appear[1] ? 0 : 120)
                .opacity(appear[1] ? 1 : 0)
                .padding(.bottom, 48)
            
            HStack(spacing: 24) {
                GenderCardView(isSelected: isMaleSelected, genderOptions: .male) {
                    withAnimation {
                        isMaleSelected = true
                        isFemaleSelected = false
                    }
                }
                GenderCardView(isSelected: isFemaleSelected, genderOptions: .female) {
                    withAnimation {
                        isMaleSelected = false
                        isFemaleSelected = true
                    }
                }
            }
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
}

struct GenderSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GenderSelectionView(isMaleSelected: .constant(true), isFemaleSelected: .constant(false))
    }
}
