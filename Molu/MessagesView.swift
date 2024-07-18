//
//  MessagesView.swift
//  Molu
//
//  Created by Yecheng Wang on 2024-07-16.
//

import Foundation
import SwiftUI

struct Message: Identifiable {
    let id = UUID()
    let sender: String
    let preview: String
    let timestamp: String
    let fullMessage: String // Add a full message for detailed view
    
}

struct MessagesView: View {
    let messages: [Message] = [
        Message(sender: "Alice", preview: "Hi, I need to discuss the recent transaction.", timestamp: "2h ago", fullMessage: "Hi, I need to discuss the recent transaction we made yesterday. Please let me know your availability."),
        Message(sender: "Bob", preview: "Can you send me the latest report?", timestamp: "4h ago", fullMessage: "Can you send me the latest report on our financials? I need it by end of the day."),
        Message(sender: "Charlie", preview: "Your invoice has been processed.", timestamp: "1d ago", fullMessage: "Your invoice has been processed. You should receive the payment within 3-5 business days."),
        Message(sender: "Diana", preview: "Looking forward to our meeting next week.", timestamp: "2d ago", fullMessage: "Looking forward to our meeting next week. Please let me know if you need any additional information beforehand."),
        Message(sender: "Eve", preview: "Please review the attached document.", timestamp: "3d ago", fullMessage: "Please review the attached document and provide your feedback by the end of the week.")
    ]
    var body: some View {
        List(messages) { message in
            NavigationLink(destination: ChatView(message: message)) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(message.sender)
                            .font(.headline)
                        Text(message.preview)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text(message.timestamp)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 8)
            }
        }
        .navigationBarTitle("Messages", displayMode: .inline)
        
    }
}


#Preview {
    MessagesView()
}
