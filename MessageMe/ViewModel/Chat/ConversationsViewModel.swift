//
//  ConversationsViewModel.swift
//  MessageMe
//
//  Created by rabie houssaini on 13/7/2024.
//


import Foundation
import SwiftUI
class ConversationsViewModel : ObservableObject{

    @Published var conversations : [Conversation] = []
    let chatApi = ChatAPI()
 
    init() {
        fetchConversations()
    }
    
    
    func fetchConversations(){
        chatApi.fetchConversations() { conversations in
            conversations.forEach { conversation in
                print("viewModel partner : \(conversation.user?.username)")
            }
            self.conversations = conversations
        }
    }
   
    
    
}
