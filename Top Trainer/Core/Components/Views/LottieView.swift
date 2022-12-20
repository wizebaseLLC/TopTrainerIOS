//
//  WaterFillLottie.swift
//  Top Trainer
//
//  Created by Servon Lewis on 9/30/22.
//

import SwiftUI
import Lottie

/// Plays Lottie File found in the ./LottieFiles directory.
struct LottieView: UIViewRepresentable {
    let lottieFile: String
    var shouldPlay: Bool = false
    var shouldLoop: Bool = false
    
    let animationView = AnimationView()
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
        
        animationView.animation = Animation.named(lottieFile)
        animationView.contentMode = .scaleAspectFit
        if shouldLoop {
            animationView.loopMode  = .loop
        }
        if shouldPlay {
            animationView.play()
        }
        
        
        
        view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct LottieView_Previews: PreviewProvider {
    static var previews: some View {
        LottieView(lottieFile: "waterFill", shouldPlay: true, shouldLoop: true)
            .cornerRadius(300)
            .frame(width: 300, height: 300)
    }
}

