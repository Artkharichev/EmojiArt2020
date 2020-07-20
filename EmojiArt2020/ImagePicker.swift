//
//  ImagePicker.swift
//  EmojiArt2020
//
//  Created by Артём Харичев on 20.07.2020.
//  Copyright © 2020 Artem Kharichev. All rights reserved.
//

import SwiftUI
import UIKit

typealias PickedImageHandler = (UIImage?) -> Void

struct ImagePicker: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType
    
    var handelPickedImage: PickedImageHandler
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(handelPickedImage: handelPickedImage)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var handelPickedImage: PickedImageHandler
        
        init(handelPickedImage: @escaping PickedImageHandler) {
            self.handelPickedImage = handelPickedImage
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            handelPickedImage(info[.originalImage] as? UIImage)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            handelPickedImage(nil )
        }
    }
}
