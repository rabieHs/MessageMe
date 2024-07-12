//
//  Conversation.swift
//  MessageMe
//
//  Created by rabie houssaini on 12/7/2024.
//

import Foundation
struct Conversation: Codable, Identifiable {
    let id: String?
    let messages: [Message]
    let users: [String]
    let isGroup: Bool
    
}
