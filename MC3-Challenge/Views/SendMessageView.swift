import SwiftUI

struct SendMessageView: View {
    @ObservedObject var message: Message
    @State var selectedOption: Option = Option(key: "", value: "")
    var send: (Option) -> Void
    
    var body: some View {
        VStack {
            switch message.options.count {
            case 0: EmptyView()
            case 1:
                Button {
                    send(message.options[0])
                } label: {
                    Text(message.options[0].value)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .padding(12)
                
            default:
                VStack(spacing: 0.0) {
                    ForEach(message.options, id: \.self) { option in
                        Spacer()
                            .frame(maxWidth: .infinity, maxHeight: 0.3)
                            .background(Color.black)
                        Button {
                            selectedOption = option
                        } label: {
                            HStack {
                                Label(option.value, systemImage: selectedOption.value == option.value ? "circle.fill" : "circle")
                                    .font(.system(.headline))
                                Spacer()
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(10.0)
                        .background(Color.white)
                        .foregroundColor(.black)
                    }
                    
                    Spacer()
                        .frame(maxWidth: .infinity, maxHeight: 0.3)
                        .background(Color.black)
                    
                    Button {
                        send(selectedOption)
                    } label: {
                        Text("Send")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(12)
                }
            }
        }
    }
}
