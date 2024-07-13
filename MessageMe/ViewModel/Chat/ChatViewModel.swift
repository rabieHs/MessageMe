//
//  ChatViewModel.swift
//  MessageMe
//
//  Created by rabie houssaini on 9/7/2024.
//

import Foundation

class ChatViewModel : ObservableObject{
    @Published var messages : [Message] = []
    let chatApi = ChatAPI()
    let user:User

    init(user:User) {
        self.user = user
        fetchMessages()
    }

//    func fetchMessages(){
//        chatApi.fetchMessages(with: user) { messages in
//            self.messages.append(contentsOf: messages)
//        }
//    }
//    
//    func sendMessage( message:String ){
//        chatApi.sendMessage(message, user: user)
//    }
    
    
 
    
        func fetchMessages(){
            chatApi.fetchMessages(with: user) { messages in
                self.messages = messages
            }
        }
    
        func sendMessage( message:String ){
            chatApi.sendMessage(with: user, messageText: message)
        }
    
    
}
