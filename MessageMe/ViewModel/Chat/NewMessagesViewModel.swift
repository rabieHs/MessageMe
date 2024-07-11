//
//  NewMessagesViewModel.swift
//  MessageMe
//
//  Created by rabie houssaini on 11/7/2024.
//

import Foundation
import Firebase
class NewMessagesViewModel: ObservableObject {
    
    @Published var users : [User] = []
    
    init() {
        self.fetchUsers()
    }
    
    
   func fetchUsers(){
       Firestore.firestore().collection("users").whereField("id", isNotEqualTo: Auth.auth().currentUser?.uid ?? "")
           .getDocuments { snapshot, error in
           guard let documents = snapshot?.documents else{return}
           self.users = documents.compactMap({try? $0.data(as: User.self)})
              
       }
    }
    
}
