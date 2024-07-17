//
//  HomeView.swift
//  Molu
//
//  Created by Yecheng Wang on 2024-07-16.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            // Header Section
            
            Text("Welcome Back, \n [User]")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            
            .padding()
            
            //                // Account Balance Section
            //                VStack(alignment: .leading) {
            //                    Text("Balance Owing")
            //                        .font(.headline)
            //                    Text("$2,000.00")
            //                        .font(.largeTitle)
            //                        .fontWeight(.bold)
            //                }
            //                .padding()
            //                .background(Color.blue.opacity(0.1))
            //                .cornerRadius(10)
            //                .padding([.leading, .trailing, .top])
            
            TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
                VStack {
                    CardView(title: "Buy", description: "Amount Owing")
                }
                .padding()
                .tabItem { Text("Buy") }.tag(0)
                VStack {
                    CardView(title: "Sell", description: "Amount Remaining")
                }
                .padding()
                .tabItem { Text("Sell") }.tag(1)
            }.tabViewStyle(PageTabViewStyle())
            
            
            // Recent Transactions Section
            Text("All Transactions")
                .font(.headline)
                .padding([.leading, .top])
            
            List {
                ForEach(0..<5) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Transaction \(item + 1)")
                                .font(.headline)
                            Text("Description of transaction")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text("-$100.00")
                            .font(.headline)
                            .foregroundColor(.red)
                    }
                }
            }
            .listStyle(DefaultListStyle())
            
//                Spacer()
            
            
        }
        .navigationBarTitle("Dashboard", displayMode: .inline)
    }
}

struct CardView: View {
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .padding([.top, .horizontal])
            Text(description)
                .font(.largeTitle)
                .bold()
                .font(.subheadline)
                .padding([.horizontal, .bottom])
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        
    }
}

#Preview {
    HomeView()
}
