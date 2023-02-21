//
//  ChatbotView.swift
//  MC3-Challenge
//
//  Created by Eldorbek Nusratov on 20/02/23.
//


// MARK: -  Give proper name for ChatManager and SingleChat

import SwiftUI

class Message: ObservableObject {
    var questions: [String] = []
    let options: [String] = []
    @Published var answers: [String] = []
}

struct ChatManager {
    let chats: [Message]
}


struct ChatbotView: View {
    @State var currentMessage: Message = .init()
    
    let chatManager: ChatManager
    
    init(chatManager: ChatManager) {
        self.chatManager = chatManager
    }
    
    var body: some View {
        VStack {
            VStack {
                
                
                HStack {
                    ForEach(currentMessage.options, id: \.self) { option in
                        Button {
                            currentMessage.answers = [option]
                        } label: {
                            Text(option)
                        }
                    }
                }
            }
        }
    }
}

struct MessageView: View {
    @ObservedObject var message: Message
    
    init(message: Message) {
        self.message = message
    }
    
    var body: some View {
        ForEach(message.questions, id: \.self) { question in
            HStack {
                Text(question)
                    .background(Color.yellow)
                    .padding([.leading])
                Spacer()
            }
            .padding(4)
        }
        if let firstAnswer = message.answers.first {
            HStack {
                Spacer()
                Text(firstAnswer)
                    .background(Color.yellow)
                    .padding([.trailing])
            }
        }
        Spacer()
    }
}



struct ChatbotView_Previews: PreviewProvider {
    static var previews: some View {
        ChatbotView(chatManager: .init(chats: [
            .init()
        ]))
    }
}
