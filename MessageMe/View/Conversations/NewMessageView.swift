//
//  NewMessageView.swift
//  MessageMe
//
//  Created by rabie houssaini on 9/7/2024.
//

import SwiftUI

struct NewMessageView: View {
    @ObservedObject var vm = NewMessagesViewModel()
    @Binding var showNewMessageView : Bool
    @Binding var showChatView : Bool
    @Binding var user: User?
    var body: some View {
        NavigationStack{
            VStack{
                List(vm.users){user in
                 UserCell(user: user)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            print("user taped")
                            showNewMessageView = false
                            showChatView = true
                            self.user = user
                        }
                }
                .listStyle(.plain)
            }.searchable(text: .constant(""))
                .navigationTitle("New Message")
        }
    }
}

