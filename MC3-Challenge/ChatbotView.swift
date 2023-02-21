//
//  ChatbotView.swift
//  MC3-Challenge
//
//  Created by Eldorbek Nusratov on 20/02/23.
//


// MARK: -  Give proper name for ChatManager and SingleChat

import SwiftUI

enum Owner {
    case chatbot
    case user
}

class Message: ObservableObject, Identifiable {
    var content: String
    var owner: Owner
    var date: Date = .init()
    
    init(content: String, owner: Owner) {
        self.content = content
        self.owner = owner
    }
}

class MessageManager: ObservableObject {
    @Published var messages: [Message]
    
    init(messages: [Message]) {
        self.messages = messages
    }
    
    private func userResponded(_ index: Int) {
        Task {
            do {
                try await Task.sleep(for: .seconds(1))
                messages.append(.init(content: "Question 2", owner: .chatbot))
            } catch {
                
            }
        }
    }
    
    func answerButtonTapped(_ index: Int) {
        messages.append(Message(content: "Answer", owner: .user))
        userResponded(index)
    }
}

struct ChatbotView: View {
    @ObservedObject var messageManager: MessageManager
    
    init(messageManager: MessageManager) {
        self.messageManager = messageManager
    }
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(messageManager.messages) { message in
                    MessageView(message: message)
                }
            }
            
            HStack {
                Button {
                    messageManager.answerButtonTapped(0)
                } label: {
                    Text("Answer")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
            .background(Color.gray)
        }
    }
}

struct MessageView: View {
    @ObservedObject var message: Message
    
    init(message: Message) {
        self.message = message
    }
    
    var body: some View {
        HStack {
            switch message.owner {
            case .chatbot:
                Text(message.content)
                    .background(Color.yellow)
                    .padding([.trailing], 100)
                Spacer()
            case .user:
                Spacer()
                Text(message.content)
                    .background(Color.yellow)
                    .padding([.leading], 100)
            }
            
        }
        .padding(4)
    }
}

struct ChatbotView_Previews: PreviewProvider {
    static var previews: some View {
        ChatbotView(messageManager: .mock)
    }
}

extension MessageManager {
    static let mock: MessageManager = MessageManager(messages: .mockMessages)
}

extension Array where Element == Message {
    static var mockMessages: [Element] {
        [
            Element(
                content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                owner: .chatbot
            ),
            Element(
                content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                owner: .chatbot
            )
        ]
    }
}
