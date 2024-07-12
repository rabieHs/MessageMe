//
//  ChatsView.swift
//  MessageMe
//
//  Created by rabie houssaini on 7/7/2024.
//

import SwiftUI

struct ChatsView: View {
    @State var messageText = ""
    @ObservedObject var vm = ChatViewModel()
    @EnvironmentObject var authViewModel : AuthenticationViewModel
   private  let user: User
    init(user:User) {
        self.user = user
    }
    var body: some View {
        VStack{
            ScrollView{
                VStack(alignment:.leading,spacing: 12){
                    ForEach(vm.messages) { message in
                        MessageView(isFromCurrentUser: message.senderId != user.id,messageText: message.text)
                    }
                    
                }
            }
        }.task{
          await  vm.getMessages(for: authViewModel.user!, currentUser: user)
        }
        .navigationTitle(user.username)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.bottom)
        
        CustomInputView(text: $messageText) {
            vm.sendMessage(for: user, currentUser: authViewModel.user!, message: messageText)
        }
    }
}


