//
//  SignUpView.swift
//  Molu
//
//  Created by Yecheng Wang on 2025-03-13.
//


import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    // We’ll use the shared AuthViewModel
    @ObservedObject var authViewModel = AuthViewModel.shared

    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.largeTitle)
                .padding()

            TextField("Email", text: $email)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                authViewModel.signUp(email: email, password: password)
            }) {
                Text("Create Account")
                    .padding()
            }

            // Display error if any
            if let error = authViewModel.authError {
                Text(error)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
    }
}