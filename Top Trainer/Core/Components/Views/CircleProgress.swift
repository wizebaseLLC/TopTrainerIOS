//
//  CircleProgress.swift
//  Top Trainer
//
//  Created by Servon Lewis on 9/29/22.
//

import SwiftUI

struct CircleProgress: View {
    let progress: Double
    let color: Color
    let lineWidth: CGFloat
    
    var body: some View {
        ZStack {
                 Circle()
                     .stroke(
                        Color.black.opacity(0.5),
                         lineWidth: lineWidth / 2
                     )
                 Circle()
                     // 2
                .trim(from: 0, to: progress)
                     .stroke(
                        color,
                         style: StrokeStyle(
                             lineWidth: lineWidth,
                             lineCap: .round
                         )
                     )
                     .rotationEffect(.degrees(-90))
                     .shadow(color: color.opacity(0.8) ,radius: 14)
                     .animation(.easeOut(duration: 1.0), value: progress)

             }
    }
}

struct CircleProgress_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("Background")
            CircleProgress(progress: 0.3, color: Color("Tertiary"), lineWidth: 22.0)
        }
    }
}
