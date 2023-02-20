//
//  ChatbotView.swift
//  MC3-Challenge
//
//  Created by Eldorbek Nusratov on 20/02/23.
//


// MARK: -  Give proper name for ChatManager and SingleChat

import SwiftUI

struct Message {
    let questions: [String]
    let options: [String]
    var answers: [String]
}

struct ChatManager {
    let chats: [Message]
}


struct ChatbotView: View {
    @State var currentMessage: Message = .init(questions: ["Question"], options: ["Option"], answers: [])
    let chatManager: ChatManager
    
    init(chatManager: ChatManager) {
        self.chatManager = chatManager
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text(currentMessage.questions[0])
                        .background(Color.yellow)
                        .padding([.leading])
                    Spacer()
                }
                if let firstAnswer = currentMessage.answers.first {
                    HStack {
                        Spacer()
                        Text(firstAnswer)
                            .background(Color.yellow)
                            .padding([.trailing])
                    }
                }
                Spacer()
                
            }
            .padding()
            
            Button {
                currentMessage.answers = [currentMessage.options[0]]
            } label: {
                Text(currentMessage.options[0])
            }

        }
    }
}

struct ChatbotView_Previews: PreviewProvider {
    static var previews: some View {
        ChatbotView(chatManager: .init(chats: [
            .init(questions: ["Q"], options: ["O"], answers: [])
        ]))
    }
}
