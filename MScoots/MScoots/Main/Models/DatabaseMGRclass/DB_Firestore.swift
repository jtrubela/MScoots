//
//  ViewModel.swift
//  crud-demo
//
//  Created by Justin Trubela on 2/19/23.
//

import Foundation
import Firebase




// call in ViewModelClass
//     @State var user = studentUser(id: "", CWID: "", Email: "", first_name: "", last_name: "", Password: "")


//studentUserClass
class studentUser: Identifiable {
    
    var id: String
    var CWID: String
    var Email: String
    var first_name: String
    var last_name: String
    var Password: String

    init(id: String, CWID: String, Email: String, first_name: String, last_name: String, Password: String) {
        self.id = id
        self.CWID = CWID
        self.Email = Email
        self.first_name = first_name
        self.last_name = last_name
        self.Password = Password
    }
    

}







//
//      OLD CRUD STUFF I INPUT FOR A CUSTOM BUILT CLASS
//ViewModelCLASS
class ViewModel: ObservableObject {
    
    @Published var list = [studentUser]()
    
    func updateData(studentUserToUpdate:studentUser) {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Set the data to update
        db.collection("studentUser").document(studentUserToUpdate.id).setData(["Email":"Updated: \(studentUserToUpdate.CWID)"], merge: true) { error in
            
            // Check for errors
            if error == nil {
                // Get the new data
                self.getData()
            }
        }
    }
    
    func deleteData(studentUserToDelete:studentUser) {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Specify the document to delete
        db.collection("studentUser").document(studentUserToDelete.id).delete { error in
            
            // Check for errors
            if error == nil {
                // No errors
                
                // Update the UI from the main thread
                DispatchQueue.main.async {
                    
                    // Remove thestudentUser that was just deleted
                    self.list.removeAll { studentUser in
                        
                        // Check for thestudentUser to remove
                        return studentUser.id == studentUserToDelete.id
                    }
                }
                
                
            }
        }
        
    }
    
    func addData(CWID: String, email: String, first_name: String, last_name: String, password: String) {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Add a document to a collection
        db.collection("studentUser").addDocument(data: ["CWID":CWID, "email":email, "first_name":first_name,"last_name":last_name,"password":password]) { error in
            
            
            // Check for errors
            if error == nil {
                
                // No errors
                // Call get data to retrieve latest data
                self.getData()
            }
            else {
                // Handle the error
            }
        }
    }
    
    func getData() {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Read the documents at a specific path
        db.collection("studentUser").getDocuments { snapshot, error in
            
            // Check for errors
            if error == nil {
                
                // No errors
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create studentUsers
                        self.list = snapshot.documents.map { d in
                            
                            // Create a studentUser item for each document returned
                            return studentUser(id: d.documentID,
                                          CWID: d["CWID"] as? String ?? "",
                                          Email: d["Email"] as? String ?? "",
                                          first_name: d["first_name"] as? String ?? "",
                                          last_name: d["last_name"] as? String ?? "",
                                          Password: d["Password"] as? String ?? "")}
  
                    }
                }
            }
        }
    }
}


/*                PULLED FROM designcode.io - https://designcode.io/swiftui-advanced-handbook-firebase-storage
import SwiftUI
import Firebase

public class StorageManager: ObservableObject {
    let storage = Storage.storage()

    func upload(image: UIImage) {
        // Create a storage reference
        let storageRef = storage.reference().child("images/image.jpg")

        // Resize the image to 200px with a custom extension
        let resizedImage = image.aspectFittedToHeight(200)

        // Convert the image into JPEG and compress the quality to reduce its size
        let data = resizedImage.jpegData(compressionQuality: 0.2)

        // Change the content type to jpg. If you don't, it'll be saved as application/octet-stream type
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"

        // Upload the image
        if let data = data {
            storageRef.putData(data, metadata: metadata) { (metadata, error) in
                if let error = error {
                    print("Error while uploading file: ", error)
                }

                if let metadata = metadata {
                    print("Metadata: ", metadata)
                }
            }
        }
    }

    func listAllFiles() {
        // Create a reference
        let storageRef = storage.reference().child("images")

        // List all items in the images folder
        storageRef.listAll { (result, error) in
          if let error = error {
            print("Error while listing all files: ", error)
          }

          for item in result.items {
            print("Item in images folder: ", item)
          }
        }
    }

    func listItem() {
        // Create a reference
        let storageRef = storage.reference().child("images")

        // Create a completion handler - aka what the function should do after it listed all the items
        let handler: (StorageListResult, Error?) -> Void = { (result, error) in
            if let error = error {
                print("error", error)
            }

            let item = result.items
            print("item: ", item)
        }

        // List the items
        storageRef.list(maxResults: 1, completion: handler)
    }

        // You can use the listItem() function above to get the StorageReference of the item you want to delete
    func deleteItem(item: StorageReference) {
        item.delete { error in
            if let error = error {
                print("Error deleting item", error)
            }
        }
    }
}
*/
