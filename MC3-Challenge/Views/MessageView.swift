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
                ForEach(message.contents, id: \.self) { message in
                    Text(message)
                }
//                Text(message.contents.first ?? "")
                    .padding()
                    .background(Color.init(uiColor: .systemGray6))
                    .foregroundColor(.black)
                    .font(.title3)

            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: .init(contents: ["Message 1", "Message2"], owner: .user))
    }
}
