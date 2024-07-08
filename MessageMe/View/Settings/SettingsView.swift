//
//  SettingsView.swift
//  MessageMe
//
//  Created by rabie houssaini on 7/7/2024.
//

import SwiftUI

struct SettingsView: View {

    var body: some View {
        ZStack{
            Color(.systemGroupedBackground)
                .ignoresSafeArea(edges: .top)
                
                
            VStack(spacing:32){
              
                     
                SettingHeaderView()
                
                
           
                VStack(spacing:1){
                    ForEach(SettingsCellViewModel.allCases,id: \.self){vm  in
                        
                        SettingsCell(vm: vm)
                    }
                }
                    
                Button{
                    
                }label: {
                    Text("Logout")
                        .foregroundStyle(Color(.systemRed))
                        .frame(width: UIScreen.main.bounds.width,height: 50)
                        .background(.sectionBG)

                }
               
                    
            
                
                
                Spacer()
            }
        }
       
    }
}

#Preview {
    SettingsView()
}

