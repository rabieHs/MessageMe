//
//  CustomButton.swift
//  MessageMe
//
//  Created by rabie houssaini on 7/7/2024.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundStyle(.white)
            .frame(width: 340,height: 50)
            .background(.blue)
            .clipShape(Capsule())
            .padding()
    }
}
