//
//  ChatBubble.swift
//  MessageMe
//
//  Created by rabie houssaini on 9/7/2024.
//

import SwiftUI

struct ChatBubble: Shape {
    var isFromCurrentUSer:Bool
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight, isFromCurrentUSer ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        return Path(path.cgPath)
    }
    
  
}

#Preview {
    ChatBubble(isFromCurrentUSer: true)
}
