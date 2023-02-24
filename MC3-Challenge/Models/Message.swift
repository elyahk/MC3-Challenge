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
    var content: String = ""
    var contents: [String] = []
    var owner: Owner = .bot
    var options: [Option] = []
    
    init(id: String = "", contents: [String], owner: Owner = .bot, options: [Option] = []) {
        self.id = id
        self.contents = contents
        self.owner = owner
        self.options = options
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
    }
    
    static func == (lhs: Message, rhs: Message) -> Bool {
        lhs.id == rhs.id
    }
}

extension Message {
    static func long(owner: Owner = .bot) -> Message {
        .init(
            contents: ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, industry's standard dummy text ever since the 1500s"],
            owner: owner
        )
    }
    
    static func short(owner: Owner = .bot) -> Message {
        .init(
            contents: ["Lorem Ipsum is simply"],
            owner: owner
        )
    }
}
