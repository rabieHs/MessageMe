//
//  ImageUploader.swift
//  MessageMe
//
//  Created by rabie houssaini on 10/7/2024.
//

import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage,completion: @escaping(String)->Void){
        guard let imageData = image.jpegData(compressionQuality: 0.5) else{
            return
        }
        let filename = UUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        ref.putData(imageData) { metaata, error in
            if let error = error {
                print("error uploading image")
                return
            }
            ref.downloadURL {  url, _ in
                guard let imageurl = url?.absoluteString else {
                    return
                }
                completion(imageurl)
            }
        }
        
       
    }
}
