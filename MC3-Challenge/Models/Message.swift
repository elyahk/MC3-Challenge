//
//  Message.swift
//  MC3-Challenge
//
//  Created by Eldorbek Nusratov on 21/02/23.
//

import Foundation

enum Owner: String, Equatable, Decodable {
    case bot
    case user
}

struct Option: Decodable, Hashable {
    var key: String
    var value: String
}

class Message: ObservableObject, Identifiable, Equatable, Decodable {
    var id: String = ""
    var answerId: String = ""
    var content: String
    var owner: Owner
    var date: Date = .init()
    var options: [Option] = []
    
    init(id: String = "", answerId: String = "", content: String, owner: Owner, options: [Option] = []) {
        self.id = id
        self.content = content
        self.owner = owner
        self.options = options
        self.answerId = answerId
    }
    
    // initialize decoder...
    enum CodingKeys: CodingKey {
        case content
        case owner
        case id
        case options
        case date
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.content = try container.decode(String.self, forKey: .content)
        self.owner = try container.decode(Owner.self, forKey: .owner)
        self.id = try container.decode(String.self, forKey: .id)
        self.options = try container.decode([Option].self, forKey: .options)
        self.date = .init() // date is not in json, just initialize here
    }
    
    static func == (lhs: Message, rhs: Message) -> Bool {
        lhs.id == rhs.id
    }
}

extension Message {
    static func long(owner: Owner = .bot) -> Message {
        .init(
            content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, industry's standard dummy text ever since the 1500s",
            owner: owner
        )
    }
    
    static func short(owner: Owner = .bot) -> Message {
        .init(
            content: "Lorem Ipsum is simply",
            owner: owner
        )
    }
}
