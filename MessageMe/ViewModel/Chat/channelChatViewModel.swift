//
//  channelChatViewModel.swift
//  MessageMe
//
//  Created by rabie houssaini on 13/7/2024.
//

import Foundation

class ChannelChatViewModel: ObservableObject{
    @Published var messages : [Message] = []
    let chatApi = ChatAPI()
    
    func createChannel(users:[String],name:String,completion: @escaping(Channel)->Void){
        chatApi.createChannel(users: users, name: name) { channel in
           completion(channel)
        }
    }
}
