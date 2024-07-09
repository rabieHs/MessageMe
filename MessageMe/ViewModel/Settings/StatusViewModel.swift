//
//  StatusViewModel.swift
//  MessageMe
//
//  Created by rabie houssaini on 9/7/2024.
//

import Foundation

class StatusViewModel : ObservableObject{
    @Published var userStatus: Userstatus = .Available
    
    func updateStatus(_ status: Userstatus){
        userStatus = status
    }
}
