//
//  ProfileImageSaver.swift
//  MScoots
//
//  Created by Justin Trubela on 3/21/23.
//

import UIKit

class ImageSaver: NSObject {
    func writeToPhotosAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save Finished")
    }
}
