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

    
    var body: some View {
        
        //this navigation view is here so that the messages tab navigates to the chat tab and the overview navigates to the accountview tab without the bottom nav bar (tabview) staying
        
            if let _ = authViewModel.user {
                NavigationView {
                    TabView(selection: $selection){
                        MessagesView().tabItem { Image(systemName: "paperplane")}.tag(0)
                        OverView().tabItem { Image(systemName: "house")}.tag(1)
                    }
                }
            } else {
                // Here user is not logged in
                // If user is nil, show the welcome screen
                WelcomeScreenView()
            }
    
    }
}


#Preview {
    ContentView()
}
