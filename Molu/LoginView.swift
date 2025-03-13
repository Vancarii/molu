//
//  LoginView.swift
//  Molu
//
//  Created by Yecheng Wang on 2025-03-13.
//


import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    @ObservedObject var authViewModel = AuthViewModel.shared

    var body: some View {
        VStack {
            Text("Login")
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
                authViewModel.signIn(email: email, password: password)
            }) {
                Text("Login")
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