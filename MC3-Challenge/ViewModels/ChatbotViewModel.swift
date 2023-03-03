//
//  ChatbotViewModel.swift
//  MC3-Challenge
//
//  Created by Ilona Sellenberkova on 03/03/2023.
//

import Foundation

enum Erors: Error {
    case NoMessageError(for: String)
}

@MainActor
class ChatbotViewModel: ObservableObject {
    @Published var messages: [Message] = []
    @Published var currentMessage: Message
    var database: [Message]
    
    init(currentMessage: Message, database: [Message] = []) {
        self.currentMessage = currentMessage
        self.database = database
        self.messages.append(currentMessage)
    }
    
    func answerButtonTapped(_ option: Option) {
        Task {
            do {
                try await userResponded(option)
            } catch {
                
            }
        }
    }
    
    private func userResponded(_ option: Option) async throws {
        try await Task.sleep(for: .seconds(0.1))
        let userMessage = Message(contents: [option.value], owner: .user)
        messages.append(userMessage)
        
        let nextMessage = try findMessage(key: option.key)
        try await Task.sleep(for: .seconds(0.3))
        messages.append(nextMessage)
        
        DispatchQueue.main.async {
            self.currentMessage = nextMessage
        }
    }
    
    private func findMessage(key id: String) throws -> Message {
        let message = database.first(where: { $0.id == id })
        guard let message = message else { throw Erors.NoMessageError(for: id) }
        
        return message
    }
}
