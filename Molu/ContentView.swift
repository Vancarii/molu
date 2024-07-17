//
//  ContentView.swift
//  Molu
//
//  Created by Yecheng Wang on 2024-07-16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            MessagesView().tabItem { Image(systemName: "paperplane") }
            HomeView().tabItem { Image(systemName: "house")
            }
            AccountView().tabItem { Image(systemName: "person.circle")
            }
        }
    }
}


#Preview {
    ContentView()
}
