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
            switch message.owner {
            case .bot:
                ForEach(message.contents, id: \.self) { text in
                    HStack {
                        Text(text)
                            .background(Color.yellow)
                            .padding([.trailing], 100)
                            .font(.title)
                        Spacer()
                    }
                }
            case .user:
                ForEach(message.contents, id: \.self) { text in
                    HStack {
                        Spacer()
                        Text(text)
                            .background(Color.yellow)
                            .padding([.leading], 100)
                            .font(.title)
                    }
                }
            }
            
        }
        .padding(4)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: .init(contents: ["Message 1"], owner: .user))
    }
}
