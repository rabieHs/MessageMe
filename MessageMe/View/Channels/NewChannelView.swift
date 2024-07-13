//
//  NewChannelView.swift
//  MessageMe
//
//  Created by rabie houssaini on 13/7/2024.
//

import Foundation
import SwiftUI




struct NewChannelView: View {
    @ObservedObject var vm = NewMessagesViewModel()
    @Binding var showNewChannelView : Bool
    @Binding var showChatView : Bool
    @Binding var createdChannel : Channel?
    @State var channelName:String = ""
    @ObservedObject var channelVM = ChannelChatViewModel()
    @State var selectedRows = Set<String>()

            
      var body: some View {
          NavigationView {
              
              VStack{
                  CustomTextField(isSecureField: false, imageName: "person", placeholder: "enter group name", text: $channelName).padding()
                  List(vm.users, selection: $selectedRows) { user in
                      UserCell(user: user)
                          .onTapGesture {
                              print(selectedRows.count)
                          }
                          
                  }.listStyle(.plain)
                      
                  if (!selectedRows.isEmpty && !channelName.isEmpty){
                      withAnimation(.easeIn) {
                          Button{
                              print(selectedRows.count)
                              channelVM.createChannel(users: selectedRows.sorted(), name: channelName){channel in
                                  createdChannel = channel
                                  showNewChannelView = false
                                  showChatView = true
                                  
                              }
         
                          }label: {
                              CustomButton(title: "Create")
          
                          }
                      }
                  }
              }.navigationBarItems(trailing: EditButton())
          
          }
      }
  
}

