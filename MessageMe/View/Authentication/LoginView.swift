//
//  LoginView.swift
//  MessageMe
//
//  Created by rabie houssaini on 7/7/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject private var vm: AuthenticationViewModel
    var body: some View {
       
        NavigationStack {
            VStack {
                    VStack(alignment:.leading){
                        HStack{
                            Spacer()
                        }
                        Text("Hello")
                            .font(.largeTitle)
                            .bold()
                        Text("Welcome Back")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.blue)
                        
                        VStack(spacing:20){
                            
                            CustomTextField(isSecureField:false,imageName: "envelope", placeholder: "Email", text: $email)
                            
                            CustomTextField(isSecureField:true,imageName: "lock", placeholder: "Password", text: $password)
                            
                        }
                        .padding([.top,.horizontal],32)
                        
                   
                    }.padding()
                    HStack{
                        Spacer()
                        NavigationLink {
                            Text("Reset password!")
                        } label: {
                            Text("Forget Password?")
                                .padding(.horizontal)
                                .padding(.top)
                                .foregroundStyle(.blue)
                        }

                    }
                    Button(action: {
                        vm.login(email: email, password: password)
                    }, label: {
                        CustomButton(title: "Login")
                    })
                    .shadow(color: .gray, radius: 10)
                   
                    
                    
                    Spacer()
                    
                    NavigationLink {
                        RegisterView()
                            .toolbar(.hidden)
                    } label: {
                        HStack(spacing:10) {
                            Text("Don't have an Account?")
                            .foregroundStyle(.blue)
                            Text("Register")
                            .foregroundStyle(.blue)
                            .bold()
                            
                        }
                    }
                    
            }
        }
          
            
          
        }
    }

#Preview {
    LoginView()
}




