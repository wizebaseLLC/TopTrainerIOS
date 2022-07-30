//
//  GoalPickerView.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/26/22.
//

import SwiftUI

// TODO: Move this to an View Model store.
let goals: [String] = [
"Get Fitter",
"Better Sleeping Habits",
"Weight Loss",
"Track My Nutrition",
"Improve My Overall Fitness"
]

struct GoalPickerView: View {
    
    @State private var appear = [false,false]
    @Binding var selectedGoals: Int
    
    var body: some View {
        VStack {
            Text("What's your goal?")
                .multilineTextAlignment(.center)
                .font(.title.bold())
                .offset(y: appear[0] ? 0 : -120)
                .opacity(appear[0] ? 1 : 0)
                .padding(.bottom)
            
            Text("You can always change this later")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .offset(y: appear[1] ? 0 : 120)
                .opacity(appear[1] ? 1 : 0)
                .padding(.bottom, 48)
            
            Picker("Goals", selection: $selectedGoals) {
                ForEach(0...(goals.count - 1), id: \.self) { item in
                        Text(goals[item])
                            .font(.title2.bold())
                            .foregroundColor(selectedGoals == item ? Color("Secondary") : .primary)
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

struct GoalPickerView_Previews: PreviewProvider {
    static var previews: some View {
        GoalPickerView(selectedGoals: .constant(0))
    }
}
