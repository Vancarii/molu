//
//  ContentView.swift
//  Molu
//
//  Created by Yecheng Wang on 2024-07-16.
//

import SwiftUI

struct ContentView: View {
    
    // for the bottom navigation bar selection
    @State private var selection = 1;
    
    // For firebase login functionality
    @ObservedObject var authViewModel = AuthViewModel.shared
    @State private var showLogin = false

    
    var body: some View {
        
        //this navigation view is here so that the messages tab navigates to the chat tab and the overview navigates to the accountview tab without the bottom nav bar (tabview) staying
        NavigationView {
            if let _ = authViewModel.user {
                
                TabView(selection: $selection){
                    MessagesView().tabItem { Image(systemName: "paperplane")}.tag(0)
                    OverView().tabItem { Image(systemName: "house")}.tag(1)
                }
            } else {
                // USER LOGIN VIEW - TEMPORARY
                
                // If user is nil, show a choice to either Sign Up or Log In
                VStack(spacing: 20) {
                    Text("Welcome!")
                        .font(.largeTitle)

                    Button("Go to Sign Up") {
                        showLogin = false
                    }
                    .font(.title3)

                    Button("Go to Login") {
                        showLogin = true
                    }
                    .font(.title3)

                    // Conditionally show either login or signup
                    if showLogin {
                        LoginView()
                    } else {
                        SignUpView()
                    }
                }
                .padding()
            }
        }
    }
}


#Preview {
    ContentView()
}
