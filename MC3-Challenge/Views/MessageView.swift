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
        HStack {
            switch message.owner {
            case .bot:
                Text(message.content)
                    .background(Color.yellow)
                    .padding([.trailing], 100)
                Spacer()
            case .user:
                Spacer()
                Text(message.content)
                    .background(Color.yellow)
                    .padding([.leading], 100)
            }
            
        }
        .padding(4)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: .init(content: "Message 1", owner: .bot))
    }
}
