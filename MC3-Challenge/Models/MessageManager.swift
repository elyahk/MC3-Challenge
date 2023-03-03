//
//  MessageManager.swift
//  MC3-Challenge
//
//  Created by Eldorbek Nusratov on 21/02/23.
//

import Foundation
import SwiftUI

private struct MessageJSON: Decodable {
    var messages: [Message]
}

struct NotFoundDataError: Error {}

func loadJSONMessages() throws -> [Message] {
    // 1. make connection to the json file
    guard let file = Bundle.main.url(forResource: "Message", withExtension: "json")
    else { throw NotFoundDataError() }
    let data = try Data.init(contentsOf: file)
    let loadedJson = try JSONDecoder().decode(MessageJSON.self, from: data)
    print(loadedJson.messages.first!)
    return loadedJson.messages
}
