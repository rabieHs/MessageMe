//
//  MessageMeApp.swift
//  MessageMe
//
//  Created by rabie houssaini on 7/7/2024.
//

import SwiftUI

@main
struct MessageMeApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack{
               MainTabView()
            }
        }
    }
}
