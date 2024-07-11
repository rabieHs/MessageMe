//
//  MessageMeApp.swift
//  MessageMe
//
//  Created by rabie houssaini on 7/7/2024.
//

import SwiftUI
import FirebaseCore



@main
struct MessageMeApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
         ContentView()
                .environmentObject(AuthenticationViewModel())
            
            
        }
    }
}
