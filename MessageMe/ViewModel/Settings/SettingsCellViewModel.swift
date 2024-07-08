//
//  SettingsCellViewModel.swift
//  MessageMe
//
//  Created by rabie houssaini on 8/7/2024.
//

import SwiftUI

enum SettingsCellViewModel: Int,CaseIterable {
    case account
    case notification
    case starredMessages
    
    var title:String{
        switch self {
        case .account:
            return "Account"
        case .notification:
            return "Notifications"
        case .starredMessages:
            return "Starred Messages"
        }
    }
    
    var imageName:String{
        switch self {
        case .account:
            return "key.fill"
        case .notification:
            return "bell.badge.fill"
        case .starredMessages:
            return "star.fill"
        }
    }

    var backgroundColor:Color{
        switch self {
        case .account:
            return .blue
        case .notification:
            return .red
        case .starredMessages:
            return .yellow
        }
    }

    
}
