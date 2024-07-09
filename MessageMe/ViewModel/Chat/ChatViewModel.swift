//
//  ChatViewModel.swift
//  MessageMe
//
//  Created by rabie houssaini on 9/7/2024.
//

import Foundation

class ChatViewModel : ObservableObject{
    @Published var messages =  [Message]()
    
    init() {
        messages = mockMessages
    }
    
    var mockMessages: [Message] {
        [
            .init(isFromCurrentUser: true, messageText: "hey"),
            .init(isFromCurrentUser: false, messageText: "how are you"),
            .init(isFromCurrentUser: true, messageText: "im fine"),
            .init(isFromCurrentUser: true, messageText: "and you"),
            .init(isFromCurrentUser: false, messageText: "im fine too"),
            .init(isFromCurrentUser: true, messageText: "we need an urgent meeting"),
            .init(isFromCurrentUser: false, messageText: "ok right now i will sent you link"),
        ]
    }
    
    func sendMessage(_ messageText:String){
        messages.append(Message(isFromCurrentUser: true, messageText: messageText))
    }
}
