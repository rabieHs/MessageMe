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
  
    func  getMessages(for user:User,currentUser: User) {
         chatApi.fetchMessages(with: user, currentUser: currentUser){ messages in
            print("view model messages: \(messages)")
   
                self.messages = messages
            
           
        }
    }
    
    func sendMessage(for user:User,currentUser: User, message:String ){
        chatApi.sendMessage(with: user, currentUser: currentUser, messageText: message)
    }
    
    
}
