//
//  StatusSelectorView.swift
//  MessageMe
//
//  Created by rabie houssaini on 9/7/2024.
//

import SwiftUI

struct StatusSelectorView: View {
    @StateObject var vm = StatusViewModel()
    var body: some View {
        Form{
          
                Section {
                    Text(vm.userStatus.statusText)
                } header: {
                    Text("CURRENT SET TO")
                }
            Section {
                List(Userstatus.allCases,id: \.self){status in
                    Button{
                        vm.updateStatus(status)
                    }label: {
                        Text(status.statusText)
                           
                    }
                    .foregroundStyle(.textBG)
                    
                }
                
            } header: {
                Text("SELECT YOUR STATUS")
            }
                
            

        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    StatusSelectorView()
}
