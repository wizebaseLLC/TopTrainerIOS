//
//  LoginView.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/18/22.
//

import SwiftUI

enum LoginType {
    case signup, login
}

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    let loginType: LoginType
    
    init(_ _loginType: LoginType){
        loginType = _loginType
    }
    
    var body: some View {
        let isLoginType = loginType == .login
        
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    HeaderElements(isLoginType: isLoginType)
                    FormElements()
                    SocialLoginElements(isLoginType: isLoginType)
                    FooterElements(isLoginType: isLoginType)
                }
                .frame(height: geometry.size.height)
            }
        }
        .background(Color("Background").ignoresSafeArea(.all))
    }
    
    @ViewBuilder func FooterElements(isLoginType: Bool) -> some View {
        
        HStack(alignment: .firstTextBaseline) {
            Text(isLoginType ? "Dont have an account?" : "Already have an account?")
                .foregroundColor(.gray)
            
            Button(isLoginType ? "Sign up" : "Sign in") {}
        }
    }
    
    @ViewBuilder func SocialLoginElements(isLoginType: Bool) -> some View {
        Text(isLoginType ? "Or sign in with" : "Or sign up with")
            .foregroundColor(.gray)
            .padding(.bottom, 18)
        
        HStack(alignment: .center, spacing: 16) {
            SocialButton(imageName: "Facebook")
            SocialButton(imageName: "Google")
            SocialButton(imageName: "Apple")
        }
        .padding(.bottom, 42)
    }
    
    @ViewBuilder func FormElements() -> some View {
        TextField("", text: $username)
            .capsuleTextField()
            .placeholder(when: username.isEmpty, placeholder: {
                Text("Email Address")
                    .foregroundColor(.gray)
            })
            .keyboardType(.emailAddress)
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(kInputHeight)
            .padding(.horizontal)
            .padding(.bottom, 20)
        
        
        SecureField("", text: $password)
            .capsuleTextField()
            .placeholder(when: password.isEmpty, placeholder: {
                Text("Password")
                    .foregroundColor(.gray)
            })
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(kInputHeight)
            .padding(.horizontal)
            .padding(.bottom, 40)
        
        ButtonCapsule(text: "Sign In", background: Color("AccentColor"), shouldHideShadow: true){
            
        }
        .padding(.horizontal)
        .padding(.bottom, 42)
    }
    
    @ViewBuilder func HeaderElements(isLoginType: Bool) -> some View {
        if isLoginType {
            Image("Logo")
                .resizable()
                .frame(width: 150, height: 150)
        } else {
            VStack(alignment: .center, spacing: 8) {
                Text("Create new Account")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Text("Enter Your details to create account")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 33)
        }
        
    }
    
    @ViewBuilder func SocialButton(imageName name: String) -> some View {
        Button {} label: {
            Image(name)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(.login)
            .preferredColorScheme(.light)
    }
}
