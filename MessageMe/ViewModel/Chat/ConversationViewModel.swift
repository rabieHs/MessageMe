//
//  ConversationViewModel.swift
//  MessageMe
//
//  Created by rabie houssaini on 13/7/2024.
//

import Foundation
class ConversationViewModel{
    let conversation: Conversation
    var partner: User = User(id: "", username: "", fullname: "", email: "", profileImage: "")
    
    init(conversation: Conversation){
        self.conversation = conversation
//        fetchUser { user in
//            
//            self.partner = user
//        }
      
        
    }
    
    var currentUID:String{
        return AuthenticationViewModel.shared.userSession?.uid ?? ""
    }
    
//    func fetchUser(completion: @escaping(User)->Void) {
//         let userId =  conversation.users.first(where: { id in
//            return id  != currentUID
//        })
//         
//         AuthenticationViewModel.shared.fetchUser(by: userId!) { user in
//            
//         }
//      
//    }
    
    var userName: String{
        print(conversation.user?.fullname)
        return conversation.user?.fullname ?? ""
    }
    
    var userProfileImage: URL?{
        return URL(string: conversation.user?.profileImage ?? "")
    }
    
    var conversationLastMessage:String?{
        guard let lastMessage = conversation.messages.sorted { message1, message2 in
            return message1.timestamp.seconds > message2.timestamp.seconds
        }.first else{return nil}
        if lastMessage.fromId == currentUID {
            return "You: \(lastMessage.text)"
        }
        else{
            return lastMessage.text
        }
    }
}
