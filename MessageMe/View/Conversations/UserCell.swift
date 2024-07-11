//
//  UserCell.swift
//  MessageMe
//
//  Created by rabie houssaini on 9/7/2024.
//

import SwiftUI
import Kingfisher
struct UserCell: View {
    let user: User
    var body: some View {
        HStack{
            KFImage(URL(string:user.profileImage))
                .resizable()
                .scaledToFill()
                .frame(width: 40,height: 40)
                .clipShape(Circle())
            
            VStack(alignment:.leading){
                Text(user.username)
                    .fontWeight(.semibold)
                Text(user.fullname)
                    .lineLimit(1)
                    .foregroundStyle(Color(.systemGray))
                    
            }
          
        } .padding(.top,6)
            .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width,alignment: .leading)
       
    
    }
}


