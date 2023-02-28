//
//  ViewModel.swift
//  MScoots
//
//  Created by Justin Trubela on 2/27/23.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore


class FirebaseManager: NSObject {
    
    let auth: Auth
    let storage: Storage
    let firestore: Firestore
    
    static let shared = FirebaseManager()
    
    override init() {
        FirebaseApp.configure()
        
        
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()
        
        super.init()
    }
    
    
}


class ViewModel: ObservableObject {
    /*
     
     
     Functions represent a collection in the Firestore Database
     
     As of right now the data represents an object that will be used to store the users personal data.
     
     :::::
     need to get rid of the email/password fields
     and put some personal stuff in there
     
     */
    
//    @Published var loginStatusMessage = ""
    @Published var loginStatusMessage = ""
    @Published var studentUsers = [studentUser]()
//    @Published var guestUsers = [guestUser]()
    
    func updateData(studentUserToUpdate:studentUser) {
        // Set the data to update
        FirebaseManager.shared.firestore.collection("studentUser").document(studentUserToUpdate.id).setData(["Email":"Updated: \(studentUserToUpdate.CWID)"], merge: true) { error in
            
            // Check for errors
            if error == nil {
                // Get the new data
                self.getData()
            }
        }
    }
    
    func deleteData(studentUserToDelete:studentUser) {
        // Specify the document to delete
        FirebaseManager.shared.firestore.collection("studentUser").document(studentUserToDelete.id).delete { error in
            
            // Check for errors
            if error == nil {
                // No errors
                
                // Update the UI from the main thread
                DispatchQueue.main.async {
                    
                    // Remove thestudentUser that was just deleted
                    self.studentUsers.removeAll { studentUser in
                        
                        // Check for thestudentUser to remove
                        return studentUser.id == studentUserToDelete.id
                    }
                }
                
                
            }
        }
        
    }
    
    func addData(CWID: String, email: String, first_name: String, last_name: String, password: String) {
        // Add a document to a collection
        FirebaseManager.shared.firestore.collection("studentUser").addDocument(data: ["CWID":CWID, "email":email, "first_name":first_name,"last_name":last_name,"password":password]) { error in
            
            
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
        // Read the documents at a specific path
        FirebaseManager.shared.firestore.collection("studentUser").getDocuments { snapshot, error in
            
            // Check for errors
            if error == nil {
                
                // No errors
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create studentUsers
                        self.studentUsers = snapshot.documents.map { d in
                            
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
    
    
    func createNewAccount(email: String, password: String) -> String{
        var message = ""
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, err in
            if let err = err {
                message = "Failed to create user: \(err)"

                print("Failed to create user:", err)
                message = "Failed to login user: \(err)"
                return
            }
            message = "Successfully created user: \(result?.user.uid ?? "")"
            print("Successfully created user: \(result?.user.uid ?? "")")
            message = "Successfully created user: \(result?.user.uid ?? "")"
        }
        return message
    }
    
    
    func getUserAuthStatus() -> String {
        if Auth.auth().currentUser != nil {
          // User is signed in.
          // ...
            let user = Auth.auth().currentUser
            if let user = user {
              // The user's ID, unique to the Firebase project.
              // Do NOT use this value to authenticate with your backend server,
              // if you have one. Use getTokenWithCompletion:completion: instead.
              let uid = user.uid
                
                
                //unsused
                _ = user.email
                _ = user.photoURL
                //
                
                
              var multiFactorString = "MultiFactor: "
              for info in user.multiFactor.enrolledFactors {
                multiFactorString += info.displayName ?? "[DispayName]"
                multiFactorString += " "
              }
                print("currentUser.Auth: Successful---User:\(uid) is logged in")
                return "currentUser.Auth: Successful---User:\(uid) is logged in"
//                let userInfo = Auth.auth().currentUser?.providerData[indexPath.row]
//                cell?.textLabel?.text = userInfo?.providerID
//                // Provider-specific UID
//                cell?.detailTextLabel?.text = userInfo?.uid

              // ...
            }
        } else {
          // No user is signed in.
          // ...
            print("currentUser.Auth: Successful---No user is currently signed in")
            return "currentUser.Auth: Successful---No user is currently signed in"
        }
        return "function call failed"
    }
    
    func loginUser(email: String, password: String){
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to login user:", err)
                self.loginStatusMessage = "Failed to login user: \(err)"
                return
            }
            
            print("Successfully logged in as user: \(result?.user.uid ?? "")")
            self.loginStatusMessage = "Successfully logged in as user: \(result?.user.uid ?? "")"
        }
        loginStatusMessage = getUserAuthStatus()
    }
    
    func logOut(userUID: String) -> String{
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
            return "userAuth.signOut: Successful---user:\(userUID)"
        }
        return "userAuth.signOut: Unsuccessful---no user currently logged in"
    }
    
    
    func logOut() -> String{
        var message = ""
        var userUID = getUserAuthStatus()
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            message = "user.Auth.signOut: Successful---user: \(userUID) logged out"
            
            print("user.Auth.signOut: Successful---user: \(userUID) logged out")
        } catch let signOutError as NSError {
            print("Error signing out user: \(userUID) %@", signOutError)
            userUID = ""
            message = "Error signing out user: \(userUID) %@\(signOutError)"
        }
        return message
    }
    
    
    
    //Login to Account
    /*
     Creates the information for the signIn authentication to firebase authentication db
        Status message: shows to the user they have logged in on the homepage
            will show if no view is chosen to go to
     */
//    func loginUser(email: String, password: String){
//        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, err in
//            if let err = err {
//                print("Failed to login user:", err)
//                self.loginStatusMessage = "Failed to login user: \(err)"
//                return
//            }
//            
//            print("Successfully logged in as user: \(result?.user.uid ?? "")")
//            self.loginStatusMessage = "Successfully logged in as user: \(result?.user.uid ?? "")"
//        }
//        
//    }
    
    //Create New Account
    /*
     Creates the information for the createUser authentication to firebase authentication db
        Status message: shows to the user they have logged in on the homepage
            will show if no view is chosen to go to
        CreateNewAccount: takes in email and password and tries to authenticate new user creation
     */
//    func createNewAccount(email: String, password: String){
//        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, err in
//            if let err = err {
//                print("Failed to create user:", err)
//                //                self.newUserStatusMessage = "Failed to login user: \(err)"
//                return
//            }
//            
//            print("Successfully created user: \(result?.user.uid ?? "")")
//            //            self.newUserStatusMessage = "Successfully created user: \(result?.user.uid ?? "")"
//        }
//    }
//    
    
    
    //Add Profile Image

    /*
     
     
     */
    
    
    //    private func persistImageToStorage() {
            //        let filename = UUID().uuidString
    //        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
    //        let ref = FirebaseManager.shared.storage.reference(withPath: uid)
    //        guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else { return }
    //        ref.putData(imageData) { metadata, err in
    //            if let err = err {
    //                self.newUserStatusMessage = "Failed to push image to Storage: \(err)"
    //                return
    //            }
    //
    //            ref.downloadURL { url, err in
    //                if let err = err {
    //                    self.newUserStatusMessage = "Failed to retrieve downloadURL: \(err)"
    //                    return
    //                }
    //
    //                self.newUserStatusMessage = "Successfully stored image with url: \(url?.absoluteString ?? "")"
    //                print(url?.absoluteString)
    //
    //                guard let url = url else { return }
    //                storeUserInformation(imageProfileUrl: url)
    //            }
    //        }
    //    }
        
    //    private func storeUserInformation(imageProfileUrl: URL) {
    //        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
    //        let userData = ["email": self.email, "uid": uid, "profileImageUrl": imageProfileUrl.absoluteString]
    //        FirebaseManager.shared.firestore.collection("users")
    //            .document(uid).setData(userData) { err in
    //                if let err = err {
    //                    print(err)
    //                    self.newUserStatusMessage = "\(err)"
    //                    return
    //                }
    //
    //                print("Success")
    //            }
    //    }
        
    
    //Instantiate the functions needed for userImage profile storage
//    func persistImageToStorage(image: UIImage) {
////        let filename = UUID().uuidString
//        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
//        guard let email = FirebaseManager.shared.auth.currentUser?.email else { return }
//        let ref = FirebaseManager.shared.storage.reference(withPath: uid)
//        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
//        ref.putData(imageData) { metadata, err in
//            if let err = err {
//                print("Failed to push image to Storage: \(err)")
////                self.loginStatusMessage = "Failed to push image to Storage: \(err)"
//                return
//            }
//
//            ref.downloadURL { url, err in
//                if let err = err {
//                    print("Failed to retrieve downloadURL: \(err)")
////                    self.loginStatusMessage = "Failed to retrieve downloadURL: \(err)"
//                    return
//                }
//
////                self.loginStatusMessage = "Successfully stored image with url: \(url?.absoluteString ?? "")"
//                print("Successfully stored image with url: \(url!.absoluteString)")
//
//                guard let url = url else { return }
//                self.storeUserInformation(email: email, imageProfileUrl: url)
//            }
//        }
//    }
//
//func storeUserInformation(email: String, imageProfileUrl: URL) {
//        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
//        let userData = ["email": email, "uid": uid, "profileImageUrl": imageProfileUrl.absoluteString]
//        FirebaseManager.shared.firestore.collection("users")
//            .document(uid).setData(userData) { err in
//                if let err = err {
//                    print(err)
////                    self.loginStatusMessage = "\(err)"
//                    return
//                }
//
//                print("Success")
//            }
//    }
//
}
