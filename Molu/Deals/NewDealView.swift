////
////  NewDealView.swift
////  Molu
////
////  Created by Yecheng Wang on 2024-07-18.
////
//
//import SwiftUI
//
//struct NewDealView: View {
//    @Binding var showNewDealPage: Bool
//    @State private var username: String = ""
//    @State private var productName: String = ""
//    @State private var productPrice: String = ""
//    @State private var paymentTimeIncrements: String = ""
//    @State private var increasedTotalPrice: String = ""
//    @State private var selectedImage: Image? = nil
//    @State private var isImagePickerPresented: Bool = false
//
//    var body: some View {
//        VStack {
//            TextField("Search for username", text: $username)
//                .padding()
//                .background(Color.gray.opacity(0.2))
//                .cornerRadius(8)
//                .padding(.horizontal)
//
//            TextField("Product Name", text: $productName)
//                .padding()
//                .background(Color.gray.opacity(0.2))
//                .cornerRadius(8)
//                .padding(.horizontal)
//
//            TextField("Product Price", text: $productPrice)
//                .keyboardType(.decimalPad)
//                .padding()
//                .background(Color.gray.opacity(0.2))
//                .cornerRadius(8)
//                .padding(.horizontal)
//
//            TextField("Payment Time Increments", text: $paymentTimeIncrements)
//                .padding()
//                .background(Color.gray.opacity(0.2))
//                .cornerRadius(8)
//                .padding(.horizontal)
//
//            TextField("Increased Total Price", text: $increasedTotalPrice)
//                .keyboardType(.decimalPad)
//                .padding()
//                .background(Color.gray.opacity(0.2))
//                .cornerRadius(8)
//                .padding(.horizontal)
//
//            Button(action: {
//                isImagePickerPresented.toggle()
//            }) {
//                if let selectedImage = selectedImage {
//                    selectedImage
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 100, height: 100)
//                        .clipShape(Circle())
//                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
//                        .shadow(radius: 10)
//                } else {
//                    Image(systemName: "photo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 100, height: 100)
//                        .foregroundColor(.gray)
//                }
//            }
//            .padding()
//
//            Button("Close") {
//                withAnimation {
//                    showNewDealPage.toggle()
//                }
//            }
//            .padding()	
//
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.white)
//        .edgesIgnoringSafeArea(.all)
//        .sheet(isPresented: $isImagePickerPresented) {
//            ImagePicker(image: $selectedImage)
//        }
//    }
//}
//
//struct NewDealView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewDealView(showNewDealPage: .constant(true))
//    }
//}
//
//
