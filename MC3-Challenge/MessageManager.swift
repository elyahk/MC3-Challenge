//
//  MessageManager.swift
//  MC3-Challenge
//
//  Created by Eldorbek Nusratov on 21/02/23.
//

import Foundation

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

extension MessageManager {
    static let mock: MessageManager = MessageManager(messages: [.long(), .short(), .short(owner: .user), .long()])
}
