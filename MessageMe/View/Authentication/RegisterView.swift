//
//  RegisterView.swift
//  MessageMe
//
//  Created by rabie houssaini on 7/7/2024.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var fullname = ""
    @EnvironmentObject private var vm: AuthenticationViewModel

    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            VStack(alignment:.leading){
                HStack{
                    Spacer()
                }
                Text("Get Started")
                    .font(.largeTitle)
                    .bold()
                Text("Create Your Account")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.blue)
                
                VStack(spacing:20){
                    
                    CustomTextField(isSecureField:false,imageName: "envelope", placeholder: "Email", text: $email)
                    
                    CustomTextField(isSecureField:false,imageName: "person", placeholder: "Username", text: $username)
                    
                    CustomTextField(isSecureField:false,imageName: "person", placeholder: "Full Name", text: $fullname)
                    
                    CustomTextField(isSecureField:true,imageName: "lock", placeholder: "Password", text: $password)
                    
                }
                .padding([.top,.horizontal],32)
                
           
            }.padding()
            
            Button(action: {
                vm.register(email: email, password: password, fullname: fullname, username: username) 
            }, label: {
                CustomButton(title: "Register")
            })
            .shadow(color: .gray, radius: 10)
            Spacer()
            Button {
                dismiss()

            } label: {
                HStack(spacing:10) {
                    Text("Already have an Account?")
                    .foregroundStyle(.blue)
                    Text("Sign In")
                    .foregroundStyle(.blue)
                    .bold()
                    
                }
            }

        }
      
    }
}

#Preview {
    RegisterView()
}
