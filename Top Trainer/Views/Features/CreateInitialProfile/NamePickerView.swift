//
//  NamePickerView.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/26/22.
//

import SwiftUI

struct NamePickerView: View {
    
    @State private var appear = [false,false]
    @Binding var name: String
    
    var body: some View {
        VStack {
            Text("What's your Name")
                .font(.title.bold())
                .multilineTextAlignment(.center)
                .offset(y: appear[0] ? 0 : -120)
                .opacity(appear[0] ? 1 : 0)
                .padding(.bottom)
            
            Text("Help us to create your \npersonalized plan")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .offset(y: appear[1] ? 0 : 120)
                .opacity(appear[1] ? 1 : 0)
                .padding(.bottom, 48)
             
            
            TextField("Full Name", text: $name)
                .capsuleTextField()
                .cornerRadius(kInputHeight)
                .padding(.horizontal)
                .padding(.bottom, 20)
            
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

struct NamePickerView_Previews: PreviewProvider {
    static var previews: some View {
        NamePickerView(name: .constant(""))
    }
}
