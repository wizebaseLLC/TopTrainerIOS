//
//  GenderSelectionView.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/25/22.
//

import SwiftUI

struct GenderSelectionView: View {
    private let size: Double = 16
    @State private var isMaleSelected: Bool = true
    @State private var isFemaleSelected: Bool = false
    
    var body: some View {
        VStack {
            Text("Gender")
                .font(.title.bold())
                .padding(.bottom)
            
            Text("Help us to create your \npersonalized plan")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
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
    }
}

struct GenderSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GenderSelectionView()
    }
}
