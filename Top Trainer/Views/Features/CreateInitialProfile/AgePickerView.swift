//
//  AgePickerView.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/26/22.
//

import SwiftUI

struct AgePickerView: View {
    @State private var appear = [false,false]
    @Binding var selectedAge: Int
    
    var body: some View {
        VStack {
            Text("How old are you")
                .multilineTextAlignment(.center)
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
            
            Picker("Favorite Color", selection: $selectedAge) {
                ForEach(14...99, id: \.self) { item in
                    Text("\(item)").tag(item)
                        .font(.title2.bold())
                        .foregroundColor(selectedAge == item ? Color("Secondary") : .primary)
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

struct AgePickerView_Previews: PreviewProvider {
    static var previews: some View {
        AgePickerView(selectedAge: .constant(14)).preferredColorScheme(.dark)
    }
}
