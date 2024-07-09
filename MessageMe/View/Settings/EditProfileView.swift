//
//  EditProfileView.swift
//  MessageMe
//
//  Created by rabie houssaini on 8/7/2024.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @State private var FullName = "Rabie Houssaini"
    @StateObject var vm = ProfileImageViewModel()


    var body: some View {
        
        
        VStack{
            Form{
                VStack{
                    Section{
                        HStack{
                            VStack{
                            
                                if vm.profileImage == nil {
                                    Image("profile")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 64,height: 64)
                                        .clipShape(Circle())
                                }else{
                                    Image(uiImage: vm.profileImage!)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 64,height: 64)
                                        .clipShape(Circle())
                                }
                                Button{
                                    
                                }label: {
                                    PhotosPicker( selection: $vm.selectedImage,matching: .images){
                                        
                                        Text("Edit")
       
                                    }.onChange(of: vm.selectedImage) { oldValue, newValue in
                                            Task{
                                             try  await vm.changePhoto()
                                            }
                                        
                                    }
                               
                                }
                            }.padding(.top)
                            Text("Enter Your Name Or Change Your Profile Photo ")
                                .foregroundStyle(.gray)
                                .padding([.bottom,.horizontal])
                            
                        }
                        Divider()
                        TextField("", text: $FullName)
                            .padding(8)
                    }
                    
                    
                }
                Section("Status", content: {
                    NavigationLink {
                        StatusSelectorView()
                    } label: {
                   
                            Text("At the Movies")
                                .foregroundStyle(.blue)
                      
                    }

                    
                }
                )
            }
          
        }
        .navigationTitle("Edit Profile")
     
        
    }
}

#Preview {
    EditProfileView()
}
