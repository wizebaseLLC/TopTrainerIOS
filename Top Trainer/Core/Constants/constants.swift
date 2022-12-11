//
//  Gradients.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/17/22.
//

import SwiftUI

let kGradient1 = LinearGradient(colors: [Color.white, Color("AccentColor"), ], startPoint: .topLeading, endPoint: .bottomTrailing)
let kGradient2 = LinearGradient(colors: [Color.white, Color("Secondary"), ], startPoint: .topLeading, endPoint: .bottomTrailing)
let kGradient3 = LinearGradient(colors: [Color("AccentColor"), Color("Secondary"),Color("Tertiary") ], startPoint: .topLeading, endPoint: .bottomTrailing)
let kGradient4 = AngularGradient(gradient: Gradient(colors: [Color("AccentColor"), Color("Secondary"),Color("Tertiary")]), center: .center, startAngle: .zero, endAngle: .degrees(360))
let kGradientBackground = LinearGradient(colors: [Color("Background"), Color.black, Color("Background"), Color.black], startPoint: .top, endPoint: .bottom)

let kInputHeight: CGFloat = 66
