//
//  ForgotPasswordView.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/24/22.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @State var username: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Please enter your email address. You will receive a link to create a new password via email.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding([.horizontal, .top])
                    .padding(.bottom, 60)
                
                TextField("Email Address", text: $username)
                    .capsuleTextField(.purple)
                    .keyboardType(.emailAddress)
                    .cornerRadius(kInputHeight)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                
                
                ButtonCapsule(text: "Submit", background: Color("AccentColor"), shouldHideShadow: false){}
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle("Forgot Password")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView().preferredColorScheme(.dark)
    }
}
