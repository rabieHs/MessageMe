//
//  AuthenticationViewModel.swift
//  MessageMe
//
//  Created by rabie houssaini on 10/7/2024.
//

import Firebase
import FirebaseFirestoreSwift
class AuthenticationViewModel: NSObject, ObservableObject{

    @Published var userSession : FirebaseAuth.User?
    @Published var user: User?
    
    override init() {
        super.init()

         userSession = Auth.auth().currentUser
        if userSession != nil {
            self.fetchUser()
        }
    }
    
    func login(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let _ = error {return}
            guard let user = result?.user else {return}
            self.userSession = user
            self.fetchUser()

        }
    }
    
    func register(email:String, password:String,fullname: String,username:String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let _ = error {
                print("error registering user from auth")
                return
            }
            
            print("success register from auth")
            
            guard let user = result?.user else{return}
            
            let userModel = User(id: user.uid, username: username, fullname: fullname, email: email,profileImage: "https://api.dicebear.com/5.x/initials/png?seed=\(fullname)")
            
            Firestore.firestore().collection("users").document(userModel.id).setData(userModel.asDictionary()) { error in
                print("user data successfully updated")
                self.userSession = user
                self.fetchUser()
              
            }
            
            
        }
    }
    
   
    
    func signout(){
        try? Auth.auth().signOut()
        userSession = nil
    }
    
    func fetchUser(){
        guard let uid = userSession?.uid else {return}
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
            
           // guard let data = snapshot?.data() else {return}
            guard  let userModel = try? snapshot?.data(as: User.self) else{
                print("error converting user")
                return }
            self.user = userModel
            print(userModel.username)
        }
    }
}
