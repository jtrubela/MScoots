//
//  FirebaseManager.swift
//  MScoots
//
//  Created by Justin Trubela on 3/2/23.
//


// Firebase Manager is the Link that is used to configure the app to the DB
//      Connects Firebase with:
//              Authentication - Registration, Log-in, Authentication of user
//              Firestore - store and sync users data in collections
//              Storage - object storage like images, videos, other user generated content

import Foundation
import Firebase
import FirebaseStorage
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore


class FirebaseManager: NSObject, ObservableObject {
    
    let auth: Auth
    let storage: Storage
    let firestore: Firestore
    
    //Create a static instance of this object to share with all classes and views
    static let shared = FirebaseManager()
    
    //Configure the application - connection to FirebaseApp
    override init() {
        FirebaseApp.configure()
        
        //be able to call these items as 
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()
        
        super.init()
    }
    
    
}


