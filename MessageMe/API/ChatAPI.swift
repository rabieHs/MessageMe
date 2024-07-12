//
//  ChatAPI.swift
//  MessageMe
//
//  Created by rabie houssaini on 12/7/2024.
//

import Foundation
import Firebase

class ChatAPI {
  private  func createConversation(with user: User, currentUser: User,completion:@escaping(String)->Void?){
        let conversationId = UUID().uuidString
      let conversation = Conversation(id:conversationId ,messages: [], users: user.id+currentUser.id, isGroup: false)
    
        Firestore.firestore().collection("conversations").document(conversationId).setData(conversation.asDictionary()) { error in
            completion(conversationId)
            print("conversation Created Successfully")
        }
      
    }
    
    func sendMessage(with user: User, currentUser: User, messageText:String){
        let message = Message(id:UUID().uuidString,rcieverId: user.id, senderId: currentUser.id, read: false, timestamp: Timestamp(), text: messageText)
        Firestore.firestore().collection("conversations").whereField("users",in:[user.id+currentUser.id, currentUser.id+user.id]).getDocuments{ snapshot, error in
     
            if let error {
                print(error.localizedDescription)
                return
            }
  
       
            if let snapshot , !snapshot.isEmpty,    snapshot.documents.first != nil {
                
                 guard  let documentId = snapshot.documents.first?.documentID else{return}
               // Firestore.firestore().collection("conversations").document(documentId).setData(message.asDictionary())
                Firestore.firestore().collection("conversations").document(documentId).updateData(["messages":FieldValue.arrayUnion([message.asDictionary()])])
                print("message sent Successfully")
                return
            }else{
                print("no previous data found")
                self.createConversation(with: user, currentUser: currentUser) {conversationId in
                    Firestore.firestore().collection("conversations").document(conversationId).updateData(["messages":FieldValue.arrayUnion([message.asDictionary()])])
                   // Firestore.firestore().collection("conversations").document(conversationId).collection("messages").document().setData(message.asDictionary()){ error in
                        print("message sent Successfully")
                   
                    }
                 
                }
                
               
            }
           
            
            
        }
    
    func fetchMessages(with user: User, currentUser: User,completion: @escaping([Message])-> Void) {
        
        let query =  Firestore.firestore().collection("conversations").whereField("users",in:[user.id+currentUser.id, currentUser.id+user.id])
        
        
        
        query.addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges else{return}
            let  messages = changes.compactMap({try? $0.document.data(as: Conversation.self).messages})
            print(messages)
            if messages.isEmpty{
                print("stream data is emty")
                completion([])
            }else{
                print("stream data success")
                print(messages)
                completion(messages.first!)
                
            }
            
        }
        
        
    }
    
//    func fetchMessages(with user: User, currentUser: User,completion: @escaping([Message])-> Void) async{
//        
//        let query = try? await Firestore.firestore().collection("conversations").whereField("users",in:[user.id+currentUser.id, currentUser.id+user.id]).getDocuments()
//        let documentId = query?.documents.first?.documentID
//        
//        
//        if  documentId == nil{
//          
//     print("re-run")
//               self.createConversation(with: user, currentUser: currentUser) { _ in
//                   
//               }
//            completion([])
//     
//         
//        }
//            let streamQuery = Firestore.firestore().collection("conversations").document(documentId!).collection("messages")
//            
//            streamQuery.addSnapshotListener { snapshot, error in
//                guard let changes = snapshot?.documentChanges else{return}
//                let  messages = changes.compactMap({try? $0.document.data(as: Message.self)})
//                print(messages)
//                if messages.isEmpty{
//                    print("stream data is emty")
//                    completion([])
//                }else{
//                    print("stream data success")
//                    print(messages)
//                    completion(messages)
//                    
//                }
//                
//            }
//        
//        
//    }
}
