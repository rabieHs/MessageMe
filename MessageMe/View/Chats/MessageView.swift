//
//  MessageView.swift
//  MessageMe
//
//  Created by rabie houssaini on 9/7/2024.
//

import SwiftUI

struct MessageView: View {

    let viewModel: MessageViewModel
    
    var body: some View {
        HStack{
            if  viewModel.isFromCurrentUSer {
                Spacer()
                Text( viewModel.message.text)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundStyle(.white)
                    .clipShape(ChatBubble(isFromCurrentUSer: viewModel.isFromCurrentUSer))
                    .padding(.horizontal)
                    .padding(.leading,80)
                
            }else{
                HStack(alignment:.bottom){
                    Image("profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32,height: 32)
                        .clipShape(Circle())
                    
                    Text(viewModel.message.text)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .clipShape(ChatBubble(isFromCurrentUSer:  viewModel.isFromCurrentUSer))
                    
                    
                }
                .padding(.horizontal)
                .padding(.trailing,70)
                Spacer()
            }
        }
    }
}

