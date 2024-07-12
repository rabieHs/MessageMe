//
//  MessageViewModel.swift
//  MessageMe
//
//  Created by rabie houssaini on 12/7/2024.
//

import Foundation
struct MessageViewModel {
    let message:Message
    
    var currentUID:String{
        return AuthenticationViewModel.shared.userSession?.uid ?? ""
    }
    var isFromCurrentUSer: Bool {
        return message.fromId == currentUID
    }
    
    
}
