import SwiftUI

class ChatbotViewModel: ObservableObject {
    @Published var messages: [Message]
    
    init(messages: [Message]) {
        self.messages = messages
    }
    
    func answerButtonTapped(_ index: Int) {
        messages.append(Message(content: "Answer", owner: .user))
        userResponded(index)
    }
    
    private func userResponded(_ index: Int) {
        Task {
            do {
                try await Task.sleep(for: .seconds(0.3))
                messages.append(.init(content: "Question 2", owner: .chatbot))
            } catch {
                
            }
        }
    }
}

extension ChatbotViewModel {
    static let mock: ChatbotViewModel = ChatbotViewModel(messages: [.long(), .short(), .short(owner: .user), .long()])
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
                Button {
                    viewModel.answerButtonTapped(0)
                } label: {
                    Text("Answer")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .padding()
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
