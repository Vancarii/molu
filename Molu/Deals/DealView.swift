//
//  AccountView.swift
//  Molu
//
//  Created by Yecheng Wang on 2024-07-16.
//

import Foundation
import SwiftUI

struct DealView: View {
    let deal: Deal

    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Header
                
                Text("Deal Details")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding([.top, .leading])
                
                Text("You are buying a [product]").font(.headline)
                    .foregroundColor(.gray)
                    .padding(.leading)
                
                // Financial Overview
                VStack(alignment: .leading) {
                    Text("Financial Overview")
                        .font(.headline)
                        .padding(.bottom, 8)
                    
                    VStack(alignment: .leading) {
                        Text("Amount Left")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text(deal.remaining)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                    }
                    
                    Spacer()
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Product Cost")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text(deal.total)
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Paid")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text(deal.paid)
                                .font(.title)
                                .fontWeight(.bold)
                        }
                    }
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
                .padding([.horizontal, .top])
                
                // Actions
                VStack(alignment: .leading) {
                    Text("Actions")
                        .font(.headline)
                        .padding(.bottom, 8)
                    
                    Button(action: {
                        // Create new deal action
                    }) {
                        Text("Create New Deal")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        // Manage debts action
                    }) {
                        Text("Manage Debts")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        // View earnings action
                    }) {
                        Text("View Earnings")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                
                // Recent Deals
                VStack(alignment: .leading) {
                    Text("Recent Deals")
                        .font(.headline)
                        .padding([.top, .horizontal])
                    
                    ForEach(0..<5) { deal in
                        VStack(alignment: .leading) {
                            Text("Deal \(deal + 1)")
                                .font(.headline)
                            Text("Details of deal \(deal + 1). This section can include information about the parties involved, amount, status, etc.")
                                .font(.body)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.bottom, 8)
                    }
                }
            }
        }
    }
}


#Preview {
    DealView(deal: Deal(username: "Alice", remaining: "$100.00", paid: "$50.00", total: "$150.00"))
}
