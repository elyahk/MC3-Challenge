extension ChatbotViewModel {
    static let mock: ChatbotViewModel = ChatbotViewModel(messages: [.long(), .short(), .short(owner: .user), .long()])
}
