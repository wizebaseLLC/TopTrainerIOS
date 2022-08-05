//
//  FitnessLevelPicker.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/29/22.
//

import SwiftUI

// TODO: Move this to an View Model store.
let fitnessLevels: [String] = [
   "Beginner",
   "Intermediate",
   "Advanced"
]

struct FitnessLevelPickerView: View {
    
    @State private var appear = [false,false]
    @Binding var selectedFitnessLevel: Int
    
    var body: some View {
        VStack {
            Text("What's your current fitness level?")
                .font(.title.bold())
                .multilineTextAlignment(.center)
                .offset(y: appear[0] ? 0 : -120)
                .opacity(appear[0] ? 1 : 0)
                .padding(.bottom)
            
            Text("Help us to create your personalized plan")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .offset(y: appear[1] ? 0 : 120)
                .opacity(appear[1] ? 1 : 0)
                .padding(.bottom, 48)
            
            Picker("Goals", selection: $selectedFitnessLevel) {
                ForEach(0...(fitnessLevels.count - 1), id: \.self) { item in
                    Text(fitnessLevels[item])
                        .font(.title2.bold())
                        .foregroundColor(selectedFitnessLevel == item ? Color("Secondary") : .primary)
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

struct FitnessLevelPickerView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessLevelPickerView(selectedFitnessLevel: .constant(0))
    }
}
