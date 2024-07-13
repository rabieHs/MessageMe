//
//  ConversationView.swift
//  MessageMe
//
//  Created by rabie houssaini on 7/7/2024.
//

import SwiftUI

struct ChannelsView: View {
    @State var showNewChannelView = false
    @State var showChatView = false
    @State var createdChannel: Channel?
    
  @ObservedObject var vm = ConversationsViewModel()
    var body: some View {
        ZStack(alignment:.bottomTrailing){

                VStack{
                    List(vm.conversations){conversation in
                        
                     
                            ConversationCell(conversationViewModel: ConversationViewModel(conversation: conversation))
                                   .listRowSeparator(.hidden)
                                   .onTapGesture {
                                       //to change
                                       
                                       showChatView = true

                                   }
                        
                    }
                    .listStyle(.plain)
               
                }
                .sheet(isPresented:$showNewChannelView , content: {
               
                   NewChannelView(showNewChannelView: $showNewChannelView, showChatView: $showChatView, createdChannel: $createdChannel)
                    
                      
                })
            Button{
                showNewChannelView = true
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
            if  (createdChannel != nil) {
                ChannelChatView(channel: createdChannel!)
            }
        }
            }
            
            
           
        
    
}

#Preview {
    ConversationView()
}
