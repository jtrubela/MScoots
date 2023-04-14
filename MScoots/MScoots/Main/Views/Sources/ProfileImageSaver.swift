//
//  ProfileImageSaver.swift
//  MScoots
//
//  Created by Justin Trubela on 3/21/23.
//

import UIKit
import SwiftUI



//Variables taken from Firebase_Authorization to get the necessary published variable data to use the ImageSaverClass and choose a profile photo

//ImageSaver
//@Published var image_: Image?
//@Published var shouldShowImagePicker = false
//@Published var image: UIImage?
//@Published var inputImage: UIImage?

class ImageSaver: NSObject {
    func writeToPhotosAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save Finished")
    }
    
    
    
    
    /*------------------------------------------------------------------------------------------------------------------------*/
    //
    //                          UI IMAGE PICKER FOR REGISTRATION VIEW
    //
    /*----------------------------------------------------------------*/
    
//    func loadImage() {
//        let model = Image("scooter")
//
//        guard let inputImage = model.inputImage else { return }
//        model.image_ = Image(uiImage: model.inputImage!)
        
//        UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil)
//    }
    
    
    
    /*--------------------------------------------------------*/
    //
    //User profile information
    //  Add Profile Image
    //  functions needed to access Firebase Cloud Store to save data
    //
    //
    //  Store the users selected image
    //
    /*------------------------------------------------------------------------------------------------------------------------*/
    /*------------------------------------------------------------------------------------------------------------------------*/
    struct ImagePicker: UIViewControllerRepresentable {
        
        @Binding var image: UIImage?
        
        private let controller = UIImagePickerController()
        
        func makeCoordinator() -> Coordinator {
            return Coordinator(parent: self)
        }
        
        class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
            
            let parent: ImagePicker
            
            init(parent: ImagePicker) {
                self.parent = parent
            }
            
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                parent.image = info[.originalImage] as? UIImage
                picker.dismiss(animated: true)
            }
            
            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                picker.dismiss(animated: true)
            }
            
        }
        
        func makeUIViewController(context: Context) -> some UIViewController {
            controller.delegate = context.coordinator
            return controller
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
        
    }
}
