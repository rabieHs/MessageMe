//
//  ChatViewModel.swift
//  MessageMe
//
//  Created by rabie houssaini on 9/7/2024.
//

import Foundation

class ChatViewModel : ObservableObject{
    @Published var messages =  [MockMessage]()
    
    init() {
        messages = mockMessages
    }
    
    var mockMessages: [MockMessage] {
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
        messages.append(MockMessage(isFromCurrentUser: true, messageText: messageText))
    }
}
