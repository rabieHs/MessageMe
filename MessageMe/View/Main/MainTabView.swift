//
//  MainTabView.swift
//  MessageMe
//
//  Created by rabie houssaini on 7/7/2024.
//

import SwiftUI

struct MainTabView: View {
    @State var selectedIndex = 0
    var body: some View {
        NavigationStack{
            TabView(selection: $selectedIndex){
                ConversationView()
                
                    .tabItem {
                        Image(systemName: "bubble.left")
                            .onTapGesture {
                                selectedIndex = 0
                            }
                    }
                    .tag(0)
                
                ChannelsView()
                 
                    .tabItem {
                        
                        Image(systemName: "bubble.left.and.bubble.right")
                            .onTapGesture {
                                selectedIndex = 1
                            }
                    }
                    .tag(1)
                
                SettingsView()
                   
                    .tabItem {
                        Image(systemName: "gear")
                            .onTapGesture {
                   

                                selectedIndex = 2
                            } .background(.white )
                    }
                   
                   
                
            }
            
            .navigationTitle(tabTitle)
        }
        
      
    }
    
    var tabTitle:String{
        switch selectedIndex {
        case 0:
            return "Chats"
        case 1:
            return "Channels"
        case 2:
            return "Settings"
        default:
            return ""
        }
    }
}

#Preview {
    MainTabView()
}
