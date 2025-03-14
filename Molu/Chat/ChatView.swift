//
//  ChatView.swift
//  Molu
//
//  Created by Yecheng Wang on 2024-07-16.
//

import Foundation
import SwiftUI

struct ChatView: View {
    let message: Message
    let messages: [Message] = [
        Message(sender: "Alice", preview: "Hi, I need to discuss the recent transaction.", timestamp: "2h ago", fullMessage: "Hi, I need to discuss the recent transaction we made yesterday. Please let me know your availability."),
        Message(sender: "User", preview: "Sure, I'm available tomorrow.", timestamp: "1h ago", fullMessage: "Sure, I'm available tomorrow at 3 PM. Does that work for you?"),
        Message(sender: "Alice", preview: "Yes, that works.", timestamp: "1h ago", fullMessage: "Yes, that works for me. See you then!")
    ]

    var body: some View {
        
        
        VStack {
            ScrollView {
                VStack(spacing: 10) {
//                    ForEach(messages) { msg in
                        MessageBubble(message: message.fullMessage, isCurrentUser: message.sender == "User")
//                    }
                }
                .padding()
            }

            HStack {
                TextField("Type a message...", text: .constant(""))
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                Button(action: {
                    // Send message action
                }) {
                    Text("Send")
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationBarTitle("Chat", displayMode: .inline)
    }
}

struct MessageBubble: View {
    let message: String
    let isCurrentUser: Bool

    var body: some View {
        HStack {
            if isCurrentUser {
                Spacer()
            }

            Text(message)
                .padding()
                .background(isCurrentUser ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(isCurrentUser ? .white : .black)
                .cornerRadius(10)
                .padding(isCurrentUser ? .leading : .trailing, 50)
                .padding(.vertical, 5)

            if !isCurrentUser {
                Spacer()
            }
        }
    }
}

#Preview {
    ChatView(message: Message(sender: "Alice", preview: "Hi", timestamp: "now", fullMessage: "Hi"))
}
