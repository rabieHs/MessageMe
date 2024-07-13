//
//  ChatAPI.swift
//  MessageMe
//
//  Created by rabie houssaini on 12/7/2024.
//

import Foundation
import Firebase

class ChatAPI {
    
    
  private  func createConversation(with user: User,completion:@escaping(String)->Void?){
      guard  let currentUid = AuthenticationViewModel.shared.userSession?.uid else{return}

        let conversationId = user.id+currentUid
      let conversation = Conversation(id:conversationId ,messages: [], users: [user.id,currentUid], isGroup: false)
    
        Firestore.firestore().collection("conversations").document(conversationId).setData(conversation.asDictionary()) { error in
            completion(conversationId)
        }
      
    }
    
    func sendMessage(with user: User, messageText:String){
        guard  let currentUid = AuthenticationViewModel.shared.userSession?.uid else{return}

        let message = Message(id:UUID().uuidString,fromId: currentUid, toId: user.id, read: false, timestamp: Timestamp(date: Date()), text: messageText)
        Firestore.firestore().collection("conversations").whereField("id",in:[user.id+currentUid, currentUid+user.id]).getDocuments{ snapshot, error in
     
            if let error {
                print(error.localizedDescription)
                return
            }
  
       
            if let snapshot , !snapshot.isEmpty,    snapshot.documents.first != nil {
                
                 guard  let documentId = snapshot.documents.first?.documentID else{return}
               // Firestore.firestore().collection("conversations").document(documentId).setData(message.asDictionary())
                Firestore.firestore().collection("conversations").document(documentId).updateData(["messages":FieldValue.arrayUnion([message.asDictionary()])])
                return
            }else{
                self.createConversation(with: user) {conversationId in
                    Firestore.firestore().collection("conversations").document(conversationId).updateData(["messages":FieldValue.arrayUnion([message.asDictionary()])])
                   // Firestore.firestore().collection("conversations").document(conversationId).collection("messages").document().setData(message.asDictionary()){ error in
                   
                    }
                 
                }
                
               
            }
           
            
            
        }
    
    func fetchConversations(completion: @escaping([Conversation])-> Void) {
        
        guard  let currentUid = AuthenticationViewModel.shared.userSession?.uid else{return}
        
        let query =  Firestore.firestore().collection("conversations").whereField("users", arrayContains :currentUid)
        
        query.addSnapshotListener { snapshot, error in
            guard let  snapshot, error == nil else {
                print("Error fetching conversations: \(error?.localizedDescription ?? "Unknown error")")
                completion([])
                return
            }
            var conversations = [Conversation]()

            for document in snapshot.documents {
                if var conversation = try?  document.data(as: Conversation.self){
                    let partnerId = conversation.users.first { $0 != currentUid}
                    AuthenticationViewModel.shared.fetchUser(by: partnerId!) { partner in
                        conversation.user = partner
                        conversations.append(conversation)
                        if conversations.count == snapshot.documents.count {
                            completion(conversations)
                        }
                    }
                    
                }
            }
            if snapshot.documents.isEmpty {
                completion([])
            }
        }
    }

    
    
    func fetchMessages(with user: User,completion: @escaping([Message])-> Void) {
        guard  let currentUid = AuthenticationViewModel.shared.userSession?.uid else{return}

        
            let query =  Firestore.firestore().collection("conversations").whereField("id",in:[user.id+currentUid, currentUid+user.id])
            
            query.addSnapshotListener { snapshot, error in
                guard let changes = snapshot?.documentChanges else{return}
                var  messages = changes.compactMap({try? $0.document.data(as: Conversation.self).messages})
                if messages.isEmpty{
                    print("stream data is emty")
                    completion([])
                }else{
                    guard let messages = messages.first else{return}
                    var chatMessages = messages
                    for (index,message) in chatMessages.enumerated() where message.fromId != currentUid {
                        chatMessages[index].user = user
                    }
                  
                    completion(chatMessages)
                    
                }
            }
        

        
    }  
    
    func createChannel(users: [String], name: String,completion: @escaping(Channel)->Void){
        let channelId = UUID().uuidString
        let channel = Channel(id:channelId, name: name, users: users, messages: [])
        Firestore.firestore().collection("channels").document(channelId).setData(channel.asDictionary()) { error in
            completion(channel)
        }
    }
    


}
