//
//  AnimatedNumberView.swift
//  Top Trainer
//
//  Created by Servon Lewis on 10/9/22.
//

import SwiftUI

/// Creates a rolling number text view.
struct RollingNumberView: View {
    
    @State var to: Double
    @State var from: Double
    
    var body: some View {
        Color.clear
            .animatingOverlay(for: from)
            .onAppear {
                withAnimation(.easeInOut(duration: 1.0)) {
                    from = to
                }
            }
    }
}

struct RollingNumberView_Previews: PreviewProvider {
    static var previews: some View {
        RollingNumberView(to: 15, from: 500 )
    }
}



struct AnimatableNumberModifier: AnimatableModifier {
    var number: Double
    
    var animatableData: Double {
        get { number }
        set { number = newValue }
    }
    
    func body(content: Content) -> some View {
        Text("\(Int(number))")
    }
}


extension View {
    func animatingOverlay(for number: Double) -> some View {
        modifier(AnimatableNumberModifier(number: number))
    }
}
