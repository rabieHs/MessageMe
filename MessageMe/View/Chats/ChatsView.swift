//
//  ChatsView.swift
//  MessageMe
//
//  Created by rabie houssaini on 7/7/2024.
//

import SwiftUI

struct ChatsView: View {
    @State var messageText = ""
    @ObservedObject var vm = ChatViewModel()
    var body: some View {
        VStack{
            ScrollView{
                VStack(alignment:.leading,spacing: 12){
                    ForEach(vm.messages) { message in
                        MessageView(isFromCurrentUser: message.isFromCurrentUser,messageText: message.messageText)
                    }
                    
                }
            }
        }
        .navigationTitle("Rabie")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.bottom)
        
        CustomInputView(text: $messageText) {
            vm.sendMessage(messageText)
        }
    }
}

#Preview {
    ChatsView()
}
