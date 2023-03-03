import SwiftUI

struct ChatbotView: View {
    @ObservedObject var viewModel: ChatbotViewModel
    
    init(viewModel: ChatbotViewModel) {
        self.viewModel = viewModel
    }
    
    let greeting: LocalizedStringKey = "greeting"
    
    var body: some View {
        VStack {
            Text(greeting)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.indigo)
            
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
            .background(.gray.opacity(0.07))

//            .background(Color.init(uiColor: .systemGray5))
        }
    }
}

struct ChatbotView_Previews: PreviewProvider {
    static var previews: some View {
        ChatbotView(viewModel: .mock)
    }
}
