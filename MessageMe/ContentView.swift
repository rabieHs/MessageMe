//
//  ContentView.swift
//  MessageMe
//
//  Created by rabie houssaini on 7/7/2024.
//

import SwiftUI
import Firebase
struct ContentView: View {
    

    @EnvironmentObject var authViewModel : AuthenticationViewModel

    var body: some View {
        Group{
            if authViewModel.userSession == nil {
                LoginView()
                
            }else{
                
                MainTabView()
            }
        }
    }
}

#Preview {
    ContentView()
}
