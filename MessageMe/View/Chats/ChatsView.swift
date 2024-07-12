//
//  ChatsView.swift
//  MessageMe
//
//  Created by rabie houssaini on 7/7/2024.
//

import SwiftUI

struct ChatsView: View {
    @State var messageText = ""
   private  let user: User
    @ObservedObject var vm : ChatViewModel
    init(user:User) {
        self.user = user
        vm = ChatViewModel(user: user)
    }
    var body: some View {
     

        VStack{
            ScrollView{
                VStack(alignment:.leading,spacing: 12){
                    ForEach(vm.messages) { message in
                        MessageView(viewModel: MessageViewModel(message: message))
                    }
                    
                }
            }
        }
        .navigationTitle(user.username)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.bottom)
        
        CustomInputView(text: $messageText) {
            vm.sendMessage( message: messageText)
        }
    }
}


