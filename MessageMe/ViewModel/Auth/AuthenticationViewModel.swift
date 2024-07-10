//
//  AuthenticationViewModel.swift
//  MessageMe
//
//  Created by rabie houssaini on 10/7/2024.
//

import Firebase

class AuthenticationViewModel: NSObject, ObservableObject{
    @Published var isSignedUp = false
    private var currentUser: FirebaseAuth.User?
    
    func login(){
        
    }
    
    func register(email:String, password:String,fullname: String,username:String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("error registering user from auth")
                return
            }
            
            print("success register from auth")
            
            guard let user = result?.user else{return}
            
            let userModel = User(id: user.uid, username: username, fullname: fullname, email: email,profileImage: "https://api.dicebear.com/5.x/initials/png?seed=\(fullname)")
            
            Firestore.firestore().collection("users").document(userModel.id).setData(userModel.asDictionary()) { error in
                print("user data successfully updated")
                self.currentUser = user
                self.isSignedUp = true
              
            }
            
            
        }
    }
    
    func uploadProfileImage(_ image: UIImage){
        guard let uid = currentUser?.uid else{return}
        ImageUploader.uploadImage(image: image) { imageURL in
            Firestore.firestore().collection("users").document(uid).updateData(["profileImage": imageURL])
        }
    }
    
    func signout(){
        
    }
}
