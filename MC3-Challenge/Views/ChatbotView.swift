import SwiftUI

enum Erors: Error {
    case NoMessageError(for: String)
}

class ChatbotViewModel: ObservableObject {
    @Published var messages: [Message] = []
    @Published var currentMessage: Message
    var database: [Message]
    
    init(currentMessage: Message, database: [Message] = []) {
        self.currentMessage = currentMessage
        self.database = database
        self.messages.append(currentMessage)
    }
    
    func answerButtonTapped(_ option: Option) {
        Task {
            do {
                try await userResponded(option)
            } catch {
                
            }
        }
    }
    
    private func userResponded(_ option: Option) async throws {
        try await Task.sleep(for: .seconds(0.3))
        let newMessage = try findMessage(key: option.key)
        messages.append(newMessage)
        
        let nextMessage = try findMessage(key: newMessage.answerId)
        try await Task.sleep(for: .seconds(0.3))
        messages.append(nextMessage)
        currentMessage = nextMessage
    }
    
    private func findMessage(key id: String) throws -> Message {
        let message = database.first(where: { $0.id == id })
        guard let message = message else { throw Erors.NoMessageError(for: id) }
        
        return message
    }
}

struct ChatbotView: View {
    @ObservedObject var viewModel: ChatbotViewModel
    
    init(viewModel: ChatbotViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            ScrollViewReader { scrollView in
                ScrollView(.vertical) {
                    ForEach(viewModel.messages) { message in
                        MessageView(message: message)
                            .id(message.id)
                    }
                }
                .onChange(of: viewModel.messages) { messages in
                    scrollView.scrollTo(messages.last?.id)
                }
            }
            
            SendMessageView(message: viewModel.currentMessage, send: { option in
                viewModel.answerButtonTapped(option)
            })
            
            .background(Color.gray)
        }
    }
}

struct ChatbotView_Previews: PreviewProvider {
    static var previews: some View {
        ChatbotView(viewModel: .mock)
    }
}
