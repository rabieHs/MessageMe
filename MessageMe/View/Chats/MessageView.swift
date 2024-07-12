//
//  MessageView.swift
//  MessageMe
//
//  Created by rabie houssaini on 9/7/2024.
//

import SwiftUI

struct MessageView: View {
    var isFromCurrentUser: Bool
    var messageText: String
    
    var body: some View {
        HStack{
            if isFromCurrentUser {
                Spacer()
                Text(messageText)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundStyle(.white)
                    .clipShape(ChatBubble(isFromCurrentUSer: isFromCurrentUser))
                    .padding(.horizontal)
                    .padding(.leading,80)
                
            }else{
                HStack(alignment:.bottom){
                    Image("profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32,height: 32)
                        .clipShape(Circle())
                    
                    Text(messageText)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .clipShape(ChatBubble(isFromCurrentUSer: isFromCurrentUser))
                    
                    
                }
                .padding(.horizontal)
                .padding(.trailing,70)
                Spacer()
            }
        }
    }
}

#Preview {
    MessageView(isFromCurrentUser: true,messageText: "")
}
