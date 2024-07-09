//
//  CustomInputView.swift
//  MessageMe
//
//  Created by rabie houssaini on 9/7/2024.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var text:String 
    var action:()-> Void
    var body: some View {
        VStack{
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.separator)
            HStack{
                TextField("Message ...", text: $text)
                    .font(.body)
                    .frame(minHeight: 40)
                Button(action:action) {
                    Text("Send")
                        .bold()
                }
            }
            .padding(.bottom,8)
            .padding(.horizontal)
        }
    }
}

#Preview {
    CustomInputView(text: .constant("")) {
        
    }
}
