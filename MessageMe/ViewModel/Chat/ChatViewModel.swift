//
//  ChatViewModel.swift
//  MessageMe
//
//  Created by rabie houssaini on 9/7/2024.
//

import Foundation

class ChatViewModel : ObservableObject{
    @Published var messages : [Message] = []
    @Published var conversations : [Conversation] = []
    let chatApi = ChatAPI()
    let user:User
    init(user:User) {
        self.user = user
        fetchMessages()
    }

    func fetchMessages(){
        chatApi.fetchMessages(with: user) { messages in
            self.messages = messages
        }
    }
    
    func sendMessage( message:String ){
        chatApi.sendMessage(message, user: user)
    }
    
    
}
