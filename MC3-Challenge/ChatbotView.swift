//
//  ChatbotView.swift
//  MC3-Challenge
//
//  Created by Eldorbek Nusratov on 20/02/23.
//


// MARK: -  Give proper name for ChatManager and SingleChat

import SwiftUI

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

struct ChatbotView_Previews: PreviewProvider {
    static var previews: some View {
        ChatbotView(messageManager: .mock)
    }
}
