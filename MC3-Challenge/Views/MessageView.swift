//
//  MessageView.swift
//  MC3-Challenge
//
//  Created by Eldorbek Nusratov on 21/02/23.
//

import SwiftUI

struct MessageView: View {
    @ObservedObject var message: Message
    
    init(message: Message) {
        self.message = message
    }
    
    var body: some View {
        VStack {
            ChatBubble(direction: message.owner) {
                Text(message.contents.first ?? "")
                    .padding()
                    .background(Color.yellow)
                    .font(.title)

            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: .init(contents: ["Message 1"], owner: .user))
    }
}
