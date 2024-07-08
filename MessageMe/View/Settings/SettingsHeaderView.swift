//
//  SettingsHeaderView.swift
//  MessageMe
//
//  Created by rabie houssaini on 8/7/2024.
//

import SwiftUI

struct SettingHeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .scaledToFill()
                .frame(width: 64,height: 64)
                .clipShape(Circle())
                .padding(.leading)
            VStack(alignment:.leading,spacing:4){
                Text("Rabie Houssaini")
                    .fontWeight(.medium)
                Text("available")
                    .foregroundStyle(.gray)
                
            }
            Spacer()
        }
        .frame(height: 80)
        .background(Color(.sectionBG))
        .padding(.top)
    }
}

