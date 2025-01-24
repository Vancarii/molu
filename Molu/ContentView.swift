//
//  ContentView.swift
//  Molu
//
//  Created by Yecheng Wang on 2024-07-16.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 1;
    
    var body: some View {
        
        //this navigation view is here so that the messages tab navigates to the chat
        // tab and the overview navigates to the accountview tab without the bottom nav bar (tabview) staying
        NavigationView {
            TabView(selection: $selection){
                MessagesView().tabItem { Image(systemName: "paperplane")}.tag(0)
                OverView().tabItem { Image(systemName: "house")}.tag(1)
            }
        }
    }
}


#Preview {
    ContentView()
}
