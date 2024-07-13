//
//  Message.swift
//  MessageMe
//
//  Created by rabie houssaini on 9/7/2024.
//

import Foundation
import Firebase
struct Message: Identifiable,Codable{
    var id : String?
    let fromId: String
    let toId: String
    let read : Bool
    let timestamp: Timestamp
    let text: String
    var user: User?
    
    
}
