////
////  OverView.swift
////  Molu
////
////  Created by Yecheng Wang on 2024-07-17.
////

import Foundation
import SwiftUI

struct OverView: View {
    var body: some View {
        
//        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    // Header
                    HStack {
                        VStack(alignment: .leading) {
                            Text("User Name")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("@username")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Button(action: {
                            // Action for account information
                        }) {
                            Image(systemName: "person.circle.fill")
                                .font(.title)
                                .foregroundColor(.gray)
                                .padding()
                        }
                    }
                    .padding()
                    
                    Text("Your current deals")
                        .font(.headline).padding(.horizontal)
                    
                    // Cards

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            NavigationLink(destination: AccountView()){
                                VStack(alignment: .leading) {
                                    Text("You owe\n[username]")
                                        .font(.headline)
                                        .foregroundColor(.gray)
                                    Text("$5,000.00")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .padding([.top, .bottom, .trailing], 2.0)
                                        .foregroundColor(.black)
                                    Text("$25,000.00 / $30,000.00")
                                        .font(.subheadline)
                                        .foregroundColor(.red)
                                    HStack{
                                        Label("Details", systemImage: "arrow.right.circle").foregroundColor(.gray)
                                    }
                                    .environment(\.layoutDirection, .rightToLeft)
                                    .padding(.all, 5.0)
                                }
                                .padding()
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(10)
                                .padding([.leading, .bottom], 15.0)
                                .shadow(radius: 5,
                                        x: 5,
                                        y: 5
                                )
                            }
                            
                            NavigationLink(destination: AccountView()) {
                                VStack(alignment: .leading) {
                                    Text("[username]\nowes you")
                                        .font(.headline)
                                        .foregroundColor(.gray)
                                    Text("$2,000.00")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .padding([.top, .bottom, .trailing], 2.0)
                                        .foregroundColor(.black)
                                    Text("$5,000.00 / $7,000.00")
                                        .font(.subheadline)
                                        .foregroundColor(.green)
                                    HStack{
                                        Label("Details", systemImage: "arrow.right.circle").foregroundColor(.gray)
                                    }
                                    .environment(\.layoutDirection, .rightToLeft)
                                    .padding(.all, 5.0)
                                }
                                .padding()
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(10)
                                .padding([.leading, .bottom], 15.0)
                                .shadow(radius: 5,
                                        x: 5,
                                        y: 5
                            )
                            }
                        }
                    }
                    
                    // Buttons
                    HStack {
                        Button(action: {
                            // Analytics action
                        }) {
                            VStack {
                                Image(systemName: "plus.app.fill")
                                    .font(.title)
                                Text("New Deal")
                                    .font(.subheadline)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                        }
                        
                        Button(action: {
                            // Withdraw action
                        }) {
                            VStack {
                                Image(systemName: "arrow.down.circle.fill")
                                    .font(.title)
                                Text("Withdraw")
                                    .font(.subheadline)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                        }
                        
                        Button(action: {
                            // Deposit action
                        }) {
                            VStack {
                                Image(systemName: "arrow.up.circle.fill")
                                    .font(.title)
                                Text("Deposit")
                                    .font(.subheadline)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                    
                    // Invite Section
                    VStack(alignment: .leading) {
                        Text("Invite a friend and you can both get $10 in BTC")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.top, 8)
                    
                    // Market Section
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Transactions")
                                .font(.headline)
                            Spacer()
                            Text("Sort by: Recent")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        
                        // Market List Placeholder
                        VStack {
                            HStack {
                                Text("Bitcoin")
                                    .font(.headline)
                                Spacer()
                                Text("$32,811.00")
                                    .font(.subheadline)
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                            
                            HStack {
                                Text("Ethereum")
                                    .font(.headline)
                                Spacer()
                                Text("$2,489.10")
                                    .font(.subheadline)
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                            
                            HStack {
                                Text("Tether")
                                    .font(.headline)
                                Spacer()
                                Text("$1.00")
                                    .font(.subheadline)
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                }
                .padding(.top)
            }
            .background(Color(UIColor.systemGray5))
//        }
        
    }
}

#Preview {
    OverView()
}




