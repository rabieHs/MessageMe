//
//  SettingsView.swift
//  MessageMe
//
//  Created by rabie houssaini on 7/7/2024.
//

import SwiftUI

struct SettingsView: View {

    var body: some View {
        Form{
         

                     
                Section{
                    NavigationLink(destination: EditProfileView()) {
                        SettingHeaderView()
                    }
                    
                    
                }
                
 
                Section{
                    
                        List(SettingsCellViewModel.allCases,id: \.self){vm  in
                            
                            SettingsCell(vm: vm)
                        
                    }
                       
                }
                    
                Section{
                    Button{
                        
                    }label: {
                        Text("Logout")
                            .foregroundStyle(Color(.systemRed))
                            .frame(width: UIScreen.main.bounds.width)
                            .background(.sectionBG)

                    }
                }
             
            }
        }
       
    
}

#Preview {
    SettingsView()
}

