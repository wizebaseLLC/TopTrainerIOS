//
//  WeightPickerView.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/26/22.
//

import SwiftUI

struct WeightPickerView: View {
    
    private let size: Double = 16
    @State private var isMaleSelected: Bool = true
    @State private var isFemaleSelected: Bool = false
    @State private var appear = [false,false]
    @State private var selectedColorIndex = 60
    
    var body: some View {
        VStack {
            Text("What's your weight")
                .font(.title.bold())
                .offset(y: appear[0] ? 0 : -120)
                .opacity(appear[0] ? 1 : 0)
                .padding(.bottom)
            
            Text("Help us to create your \npersonalized plan")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .offset(y: appear[1] ? 0 : 120)
                .opacity(appear[1] ? 1 : 0)
                .padding(.bottom, 48)
            
            Picker("Favorite Color", selection: $selectedColorIndex) {
                ForEach(60...600, id: \.self) { item in
                    HStack {
                        Text("\(item)")
                            .font(.title2.bold())
                        
                        .foregroundColor(selectedColorIndex == item ? Color("Secondary") : .primary)
                        Text("lbs")
                            .font(.body)
                            .foregroundColor(selectedColorIndex == item ? Color("Secondary") : .primary)
                    }
                    .tag(item)
                }
            }
            .pickerStyle(.wheel)
            .padding(.horizontal)
            
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

struct WeightPickerView_Previews: PreviewProvider {
    static var previews: some View {
        WeightPickerView()
    }
}
