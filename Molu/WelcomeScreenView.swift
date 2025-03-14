//
//  WelcomeScreen.swift
//  Molu
//
//  Created by Yecheng Wang on 2025-03-13.
//


import SwiftUI

struct WelcomeScreenView: View {
    var body: some View {
        // Navigation stack prevents double wrapping the navigationLinks
        // So that the signin flow can keep going to new screens and back
        NavigationStack {
            ZStack {
                VStack(spacing: 20) {
                    Spacer()
                    
                    Text("Welcome to Molu")
                        .font(Font.custom("OPTIDanley-Medium", size: 52))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    

                    Text("We're glad you're here, your marketplace deals await you.")
                        .font(Font.custom("OPTIDanley-Medium", size: 16))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 40)
                    
                    Spacer()
                    
                    // Create an Account Button
                    NavigationLink(destination: CreateAccountView()) {
                        Text("Create an Account")
                            .font(Font.custom("OPTIDanley-Medium", size: 16))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 0, green: 0.5, blue: 0.5))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 40)
                    
                    // Sign In to Existing account button
                    NavigationLink(destination: SignInView()) {
                        Text("Sign In")
                            .font(Font.custom("OPTIDanley-Medium", size: 16))
                            .foregroundColor(Color(red: 0, green: 0.5, blue: 0.5))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 0.9, green: 0.95, blue: 0.98))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 40)
                }
            }
        }
    }
}

struct WelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView()
    }
}
