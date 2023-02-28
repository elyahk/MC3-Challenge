import SwiftUI

enum Erors: Error {
    case NoMessageError(for: String)
}

@MainActor
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
        try await Task.sleep(for: .seconds(0.1))
        let userMessage = Message(contents: [option.value], owner: .user)
        messages.append(userMessage)
        
        let nextMessage = try findMessage(key: option.key)
        try await Task.sleep(for: .seconds(0.3))
        messages.append(nextMessage)
        
        DispatchQueue.main.async {
            self.currentMessage = nextMessage
        }
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
            
            .background(Color.init(uiColor: .systemGray5))
        }
    }
}

struct ChatbotView_Previews: PreviewProvider {
    static var previews: some View {
        ChatbotView(viewModel: .mock)
    }
}
