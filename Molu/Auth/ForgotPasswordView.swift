//
//  ForgotPasswordScreen.swift
//  Molu
//
//  Created by Yecheng Wang on 2025-03-13.
//


import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Spacer()
                
                Text("Forgot Password?")
                    .font(Font.custom("OPTIDanley-Medium", size: 32))
                    .foregroundColor(.black)
                
                Text("Don't worry! It happens. Please enter the email associated with your account.")
                    .font(Font.custom("OPTIDanley-Medium", size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 20)
                
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                    TextField("Email", text: $email)
                }
                .padding()
                .background(Color(red: 0.95, green: 0.97, blue: 1.0))
                .cornerRadius(8)
                .padding(.horizontal, 30)
                
                Spacer()
                
                NavigationLink(destination: ResetPasswordView()){
                    Text("Submit")
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

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
