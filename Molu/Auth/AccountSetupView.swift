//
//  AccountSetupView.swift
//  Molu
//
//  Created by Yecheng Wang on 2025-03-15.
//
import SwiftUI

struct AccountSetup: View {
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var username: String = ""
    @State private var phoneNumber: String = ""
    @State private var selectedTab = 0

    @ObservedObject var authViewModel = AuthViewModel.shared

    var email: String
    var password: String

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 20) {
                Spacer()
                
                Text("Account Setup")
                    .font(Font.custom("OPTIDanley-Medium", size: 40))
                    .foregroundColor(.black)
                    .padding(.top, geometry.size.height / 8)
                
                TabView(selection: $selectedTab) {
                    AccountSetupNameView(firstname: $firstname, lastname: $lastname, onNext: {
                        selectedTab = 1
                    })
                    .tag(0)
                    
                    AccountSetupPhoneView(phoneNumber: $phoneNumber, onNext: {selectedTab = 2}, onBack: {selectedTab = selectedTab - 1})
                        .tag(1)
                    
                    AccountSetupUsernameView(username: $username, onSubmit: completeSignUp, onBack: {selectedTab = selectedTab - 1})
                        .tag(2)
                }
                .frame(minHeight: 200)
                
                if let error = authViewModel.authError {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                }
                
                Spacer()
                
                ProgressView(value: Double(selectedTab) + 1, total: 4)
                    .padding(.bottom, 20)
                    .padding(.horizontal, 30)
                    .tint(Color.accentColor)
                    .animation(.easeInOut, value: selectedTab)
            }
        }
        
    }

    private func completeSignUp() {
        authViewModel.SignUp(email: email, password: password, username: username, fullname: firstname + " " + lastname, phoneNumber: phoneNumber)
    }
}

struct AccountSetupNameView: View {
    @Binding var firstname: String
    @Binding var lastname: String
    var onNext: () -> Void

    var body: some View {
        VStack {
            Text("Enter your first and last name.")
                .font(Font.custom("OPTIDanley-Medium", size: 14))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding([.leading, .bottom, .trailing], 30)

            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                TextField("First Name", text: $firstname)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .padding(.horizontal, 30)
            .padding(.bottom, 15.0)
            
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                TextField("Last Name", text: $lastname)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .padding(.horizontal, 30)
            .padding(.bottom, 15.0)

            Button(action: onNext) {
                Text("Next")
                    .font(Font.custom("OPTIDanley-Medium", size: 16))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0, green: 0.5, blue: 0.5))
                    .cornerRadius(8)
            }
            .padding(.horizontal, 30)
            .padding(.top, 10)
        }
    }
}

struct AccountSetupPhoneView: View {
    @Binding var phoneNumber: String
    var onNext: () -> Void
    var onBack: () -> Void

    var body: some View {
        VStack {
            Text("Enter your phone number below, and we will send you a one-time verification code.")
                .font(Font.custom("OPTIDanley-Medium", size: 14))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding([.leading, .bottom, .trailing], 30)

            HStack {
                Image(systemName: "phone")
                    .foregroundColor(.gray)
                TextField("Phone Number", text: $phoneNumber)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .padding(.horizontal, 30)
            .padding(.bottom, 15.0)
            

            VStack {
                Button(action: onNext) {
                    Text("Send One-Time Code")
                        .font(Font.custom("OPTIDanley-Medium", size: 16))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 0, green: 0.5, blue: 0.5))
                        .cornerRadius(8)
                }
                
                .padding(.top, 10)
                
                Button(action: onBack) {
                    Text("Back")
                        .font(Font.custom("OPTIDanley-Medium", size: 16))
                        .foregroundColor(Color(red: 0, green: 0.5, blue: 0.5))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hue: 0.5, saturation: 0.081, brightness: 0.921))
                        .cornerRadius(8)
                }
                .padding(.top, 10)
            }
            .padding(.horizontal, 30)
            
        }
    }
}

struct AccountSetupUsernameView: View {
    @Binding var username: String
    var onSubmit: () -> Void
    var onBack: () -> Void
    
    var body: some View {
        VStack {
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
            VStack {
               
                
               Button(action: onSubmit) {
                   Text("Submit")
                       .font(Font.custom("OPTIDanley-Medium", size: 16))
                       .foregroundColor(.white)
                       .frame(maxWidth: .infinity)
                       .padding()
                       .background(Color(red: 0, green: 0.5, blue: 0.5))
                       .cornerRadius(8)
               }
               .padding(.top, 10)
                
                Button(action: onBack) {
                    Text("Back")
                        .font(Font.custom("OPTIDanley-Medium", size: 16))
                        .foregroundColor(Color(red: 0, green: 0.5, blue: 0.5))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hue: 0.5, saturation: 0.081, brightness: 0.921))
                        .cornerRadius(8)
                }
                .padding(.top, 10)
           }
            .padding(.horizontal, 30)
        }
    }
}

struct AccountSetup_Previews: PreviewProvider {
    static var previews: some View {
        AccountSetup(email: "", password: "")
    }
}
