//
//  CustomTextField.swift
//  MessageMe
//
//  Created by rabie houssaini on 7/7/2024.
//

import SwiftUI

struct CustomTextField: View {
    let isSecureField: Bool
    let imageName: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(spacing:20) {
            HStack{
                Image(systemName: imageName)
                    .foregroundStyle(Color(.darkGray))
                if isSecureField {
                    SecureField(placeholder, text: $text)
                        .textFieldStyle(.plain)
                } else{
                    TextField(placeholder, text: $text)
                        .textFieldStyle(.plain)
                }
            }
            Divider()
                .background(Color(.darkGray))
            
            
        }
    }
}
