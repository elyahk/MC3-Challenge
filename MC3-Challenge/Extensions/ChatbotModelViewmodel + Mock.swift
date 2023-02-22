extension ChatbotViewModel {
    static let mock: ChatbotViewModel = ChatbotViewModel(
        messages: [
            .init(id: "1", content: "Hello", owner: .bot, options: [["key": "2", "value": "Hi 0"]])
        ],
        database: [
            .init(id: "1", content: "Hello", owner: .bot, options: [["key": "2", "value": "Hi 1"]]),
            .init(id: "2", answerId: "3", content: "Hi 2", owner: .user),
            .init(id: "3", content: "Appointment", owner: .bot, options: [["key": "4", "value": "yes"],["key": "6", "value": "no"]]),
            .init(id: "4", answerId: "5", content: "Yes", owner: .user),
            .init(id: "5", content: "Form", owner: .bot),
            .init(id: "6", answerId: "7", content: "No", owner: .user),
            .init(id: "7", content: "Help", owner: .bot, options: [["key": "8", "value": "sure"]])
        ]
    )
}
