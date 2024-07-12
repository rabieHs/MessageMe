//
//  ChatAPI.swift
//  MessageMe
//
//  Created by rabie houssaini on 12/7/2024.
//

import Foundation
import Firebase

class ChatAPI {
    
    
    func sendMessage(_ messageText:String, user: User){
        guard let currentUid = AuthenticationViewModel.shared.userSession?.uid else{return}
        let chatPartnerId = user.id
        
        // create ref
        let currentUserRef = Firestore.firestore().collection("messages").document(currentUid).collection(chatPartnerId).document()
        let chatPartnerRef = Firestore.firestore().collection("messages").document(chatPartnerId).collection(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let message = Message(id:messageId, fromId: currentUid, toId: chatPartnerId, read: false, timestamp: Timestamp(date: Date()), text: messageText)
        // send messages
        currentUserRef.setData(message.asDictionary())
        chatPartnerRef.document(messageId).setData(message.asDictionary())
        
    }
    
    func fetchMessages(with user:User, completion : @escaping([Message])->Void){
        guard let currentUid = AuthenticationViewModel.shared.userSession?.uid else{return}
        let chatPartnerId = user.id
        let query = Firestore.firestore().collection("messages").document(currentUid).collection(chatPartnerId)
       query.getDocuments { snapshot, error in
           guard let documents = snapshot?.documents else{return}
           let messages = documents.compactMap({try? $0.data(as: Message.self)})
           completion(messages)
        }
        
    }
    
    
    
//  private  func createConversation(with user: User, currentUser: User,completion:@escaping(String)->Void?){
//        let conversationId = user.id+currentUser.id
//      let conversation = Conversation(id:conversationId ,messages: [], users: [user.id,currentUser.id], isGroup: false)
//    
//        Firestore.firestore().collection("conversations").document(conversationId).setData(conversation.asDictionary()) { error in
//            completion(conversationId)
//            print("conversation Created Successfully")
//        }
//      
//    }
//    
//    func sendMessage(with user: User, currentUser: User, messageText:String){
//        let message = Message(id:UUID().uuidString,rcieverId: user.id, senderId: currentUser.id, read: false, timestamp: Timestamp(), text: messageText)
//        Firestore.firestore().collection("conversations").whereField("id",in:[user.id+currentUser.id, currentUser.id+user.id]).getDocuments{ snapshot, error in
//     
//            if let error {
//                print(error.localizedDescription)
//                return
//            }
//  
//       
//            if let snapshot , !snapshot.isEmpty,    snapshot.documents.first != nil {
//                
//                 guard  let documentId = snapshot.documents.first?.documentID else{return}
//               // Firestore.firestore().collection("conversations").document(documentId).setData(message.asDictionary())
//                Firestore.firestore().collection("conversations").document(documentId).updateData(["messages":FieldValue.arrayUnion([message.asDictionary()])])
//                print("message sent Successfully")
//                return
//            }else{
//                print("no previous data found")
//                self.createConversation(with: user, currentUser: currentUser) {conversationId in
//                    Firestore.firestore().collection("conversations").document(conversationId).updateData(["messages":FieldValue.arrayUnion([message.asDictionary()])])
//                   // Firestore.firestore().collection("conversations").document(conversationId).collection("messages").document().setData(message.asDictionary()){ error in
//                        print("message sent Successfully")
//                   
//                    }
//                 
//                }
//                
//               
//            }
//           
//            
//            
//        }
//    
//    func fetchConversations(with user: User,completion: @escaping([Conversation])-> Void) {
//        
//        let query =  Firestore.firestore().collection("conversations").whereField("users", arrayContainsAny :[ user.id])
//        
//        query.addSnapshotListener { snapshot, error in
//            print(snapshot?.documents)
//            guard let changes = snapshot?.documentChanges else {return}
//            let  conversations =  changes.compactMap({try? $0.document.data(as: Conversation.self)})
//            print(conversations)
//            if  conversations.isEmpty {
//                print("stream data is emty")
//                completion([])
//            }else{
//                print("stream data success")
//                print(conversations)
//                completion(conversations)
//                
//            }
//        }
//        
//    }
//    
//    func fetchMessages(with user: User,with id: String?, currentUser: User,completion: @escaping([Message])-> Void) {
//        
//        if let id {
//            Firestore.firestore().collection("conversations").document(id).addSnapshotListener { snapshot, error in
//                guard let  messages = try? snapshot?.data(as: Conversation.self).messages else{return}
//                if messages.isEmpty {
//                    completion([])
//                }else{
//                    completion(messages)
//                }
//
//             }
//        }else{
//            let query =  Firestore.firestore().collection("conversations").whereField("id",in:[user.id+currentUser.id, currentUser.id+user.id])
//            
//            query.addSnapshotListener { snapshot, error in
//                guard let changes = snapshot?.documentChanges else{return}
//                let  messages = changes.compactMap({try? $0.document.data(as: Conversation.self).messages})
//                print(messages)
//                if messages.isEmpty{
//                    print("stream data is emty")
//                    completion([])
//                }else{
//                    print("stream data success")
//                    print(messages)
//                    completion(messages.first!)
//                    
//                }
//            }
//        }
//
//        
//    }  
//    

    
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
