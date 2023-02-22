//
//  MessageManager.swift
//  MC3-Challenge
//
//  Created by Eldorbek Nusratov on 21/02/23.
//

import Foundation
import SwiftUI

struct MessageJSON: Decodable {
    var messages: [Message]
}

func loadJSONMessages() {
    // 1. make connection to the json file
    let data: Data
    let loadedJson: MessageJSON
    
    guard let file = Bundle.main.url(forResource: "Message", withExtension: "json")
        else {
            fatalError("Couldn't find 'Message.json' from Bundle.main.")
        }
    
    do {
        data = try Data.init(contentsOf: file) // ! without do/catch
    } catch {
        fatalError("Couldn't load file Message.json from Bundle.main")
    }
    
    do {
        loadedJson = try JSONDecoder().decode(MessageJSON.self, from: data) // ? need declare variable to reach in do/catch
    } catch {
        fatalError("Couldn't decode/parse Message.json into MessageJSON struct.")
    }
    
    print(loadedJson.messages[0].content as Any)
}
