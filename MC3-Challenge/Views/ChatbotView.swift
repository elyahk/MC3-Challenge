import SwiftUI

enum Erors: Error {
    case NoMessageError(for: String)
}

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
        options = nextMessage.options
    }
    
    private func findMessage(key id: String) throws -> Message {
        let message = database.first(where: { $0.id == id })
        guard let message = message else { throw Erors.NoMessageError(for: id) }
        
        return message
    }
}

struct ChatbotView: View {
    @ObservedObject var viewModel: ChatbotViewModel
    @State var selectedValue: String = ""
    
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
            
            VStack(spacing: 0.3) {
                ForEach(viewModel.options, id: \.self) { option in
                    Button {
                        selectedValue = option.value
                    } label: {
                        HStack {
                            Label(option.value, systemImage: selectedValue == option.value ? "circle.fill" : "circle")
                                .font(.system(.headline))
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(10.0)
                    .background(Color.red)
                    .foregroundColor(.white)
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
