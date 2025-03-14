//
//  ResetPasswordScreen.swift
//  Molu
//
//  Created by Yecheng Wang on 2025-03-13.
//


import SwiftUI

struct ResetPasswordView: View {
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Spacer()
                
                Text("Reset Password")
                    .font(Font.custom("OPTIDanley-Medium", size: 32))
                    .foregroundColor(.black)
                
                Text("Enter a new password for your account.")
                    .font(Font.custom("OPTIDanley-Medium", size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 20)
                
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.gray)
                    SecureField("New Password", text: $newPassword)
                }
                .padding()
                .background(Color(red: 0.95, green: 0.97, blue: 1.0))
                .cornerRadius(8)
                .padding(.horizontal, 30)
                
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.gray)
                    SecureField("Confirm New Password", text: $confirmPassword)
                }
                .padding()
                .background(Color(red: 0.95, green: 0.97, blue: 1.0))
                .cornerRadius(8)
                .padding(.horizontal, 30)
                
                Spacer()
                
                Button(action: {
                    // Action for reset password
                }) {
                    Text("Reset Password")
                        .font(Font.custom("OPTIDanley-Medium", size: 16))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 0, green: 0.5, blue: 0.5))
                        .cornerRadius(8)
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 40)
            }
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
