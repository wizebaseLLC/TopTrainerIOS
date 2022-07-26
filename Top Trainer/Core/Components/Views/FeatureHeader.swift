//
//  FeatureHeader.swift
//  Top Trainer
//
//  Created by Servon Lewis on 9/27/22.
//

import SwiftUI

struct FeatureHeader: View {
    let title: String
    let shouldShowSeeAll: Bool
    var onSeeAllPress: (() -> Void)?
    var text: String = "See all"
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title3.bold())
            
            if shouldShowSeeAll && onSeeAllPress != nil {
                Spacer()
                
                Button {onSeeAllPress!()} label: {
                    HStack(spacing: 4) {
                        Text(text)
                        Image(systemName: "chevron.right")
                    }
                    .font(.footnote)
                    .foregroundColor(Color("Tertiary"))
                    .opacity(0.9)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

struct FeatureHeader_Previews: PreviewProvider {
    static var previews: some View {
        FeatureHeader(title: "Featured Top Trainers", shouldShowSeeAll: false)
    }
}
