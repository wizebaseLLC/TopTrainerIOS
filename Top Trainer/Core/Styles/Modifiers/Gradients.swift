//
//  Gradients.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/17/22.
//

import SwiftUI

struct Gradient1: ViewModifier {
    func body(content: Content) -> some View {
        content.background(kGradient1)
    }
}

extension View {
    func gradient1() -> some View {
        modifier(Gradient1())
    }
}

struct Gradient2: ViewModifier {
    func body(content: Content) -> some View {
        content.background(kGradient2)
    }
}


extension View {
    func gradient2() -> some View {
        modifier(Gradient2())
    }
}

struct Gradient3: ViewModifier {
    func body(content: Content) -> some View {
        content.background(kGradient3)
    }
}


extension View {
    func gradient3() -> some View {
        modifier(Gradient3())
    }
}

struct Gradient4: ViewModifier {
    func body(content: Content) -> some View {
        content.background(kGradient4)
    }
}


extension View {
    func gradient4() -> some View {
        modifier(Gradient4())
    }
}

struct GradientBackground: ViewModifier {
    func body(content: Content) -> some View {
        content.background(kGradientBackground.ignoresSafeArea(.all))
    }
}

extension View {
    func gradientBackground() -> some View {
        modifier(GradientBackground())
    }
}
