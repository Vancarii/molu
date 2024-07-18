//
//  AccountView.swift
//  Molu
//
//  Created by Yecheng Wang on 2024-07-16.
//

import Foundation
import SwiftUI

struct AccountView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Header
                HStack {
                    Text("Account Overview")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        // Profile action
                    }) {
                        Image(systemName: "person.circle")
                            .font(.largeTitle)
                    }
                }
                .padding()
                
                // Financial Overview
                VStack(alignment: .leading) {
                    Text("Financial Overview")
                        .font(.headline)
                        .padding(.bottom, 8)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Debt Owed")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("$5,000.00")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Earnings")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("$15,000.00")
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
    AccountView()
}
