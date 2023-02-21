//
//  ViewModel.swift
//  crud-demo
//
//  Created by Justin Trubela on 2/19/23.
//

import Foundation
import Firebase

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
