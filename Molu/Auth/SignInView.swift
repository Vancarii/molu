//
//  SignInScreen.swift
//  Molu
//
//  Created by Yecheng Wang on 2025-03-13.
//


import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    @ObservedObject var authViewModel = AuthViewModel.shared
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Spacer()
                
                Text("Welcome Back")
                    .font(Font.custom("OPTIDanley-Medium", size: 46))
                    .foregroundColor(.black)
                
                Text("Sign in to your account.")
                    .font(Font.custom("OPTIDanley-Medium", size: 16))
                    .foregroundColor(.secondary)
                    .padding(.bottom, 20)
                
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                    TextField("Email", text: $email)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .padding(.horizontal, 30)
                
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.gray)
                    SecureField("Password", text: $password)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .padding(.horizontal, 30)
                
                Button(action: {
                    // Action for sign in
                    authViewModel.signIn(email: email, password: password)
                    
                }) {
                    Text("Sign In")
                        .font(Font.custom("OPTIDanley-Medium", size: 16))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 0, green: 0.5, blue: 0.5))
                        .cornerRadius(8)
                }
                .padding(.horizontal, 30)
                .padding(.top, 10)
                
                // Display error if any
                if let error = authViewModel.authError {
                    Text(error)
                       .foregroundColor(.red)
                       .padding()
                }
                
                //Forgot password Button
                NavigationLink(destination: ForgotPasswordView()){
                    Text("Forgot password?")
                        .font(Font.custom("OPTIDanley-Medium", size: 14))
                        .foregroundColor(Color(red: 0, green: 0.5, blue: 0.5))
                }
                .padding(.top, 10)
                
                Spacer()
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
