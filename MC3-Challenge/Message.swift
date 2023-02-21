//
//  Message.swift
//  MC3-Challenge
//
//  Created by Eldorbek Nusratov on 21/02/23.
//

import Foundation

enum Owner: Equatable {
    case chatbot
    case user
}

class Message: ObservableObject, Identifiable, Equatable {
    var content: String
    var owner: Owner
    var date: Date = .init()
    
    init(content: String, owner: Owner) {
        self.content = content
        self.owner = owner
    }
    
    static func == (lhs: Message, rhs: Message) -> Bool {
        lhs.id == rhs.id
    }
}

extension Message {
    static func long(owner: Owner = .chatbot) -> Message {
        .init(
            content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, industry's standard dummy text ever since the 1500s",
            owner: owner
        )
    }
    
    static func short(owner: Owner = .chatbot) -> Message {
        .init(
            content: "Lorem Ipsum is simply",
            owner: owner
        )
    }
}
