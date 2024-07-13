//
//  Channel.swift
//  MessageMe
//
//  Created by rabie houssaini on 13/7/2024.
//

import Foundation

struct Channel: Identifiable, Codable{
    let id: String
    let name: String
    let users: [String]
    let messages:[Message]
}
