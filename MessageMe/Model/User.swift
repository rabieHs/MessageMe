//
//  User.swift
//  MessageMe
//
//  Created by rabie houssaini on 10/7/2024.
//

import Foundation
struct User : Codable, Identifiable,Hashable{
    let id: String
    let username: String
    let fullname:String
    let email: String
    let profileImage :String
}
