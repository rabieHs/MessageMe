//
//  ChatsView.swift
//  MessageMe
//
//  Created by rabie houssaini on 7/7/2024.
//

import SwiftUI
import Firebase
struct ChannelChatView: View {
    @State var messageText = ""
    var channel : Channel
    
    
    init(channel : Channel) {
        self.channel = channel
    }
    var body: some View {
     

        VStack{
            ScrollView{
                VStack(alignment:.leading,spacing: 12){
                    ForEach(0 ..< 3 ) { message in
                        MessageView(viewModel: MessageViewModel(message: Message(fromId: "", toId: "", read: false, timestamp: Timestamp(date: Date()), text: "")))
                    }
                    
                }
            }
        }
        .navigationTitle(channel.name)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.bottom)
        
        CustomInputView(text: $messageText) {
           
        }
    }
}


