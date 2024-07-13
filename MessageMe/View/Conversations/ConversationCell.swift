//
//  UserCell.swift
//  MessageMe
//
//  Created by rabie houssaini on 9/7/2024.
//

import SwiftUI
import Kingfisher
struct ConversationCell: View {
    let conversationViewModel : ConversationViewModel
    var body: some View {
        HStack{
            KFImage(conversationViewModel.userProfileImage)
                .resizable()
                .scaledToFill()
                .frame(width: 48,height: 48)
                .clipShape(Circle())
            
            VStack(alignment:.leading){
                Text(conversationViewModel.conversation.user?.username ?? "null")
                    .fontWeight(.semibold)
                Text(conversationViewModel.conversationLastMessage ?? "null")
                    .lineLimit(1)
                    .foregroundStyle(Color(.systemGray))
                    
            }
          
        } .padding(.top,6)
            .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width,alignment: .leading)
       
    }
}


