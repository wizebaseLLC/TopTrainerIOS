//
//  GenderCardView.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/25/22.
//

import SwiftUI

enum GenderOptions {
    case male, female
}
struct GenderCardView: View {
    
    let size: Double = 16
    var isSelected: Bool
    var genderOptions: GenderOptions
    var onTap: () -> Void
    
    var body: some View {
        Image(genderOptions == .male ? "GenderMale" : "GenderFemale")
            .resizable()
            .frame(width: 107, height: 141,alignment: .bottom)
            .opacity(isSelected ? 1 : 0.5)
            .padding(size)
            .background(
                .ultraThinMaterial,
                in: RoundedRectangle(cornerRadius: 45, style: .continuous).offset(y: -size))
            .background(
                // Update the opacity on selection
                Color("Secondary").opacity(isSelected ? 1 : 0),
                in: RoundedRectangle(cornerRadius: 45, style: .continuous).offset(y: -size))
            .clipShape(RoundedRectangle(cornerRadius: 45, style: .continuous).offset(y: -size))
            .onTapGesture {
                onTap()
            }
    }
}

struct GenderCardView_Previews: PreviewProvider {
    static var previews: some View {
        GenderCardView(isSelected: true, genderOptions: .female, onTap: {})
    }
}
