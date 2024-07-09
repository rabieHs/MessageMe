//
//  UserCell.swift
//  MessageMe
//
//  Created by rabie houssaini on 9/7/2024.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack{
            Image("profile")
                .resizable()
                .scaledToFill()
                .frame(width: 40,height: 40)
                .clipShape(Circle())
            
            VStack(alignment:.leading){
                Text("Rabie Houssaini")
                    .fontWeight(.semibold)
                Text("Available ")
                    .lineLimit(1)
                    .foregroundStyle(Color(.systemGray))
                    
            }
          
        } .padding(.top,6)
            .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width,alignment: .leading)
       
    
    }
}

#Preview {
    UserCell()
}
