//
//  SettingsCell.swift
//  MessageMe
//
//  Created by rabie houssaini on 8/7/2024.
//

import SwiftUI

struct SettingsCell: View {
    let vm: SettingsCellViewModel
    var body: some View {
        
            HStack{
                Image(systemName: vm.imageName)
                    .frame(width: 22,height: 22)
                    .padding(6)
                    .background(vm.backgroundColor)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                Text(vm.title)
                    .fontWeight(.medium)
                    Spacer()
                Image(systemName: "chevron.right")
            }
            .padding(.top)
            
         
          
        
   
        
        
    }
}

#Preview {
    SettingsCell(vm: SettingsCellViewModel(rawValue:  SettingsCellViewModel.account.rawValue)!)
}
