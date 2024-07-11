//
//  SettingsView.swift
//  MessageMe
//
//  Created by rabie houssaini on 7/7/2024.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var authViewModel : AuthenticationViewModel
    
 
    var body: some View {
        Form{
         

                     
                Section{
                    NavigationLink(destination: EditProfileView(user: authViewModel.user!)) {
                        SettingHeaderView(user: authViewModel.user!)
                    }
                    
                    
                }
                
 
                Section{
                    
                        List(SettingsCellViewModel.allCases,id: \.self){vm  in
                            
                            SettingsCell(vm: vm)
                        
                    }
                       
                }
                    
                Section{
                    Button{
                        authViewModel.signout()
                    }label: {
                        Text("Logout")
                            .foregroundStyle(Color(.systemRed))
                            .frame(width: UIScreen.main.bounds.width)
                          

                    }
                }
             
            }
        }
       
    
}

#Preview {
    SettingsView()
}

