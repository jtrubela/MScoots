//
//  Firebase_Firestore.swift
//  MScoots
//
//  Created by Justin Trubela on 2/19/23.
//
//  Firebase_Firestore represents the link between data being saved from the application to the database(Firestore)
//      -can be accessed using the ObservableObject property wrapper by any view.
//      -Represents students data that is saved to the database and allows the user to store any information that should/could be updated:
//          studentUser()
//      -Represents scooter data that is saved to the database
//          Scooter()
//
//      -called by setting a variable as:
//          @ObservedObject var Firestore = Firebase_Firestore()
//
//      -Create a studentUser item for each document returned:
//           Scooter(location: <#T##String#>, isAvailable: <#T##String#>, battery: <#T##String#>, nearestCharger: <#T##String#>)
//
//
//      -Functions currently used
//          -addData:
//          -getData:
//          -addScootData:
//          -


import Foundation
import Firebase

class Firebase_Firestore: ObservableObject {
    
    @Published var list = [studentUser]()
    @Published var Scoot_list = [Scooter]()
    
    //add func for studentUser list
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
    //get func for studentUser list
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
                            return studentUser(CWID: d["CWID"] as? String ?? "",
                                               email: d["email"] as? String ?? "",
                                               first_name: d["first_name"] as? String ?? "",
                                               last_name: d["last_name"] as? String ?? "",
                                               password: d["password"] as? String ?? "")}
                    }
                }
            }
        }
    }
    
    
    //add func for scooter list
    func addScootData(location: String, isAvailable: String, battery: String, nearestCharger: String){
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Add a document to a collection
        db.collection("scooter_list").addDocument(data: ["isAvailable":isAvailable, "battery":battery, "nearestCharger":nearestCharger,"location":location]) { error in
            
            
            // Check for errors
            if error == nil {
                
                // No errors
                // Call get data to retrieve latest data
                self.getScootData()
            }
            else {
                // Handle the error
            }
        }
    }
    //get func for scooter list
    func getScootData() {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Read the documents at a specific path
        db.collection("scooter_list").getDocuments { snapshot, error in
            
            // Check for errors
            if error == nil {
    
                // No errors
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create studentUsers
                        self.Scoot_list = snapshot.documents.map { d in
                            
                            return Scooter(location: d["location"] as? String ?? "",
                                           isAvailable: d["isAvailable"] as? String ?? "",
                                           battery: d["battery"] as? String ?? "",
                                           nearestCharger: d["nearestCharger"] as? String ?? ""
                            )
                            
                        }
                        
                    }
                } 
            }
        }
    }


    //TODO: UPDATE and DELETE studentUser data - DELETE/ADD ANY OTHER INFORMATION

    //    //TODO: Update func for studentUser - allows the admin to edit users from the database
    //    func updateData(studentUserToUpdate:studentUser) {
    //
    //        // Get a reference to the database
    //        let db = Firestore.firestore()
    //
    //        // Set the data to update
    //        db.collection("studentUser").document(studentUserToUpdate.id).setData(["Email":"Updated: \(studentUserToUpdate.CWID)"], merge: true) { error in
    //
    //            // Check for errors
    //            if error == nil {
    //                // Get the new data
    //                self.getData()
    //            }
    //        }
    //    }

    //    //TODO: Delete func for studentUser - allows the admin to delete users from the database
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

    //TODO: UPDATE and DELETE scooter data - DELETE/ADD ANY OTHER INFORMATION

    //    //TODO: Update func for Scooter - allows the admin to edit scooters from the database
    //    func updateScootData(scootToUpdate:Scooter) {
    //
    //        // Get a reference to the database
    //        let db = Firestore.firestore()
    //
    //        // Set the data to update
    //        db.collection(<#T##collectionPath: String##String#>).document(<#T##documentPath: String##String#>).setData(<#T##documentData: [String : Any]##[String : Any]#>, merge: true) { error in
    //
    //            // Check for errors
    //            if error == nil {
    //                //TODO: Get the new data
    //
    //            }
    //        }
    //    }

    //    //TODO: Delete func for studentUser - allows the admin to delete users from the database
    //    func deleteData(scootToUpdate:Scooter) {
    //
    //        // Get a reference to the database
    //        let db = Firestore.firestore()
    //
    //        // Specify the document to delete
    //        db.collection(String).document(<#T##documentPath: String##String#>).delete { error in
    //
    //            // Check for errors
    //            if error == nil {
    //                // No errors
    //
    //                // Update the UI from the main thread
    //                DispatchQueue.main.async {
    //
    //                    // Remove thestudentUser that was just deleted
    //                    Scoot_list.removeAll { scoot in
    //
    //                        // Check for thestudentUser to remove
    //                        //return studentUser.id == studentUserToDelete.id
    //                        return scoot.id == scootToUpdate.id
    //                    }
    //                }
    //
    //
    //            }
    //        }
    //
}



