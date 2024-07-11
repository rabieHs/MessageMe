//
//  SettingsHeaderView.swift
//  MessageMe
//
//  Created by rabie houssaini on 8/7/2024.
//

import SwiftUI
import Kingfisher
struct SettingHeaderView: View {
    let user: User
    var body: some View {
        HStack {
          
            KFImage(URL(string: user.profileImage))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64,height: 64)
                    .clipShape(Circle())
                    .padding(.leading)
          
          
            VStack(alignment:.leading,spacing:4){
                Text(user.username)
                    .fontWeight(.medium)
                    .foregroundStyle(.textBG)
                Text("available")
                    .foregroundStyle(.gray)
                
            }
            Spacer()
        }
        .frame(height: 80)
      
        .padding(.top)
    }
}

