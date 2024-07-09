//
//  UserCell.swift
//  MessageMe
//
//  Created by rabie houssaini on 9/7/2024.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        HStack{
            Image("profile")
                .resizable()
                .scaledToFill()
                .frame(width: 48,height: 48)
                .clipShape(Circle())
            
            VStack(alignment:.leading){
                Text("Rabie Houssaini")
                    .fontWeight(.semibold)
                Text("this is a static message from Developer ")
                    .lineLimit(1)
                    .foregroundStyle(Color(.systemGray))
                    
            }
          
        } .padding(.top,6)
            .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width,alignment: .leading)
       
    }
}

#Preview {
    ConversationCell()
}
