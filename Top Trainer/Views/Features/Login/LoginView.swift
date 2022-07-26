//
//  LoginView.swift
//  Top Trainer
//
//  Created by Servon Lewis on 7/18/22.
//

import SwiftUI

enum LoginType: Hashable {
    case signup, login
}

struct LoginView: View {
    let loginType: LoginType
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var forgotPasswordSheetPresented = false
    @State private var signupSheetPresented = false
    
    init(_ _loginType: LoginType){
        loginType = _loginType
    }
    
    var body: some View {
        let isLoginType = loginType == .login
        
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        HeaderElements(isLoginType: isLoginType)
                        FormElements(isLoginType: isLoginType)
                        SocialLoginElements(isLoginType: isLoginType)
                        FooterElements(isLoginType: isLoginType)
                    }
                    .frame(height: geometry.size.height)
                }
            }
            .background(Color("Background").ignoresSafeArea(.all))
            
        }
        .sheet(isPresented: $forgotPasswordSheetPresented) {
            ForgotPasswordView()
        }
        .sheet(isPresented: $signupSheetPresented) {
            LoginView(.signup)
        }
    }
    
    @ViewBuilder func FooterElements(isLoginType: Bool) -> some View {
        HStack(alignment: .firstTextBaseline) {
            if isLoginType {
                Text("Dont have an account?")
                    .foregroundColor(.gray)
                
                if isLoginType {
                    Button("Sign Up") {
                        signupSheetPresented = true
                    }
                }
            }
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
    
    @ViewBuilder func FormElements(isLoginType: Bool) -> some View {
        TextField("", text: $username)
            .capsuleTextField()
            .textfieldPlaceholder(when: username.isEmpty, placeholder: {
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
            .textfieldPlaceholder(when: password.isEmpty, placeholder: {
                Text("Password")
                    .foregroundColor(.gray)
            })
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(kInputHeight)
            .padding(.horizontal)
            .padding(.bottom, 40)
        
        ButtonCapsule(text: isLoginType ? "Sign In" : "Sign Up", background: Color("AccentColor"), shouldHideShadow: true){
            
        }
        .padding(.horizontal)
        .padding(.bottom)
        // Padding must be present if its not LoginType
        .padding(.bottom, isLoginType ? 0: 42)
        
        
        if isLoginType {
            Button("Forgot Password"){
                forgotPasswordSheetPresented = true
            }
            .foregroundColor(Color("Secondary"))
            .opacity(0.8)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.horizontal, 24)
            .padding(.bottom,  !isLoginType ? 0: 42)
        }
        
        
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
            .preferredColorScheme(.dark)
    }
}

