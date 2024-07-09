//
//  Message.swift
//  MessageMe
//
//  Created by rabie houssaini on 9/7/2024.
//

import Foundation
struct Message: Identifiable{
    var id = UUID()
    let isFromCurrentUser: Bool
    let messageText:String
}
