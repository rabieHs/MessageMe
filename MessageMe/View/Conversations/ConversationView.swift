//
//  ConversationView.swift
//  MessageMe
//
//  Created by rabie houssaini on 7/7/2024.
//

import SwiftUI

struct ConversationView: View {
    @State var showNewMessageView = false
    @State var showChatView = false
    var body: some View {
        ZStack(alignment:.bottomTrailing){

                VStack{
                    List(0 ..< 3){conversation in
                        NavigationLink(destination: ChatsView()) {
                            ConversationCell()
                                   .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(.plain)
               
                }
                .sheet(isPresented:$showNewMessageView , content: {
               
                    NewMessageView(showNewMessageView: $showNewMessageView, showChatView: $showChatView)
                    
                      
                })
            Button{
                showNewMessageView = true
            }label: {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24,height: 24)
                    .padding()
                
            }.background(Color(.systemBlue))
                .foregroundStyle(.white)
                .clipShape(Circle())
                .padding()
        }
        .navigationDestination(isPresented: $showChatView) {
            ChatsView()
        }
            }
            
            
           
        
    
}

#Preview {
    ConversationView()
}
