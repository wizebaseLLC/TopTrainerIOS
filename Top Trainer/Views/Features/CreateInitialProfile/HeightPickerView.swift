//
//  HeightPickerView.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/26/22.
//

import SwiftUI

struct HeightPickerView: View {
    private let size: Double = 16
    @State private var isMaleSelected: Bool = true
    @State private var isFemaleSelected: Bool = false
    @State private var appear = [false,false]
    @State private var selectedFeetIndex = 3
    @State private var selectedInchIndex = 1
    
    var body: some View {
        VStack {
            Text("What's your Height")
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
            
            
            List {
                Picker("Feet", selection: $selectedFeetIndex) {
                    ForEach(3...10, id: \.self) { item in
                        HStack {
                            Text("\(item) ft")
                            .foregroundColor(selectedFeetIndex == item ? Color("Secondary") : .primary)
                        }
                    }
                }
                
                Picker("Inches", selection: $selectedInchIndex) {
                    ForEach(1...11, id: \.self) { item in
                        HStack {
                            Text("\(item) in").tag(item)
                            .foregroundColor(selectedInchIndex == item ? Color("Secondary") : .primary)
                        }
                    }
                }
            }
            .frame(height: 160)
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

struct HeightPickerView_Previews: PreviewProvider {
    static var previews: some View {
        HeightPickerView()
    }
}
