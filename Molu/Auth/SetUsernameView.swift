//
//  SetUsernameView.swift
//  Molu
//
//  Created by Yecheng Wang on 2025-03-15.
//


import SwiftUI

struct SetUsernameView: View {
    @State private var username: String = ""
    
    @ObservedObject var authViewModel = AuthViewModel.shared
    
    var email: String
    var password: String
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Spacer()
                
                Text("Create a username")
                    .font(Font.custom("OPTIDanley-Medium", size: 40))
                    .foregroundColor(.black)
//                    .padding(.bottom, 20)
                
                Text("This will be your display name in the app. You can always change it later.")
                    .font(Font.custom("OPTIDanley-Medium", size: 14))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .bottom, .trailing], 30)
                
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.gray)
                    TextField("Username", text: $username)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .padding(.horizontal, 30)
                .padding(.bottom, 15.0)
                
                
                Button(action: {
                    // Action for create account
//                    authViewModel.signUp(email: email, password: password)
                    completeSignUp()
                }) {
                    Text("Submit")
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
            
                
                Spacer()
                
               
            }
        }
    }
    
    private func completeSignUp() {
        
        authViewModel.SignUp(email: email, password: password, username: username) {_ in
            // else it navigates to the home screen automatically through the authViewModel listener
        }
        
    }
}

struct SetUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        SetUsernameView(email: "", password: "")
    }
}
