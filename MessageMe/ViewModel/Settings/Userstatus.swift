//
//  StatusViewModel.swift
//  MessageMe
//
//  Created by rabie houssaini on 9/7/2024.
//

import Foundation

enum Userstatus: Int, CaseIterable{
    case Available
    case Busy
    case AtSchool
    case AtTheMovies
    case BatteryAboutToDie
    case inAMeeting
    case AtTheGym
    case Sleeping
    case UrgentCallsOnly
    
    var statusText: String {
        switch self {
        case .Available:
            return "Available"
        case .Busy:
            return "Busy"
        case .AtSchool:
            return "At School"
        case .AtTheMovies:
            return "At The Movies"
        case .BatteryAboutToDie:
            return "Battery About To Die"
        case .inAMeeting:
            return "in A Meeting"
        case .AtTheGym:
            return "At The gym"
        case .Sleeping:
            return "Sleeping"
        case .UrgentCallsOnly:
            return "urgent Calls Only"
        }
    }
}
