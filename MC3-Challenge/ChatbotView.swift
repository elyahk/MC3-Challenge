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
                    messageManager.messages.append(
                        Message(content: "Answer", owner: .user)
                    )
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
                    .padding([.leading])
                Spacer()
            case .user:
                Spacer()
                Text(message.content)
                    .background(Color.yellow)
                    .padding([.leading])
            }
            
        }
        .padding(4)
    }
}

//
//struct MessageView: View {
//    @ObservedObject var message: Message
//
//    init(message: Message) {
//        self.message = message
//    }
//
//    var body: some View {
//        ForEach(message.questions, id: \.self) { question in
//            HStack {
//                Text(question)
//                    .background(Color.yellow)
//                    .padding([.leading])
//                Spacer()
//            }
//            .padding(4)
//        }
//        if let firstAnswer = message.answers.first {
//            HStack {
//                Spacer()
//                Text(firstAnswer)
//                    .background(Color.yellow)
//                    .padding([.trailing])
//            }
//        }
//        Spacer()
//    }
//}



struct ChatbotView_Previews: PreviewProvider {
    static var previews: some View {
        ChatbotView(messageManager: .init(messages: [
            .init(content: "Message 1", owner: .chatbot),
            .init(content: "Message 1", owner: .user),
            .init(content: "Message 1", owner: .user),
            .init(content: "Message 1", owner: .chatbot),
            .init(content: "Message 1", owner: .chatbot)
        ]))
    }
}
