//
//  SignUpScreen.swift
//  Molu
//
//  Created by Yecheng Wang on 2025-03-13.
//


import SwiftUI

struct CreateAccountView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @ObservedObject var authViewModel = AuthViewModel.shared
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Spacer()
                
                Text("Create Account")
                    .font(Font.custom("OPTIDanley-Medium", size: 40))
                    .foregroundColor(.black)
                    .padding(.bottom, 20)
                
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.gray)
                    TextField("Username", text: $username)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .padding(.horizontal, 30)
                
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
                
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.gray)
                    SecureField("Confirm password", text: $confirmPassword)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .padding(.horizontal, 30)
                
                Button(action: {
                    // Action for create account
                    authViewModel.signUp(email: email, password: password)
                }) {
                    Text("Create Account")
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
                
                NavigationLink(destination: SignInView()){
                    Text("I already have an account")
                        .font(Font.custom("OPTIDanley-Medium", size: 14))
                        .foregroundColor(Color(red: 0, green: 0.5, blue: 0.5))
                }
                .padding(.top, 10)
                
                Spacer()
                
               
            }
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
