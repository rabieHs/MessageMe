//
//  NewMessageView.swift
//  MessageMe
//
//  Created by rabie houssaini on 9/7/2024.
//

import SwiftUI

struct NewMessageView: View {
    @Binding var showNewMessageView : Bool
    @Binding var showChatView : Bool
    var body: some View {
        NavigationStack{
            VStack{
                List(0 ..< 3){conversation in
                 UserCell()
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            print("user taped")
                            showNewMessageView = false
                            showChatView = true
                        }
                }
                .listStyle(.plain)
            }.searchable(text: .constant(""))
                .navigationTitle("New Message")
        }
    }
}

