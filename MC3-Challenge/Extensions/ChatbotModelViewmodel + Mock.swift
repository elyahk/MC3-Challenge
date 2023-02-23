extension ChatbotViewModel {
    static let mock: ChatbotViewModel = ChatbotViewModel(
        currentMessage:
                .init(id: "1", content: "Hello", owner: .bot, options: [
                    .init(key: "2", value: "Hi")
                    
                ]),
        database: [
            .init(id: "1", content: "Hello", owner: .bot, options: [.init(key: "2", value: "Hi")]),
            .init(id: "2", answerId: "3", content: "Hi 2", owner: .user),
            .init(id: "3", content: "Appointment", owner: .bot, options: [.init(key: "4", value: "yes"), .init(key: "6", value: "no")]),
            .init(id: "4", answerId: "5", content: "Yes", owner: .user),
            .init(id: "5", content: "Form", owner: .bot),
            .init(id: "6", answerId: "7", content: "No", owner: .user),
            .init(id: "7", content: "Help", owner: .bot, options: [.init(key: "8", value: "Sure")]),
            .init(id: "8", content: "Sure", owner: .user, options: [.init(key: "8", value: "End")])
        ]
    )
}
