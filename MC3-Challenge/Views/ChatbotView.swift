import SwiftUI

class ChatbotViewModel: ObservableObject {
    @Published var messages: [Message]
    @Published var options: [Option] = []
    var database: [Message]
    
    init(messages: [Message], database: [Message] = []) {
        self.messages = messages
        self.database = database
        self.options = messages[0].options
    }
    
    func answerButtonTapped(_ option: Option) {
        userResponded(option)
    }
    
    private func userResponded(_ option: Option) {
        Task {
            do {
                try await Task.sleep(for: .seconds(0.3))
                if let newMessage = findMessage(key: option.key) {
                    messages.append(newMessage)
                
                    if let nextMessage = findMessage(key: newMessage.answerId) {
                        messages.append(nextMessage)
                        options = nextMessage.options
                    }
                }
            } catch {
                
            }
        }
    }
    
    private func findMessage(key id: String) -> Message? {
        database.first(where: { $0.id == id })
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
            
            HStack {
                ForEach(viewModel.options, id: \.self) { option in
                    Button {
                        viewModel.answerButtonTapped(option)
                    } label: {
                        Text(option.value)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
            }
            .background(Color.gray)
        }
    }
}

struct ChatbotView_Previews: PreviewProvider {
    static var previews: some View {
        ChatbotView(viewModel: .mock)
    }
}
