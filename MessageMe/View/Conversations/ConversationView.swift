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
    @State var selectedUser: User?
  @ObservedObject var vm = ConversationsViewModel()
    var body: some View {
        ZStack(alignment:.bottomTrailing){

                VStack{
                    List(vm.conversations){conversation in
                        
                     
                            ConversationCell(conversationViewModel: ConversationViewModel(conversation: conversation))
                                   .listRowSeparator(.hidden)
                                   .onTapGesture {
                                       selectedUser = conversation.user
                                       showChatView = true

                                   }
                        
                    }
                    .listStyle(.plain)
               
                }
                .sheet(isPresented:$showNewMessageView , content: {
               
                    NewMessageView(showNewMessageView: $showNewMessageView, showChatView: $showChatView,user: $selectedUser)
                    
                      
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
            if let selectedUser {
                ChatsView(user: selectedUser)
            }
        }
            }
            
            
           
        
    
}

#Preview {
    ConversationView()
}
