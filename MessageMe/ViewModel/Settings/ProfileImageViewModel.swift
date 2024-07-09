//
//  ProfileImageViewModel.swift
//  MessageMe
//
//  Created by rabie houssaini on 9/7/2024.
//

import Foundation

import SwiftUI
import PhotosUI

class ProfileImageViewModel: ObservableObject{
    @Published var selectedImage: PhotosPickerItem?
    @Published var profileImage:UIImage?
    
    func changePhoto()async throws{
        guard let imageData = try await selectedImage?.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: imageData)else {return}
        profileImage = uiImage
    }
}
