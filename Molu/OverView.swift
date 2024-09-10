////
////  OverView.swift
////  Molu
////
////  Created by Yecheng Wang on 2024-07-17.
////

import Foundation
import SwiftUI

struct Deal: Identifiable {
    let id = UUID()
    let username: String
    let remaining: String
    let paid: String
    let total: String
}

extension AnyTransition {
    static var moveUp: AnyTransition {
        AnyTransition.move(edge: .bottom)
    }
}


struct OverView: View {
    
    let deals: [Deal] = [
        Deal(username: "Alice", remaining: "$5,000.00", paid: "$25,000.00", total: "$30,000.00"),
        Deal(username: "John", remaining: "$1,000.00", paid: "$500.00", total: "$1,500.00"),
        Deal(username: "Grant", remaining: "$50.00", paid: "$100.00", total: "$150.00"),
    ]
    
    @State private var showNewDealSheet = false
    
    
    var body: some View {
        
//        ZStack {
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
                            ForEach(deals) { deal in
                                NavigationLink(destination: DealView(deal: deal)){
                                    VStack(alignment: .leading) {
                                        Text("You owe")
                                            .font(.headline)
                                            .foregroundColor(.gray)
                                        Text(deal.username)
                                            .font(.headline)
                                            .foregroundColor(.gray)
                                        Text(deal.remaining)
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .padding([.top, .bottom, .trailing], 2.0)
                                            .foregroundColor(.black)
                                        Text("\(deal.paid) / \(deal.total)")
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
                                    .padding([.leading, .trailing], 5.0)
                                    .padding([.bottom], 10.0)
                                    .shadow(radius: 5,
                                            x: 5,
                                            y: 5
                                    )
                                }
                            }
                            
                            
                        }
                        .padding(.horizontal)
                    }
                    
                    // Buttons
                    HStack {
                        
                        Button(action: {
                            
                            showNewDealSheet.toggle()
                            
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
                        }.sheet(isPresented: $showNewDealSheet) {
//                            print("Sheet dismissed!")
                        } content: {
                            NewDealView(showNewDealPage: $showNewDealSheet).interactiveDismissDisabled()
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
                    
                    //                    // Invite Section
                    //                    VStack(alignment: .leading) {
                    //                        Text("Invite a friend and you can both get $10 in BTC")
                    //                            .font(.subheadline)
                    //                            .foregroundColor(.black)
                    //                    }
                    //                    .padding()
                    //                    .background(Color(UIColor.systemGray6))
                    //                    .cornerRadius(10)
                    //                    .padding(.horizontal)
                    //                    .padding(.top, 8)
                    
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
                                Text("Paid")
                                    .font(.headline)
                                Spacer()
                                Text("$185.00")
                                    .font(.subheadline)
                                    .foregroundColor(.red)
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                            
                            HStack {
                                Text("Received")
                                    .font(.headline)
                                Spacer()
                                Text("$200.00")
                                    .font(.subheadline)
                                    .foregroundColor(.green)
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                            
                            HStack {
                                Text("Received")
                                    .font(.headline)
                                Spacer()
                                Text("$150.00")
                                    .font(.subheadline)
                                    .foregroundColor(.green)
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
            
            
//            if showNewDealPage {
//                NewDealView(showNewDealPage: $showNewDealPage)
//                    .transition(.moveUp)
//                    .zIndex(1) // Ensures that the DetailView is on top
//            }
        
        
//        }
        
    }
}

struct NewDealView: View {
    @Binding var showNewDealPage: Bool
    @State private var username: String = ""
    @State private var productName: String = ""
    @State private var productPrice: String = ""
    @State private var downPayment: String = ""
    @State private var selectedImage: Image? = nil
    @State private var isImagePickerPresented: Bool = false

    var body: some View {
        VStack() {
            
            HStack {
                Button("Cancel") {
                    // cancel and dont save
                        showNewDealPage.toggle()
                    
                }
                .padding()
                Spacer()
                Button("Save") {
                    // save the data as draft then dismiss
                        showNewDealPage.toggle()
                    
                }
                .padding()
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Create a deal")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Add details to your listing for the buyer to verify")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Divider()
            
            
            HStack {
                Text("Add images of your product")
                    .font(.caption)
                .foregroundColor(.gray)
                Spacer()
            }
            .padding([.top, .leading])
            
                Button(action: {
                    isImagePickerPresented.toggle()
                }) {
                    if let selectedImage = selectedImage {
                        selectedImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                    } else {
                        Image(systemName: "photo.stack")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.gray)
                    }
                }.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .padding()
            
            
            HStack {
                Text("\(Text("*").foregroundColor(Color(.red)))Required: The name of your product")
                    .font(.caption)
                .foregroundColor(.gray)
                Spacer()
            }
            .padding(/*@START_MENU_TOKEN@*/[.top, .leading]/*@END_MENU_TOKEN@*/)
            
                
            TextField("Product Name", text: $productName)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)

            HStack {
                Text("\(Text("*").foregroundColor(Color(.red)))Required: The amount you have listed the product for")
                    .font(.caption)
                .foregroundColor(.gray)
                Spacer()
            }
            .padding(/*@START_MENU_TOKEN@*/[.top, .leading]/*@END_MENU_TOKEN@*/)
            
            TextField("Product Price", text: $productPrice)
                .keyboardType(.decimalPad)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
            
            HStack {
                Text("The amount you require for down payment ($0 if empty)")
                    .font(.caption)
                .foregroundColor(.gray)
                Spacer()
            }
            .padding(/*@START_MENU_TOKEN@*/[.top, .leading]/*@END_MENU_TOKEN@*/)
            
            TextField("Down Payment", text: $downPayment)
                .keyboardType(.decimalPad)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)


        }
        .frame(maxWidth: .infinity, maxHeight: .nan)
        
        .edgesIgnoringSafeArea(.all)
        
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(image: $selectedImage)
        }
    }
}


#Preview {
    OverView()
}




