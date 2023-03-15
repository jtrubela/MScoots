//
//  ViewModel.swift
//  MScoots
//
//
//
//  Created by Justin Trubela on 2/27/23.
//
//
/*  Current status of this file
 functions needed to access Firebase Cloud Store
 
 
 update the Collections saved data -
 
 */
//
//
//
/*  Manage users in Firebase
 https://firebase.google.com/docs/auth/ios/manage-users
 
 Available options:
 *Create user
 *Get currently signed in user
 *Get a users profile
 *Get a users provider specific profile information
 *Update a user's profile
 Set a user's email address
 Send a user a verification email
 Set a user's password
 Send a password reset email
 Delete a user
 Re-authenticate a user
 Import user accounts
 */
//
//  Authenticate using providers - (need Apple Developer account to use sign in with apple)
//
//  Sign in with Google
//                    https://firebase.google.com/docs/auth/ios/google-signin





import Foundation
import Firebase
import FirebaseStorage
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import SwiftUI


class ViewModel: ObservableObject {
    
    
    var AuthDB = FirebaseManager.shared.auth
    //    init(AuthDB: Auth = FirebaseManager.shared.auth) {
    //        self.AuthDB = AuthDB
    //        return AuthDB.currentUser
    //    }
    var StoreDB = FirebaseManager.shared.firestore
    
    //
    //Array of all users - checks against unique ID for specific user
    //
    //    @Published var studentUsers = [studentUser]()
    @Published var Users = [User]()
    
    //
    // Error message items for displaying message to the user
    //      for non-functional req problems with sign-in/password etc..
    //
    @Published var newUserStatusMessage = ""
    @Published var loginStatusMessage = ""
    @Published var errorMessage = ""
    
    
    /*------------------------------------------------------------------------------------------------------------------------*/
    /*
     
     AUTH - AUTHENTICATION
     
     
     Functions for Firebase Authorization
     info is based on generic email and password strings as of right now
     */
    /*------------------------------------------------------------------------------------------------------------------------*/
    /*
     Create Account
     creates a new user with a unique identifier
     */
    /*------------------------------------------------------------------------------------------------------------------------*/
    func createNewAccount(email: String, password: String) -> String {
        var message = ""
        AuthDB.createUser(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to create user:", err)
                self.newUserStatusMessage = "Failed to create user: \(err)"
                print(err)
                message = "\(err)"
                return
            }
            
            print("Successfully created user: \(result?.user.uid ?? "only printing created user")")
            
            self.newUserStatusMessage = "Successfully created user: \(result?.user.uid ?? "unwrap result success")"
            message = "Successfully created user: \(result?.user.uid ?? "unwrap result success")"
        }
        return message
    }
    
    
    
    /*------------------------------------------------------------------------------------------------------------------------*/
    
    //
    //Log the user into the DB
    // info is based on generic email and password strings as of right now
    //
    //
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
    
    
    
    
    
    /*func loginUser(email: String, apassword: String) -> String {
     var message = ""
     
     //        AuthDB.signIn(withEmail: email, password: password) { [weak self] authResult, error in
     //            guard self != nil else {
     //                return
     //
     //            }
     //            self?.loginStatusMessage = "Failed to login user: \(String(describing: error))"
     //        }
     AuthDB.signIn(withEmail: email, password: apassword) { result, err in
     if let err = err {
     message = "Failed to login user: \(err)"
     print("Failed to login user:", err)
     //                        self.loginStatusMessage = "Failed to login user: \(err)"
     return
     }
     
     print("Successfully logged in as user: \(result?.user.uid ?? "")")
     //                    self.loginStatusMessage = "Successfully logged in as user: \(result?.user.uid ?? "")"
     message = "Successfully logged in as user: \(result?.user.uid ?? "")"
     }
     return message
     }
     */
    
    /*------------------------------------------------------------------------------------------------------------------------*/
    /*------------------------------------------------------------------------------------------------------------------------*/
    
    //
    //Log the user out of the DB
    //
    
    
    /*------------------------------------------------------------------------------------------------------------------------*/
    /*------------------------------------------------------------------------------------------------------------------------*/
        
        func logOut() -> String{
            let firebaseAuth = Auth.auth()
            let userUID = firebaseAuth.currentUser?.uid
            
            do {
                try firebaseAuth.signOut()
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
                return "userAuth.signOut: Successful---user:\(String(describing: userUID))"
            }
            return "userAuth.signOut: Unsuccessful---no user currently logged in"
        }
        
        /*------------------------------------------------------------------------------------------------------------------------*/
        
        
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
                    
                }
            } else {
                // No user is signed in.
                // ...
                print("currentUser.Auth: Successful---No user is currently signed in")
                return "currentUser.Auth: Successful---No user is currently signed in"
            }
            return "function call failed"
        }
        
        
        
        
        
        
        //    func isAuthenticated(currentUser: User?) -> Bool{
        //        let currentUser = AuthDB.currentUser
        //        var exists = currentUser != nil ? true : false
        //        return exists
        //    }
        
        
        /*
         //  get the userProvider info
         //      (sign in with Google can be added at some point)
         
         
         var multiFactorString = "MultiFactor: "
         
         for info in user.multiFactor.enrolledFactors {
         multiFactorString += info.displayName ?? "[DispayName]"
         multiFactorString += " "
         }*/
        
        /*
         DO SOMETHING WITH THIS DATA
         */
        func UpdateViewController() -> String{
            let currentUser = Auth.auth().currentUser
            var message = ""
            
            // User is signed in.
            // ...
            if currentUser != nil  {
                
                let uid = String(describing: currentUser?.uid)
//                let email = String(describing: currentUser?.email)
//                let photoURL = String(describing: currentUser?.photoURL)
                message = "currentUser.Auth: Successful---User:\(uid) is logged in"
                print("currentUser.Auth: Successful---User:\(String(describing: uid)) is logged in")
                return message
                
            } else {
                
                // No user is signed in.
                // ...
                message = "currentUser.Auth: Successful---No user is currently signed in"
                print("currentUser.Auth: Successful---No user is currently signed in")
                return message
            }
        }
        
        /*------------------------------------------------------------------------------------------------------------------------*/
        /*------------------------------------------------------------------------------------------------------------------------*/
        /*
         
         Update the users data
         UID,
         EMAIL,
         PROFILE PHOTO URL,
         USER PROVIDER INFO(no providers linked yet)
         */
        //
        func UpdateUserData(user: User?, email: String, imageProfileUrl: URL) {
            guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
            let userData = ["email": email, "uid": uid, "profileImageUrl": imageProfileUrl.absoluteString]
            FirebaseManager.shared.firestore.collection("users")
                .document(uid).setData(userData) { err in
                    if let err = err {
                        print(err)
                        //                    self.loginStatusMessage = "\(err)"
                        return
                    }
                    
                    print("Success")
                }
        }
    }
/*------------------------------------------------------------------------------------------------------------------------*/

//                          UI IMAGE PICKER FOR REGISTRATION VIEW

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

        
        /*------------------------------------------------------------------------------------------------------------------------*/
        /*      Get a users provider specific information - retrieved from the sign-in providers linked
         
         let userInfo = Auth.auth().currentUser?.providerData[indexPath.row]
         cell?.textLabel?.text = userInfo?.providerID
         // Provider-specific UID
         cell?.detailTextLabel?.text = userInfo?.uid
         */
        
        /*------------------------------------------------------------------------------------------------------------------------*/
        
        
        
        /*------------------------------------------------------------------------------------------------------------------------*/
        
        /*
         
         Custom Authorization System: Log the user in to the DB and check for the Custom Token
         
         */
        /*---------------------------------------------------------------------------------------
         
         
         
         
         /*------------------------------------------------------------------------------------------------------------------------*/
         /*
          
          Log the user out of the DB
          
          */
         /*------------------------------------------------------------------------------------------------------------------------*/
         
         /*------------------------------------------------------------------------------------------------------------------------*/
         /*
          Add User Profile Picture -
          adds ProfilePhotoURL to a users data
          
          */
         
         /*-------------------------------------------------------------------------------------
          
          
          
          
          /*------------------------------------------------------------------------------------------------------------------------*/
          
          //User profile information
          //Add Profile Image
          //functions needed to access Firebase Cloud Store to save data
          
          //
          //Store the users selected image
          
          
          
          //
          //    /*------------------------------------------------------------------------------------------------------------------------*/
          //
          //
          //    /*------------------------------------------------------------------------------------------------------------------------*/
          //
          //    func updateData(studentUserToUpdate: User) {
          //
          //    }
          //
          //    /*------------------------------------------------------------------------------------------------------------------------*/
          //    /*------------------------------------------------------------------------------------------------------------------------*/
          //
          //    /*------------------------------------------------------------------------------------------------------------------------*/
          //    /*------------------------------------------------------------------------------------------------------------------------*/
          //
          //
          //
          //
          //
          //
          //
          //
          //
          //    /*------------------------------------------------------------------------------------------------------------------------*/
          //    /*
                 //
                 //     FIRESTORE
                 //     Currently connected to a dummy user class...
                 //     */
          //    /*------------------------------------------------------------------------------------------------------------------------*/
          //
          //    //
          //    //Update the collection item for the given ID
          //    //      need to update to reflect the final userClass
          //    //
          //
          //    func updateUserData(_user_2Update: User?,_collName: String, items: [String : Any]) {
          //        var user_ = AuthDB.currentUser?.uid ?? ""
          //        StoreDB.collection(_collName).document(user_).setData(["CWID":true], merge: true) { err in
          //            if err == nil {
          //                print("Error")
          //                self.errorMessage = "Error updating the data: \(String(describing: err))"
          //            }
          //
          //            print("Successfully updated")
          //
          //        }
          //
          //    }
          //
          //    //
          //    //Delete the collection for the given ID
          //    //      need to update to reflect the final userClass
          //    //
          //    func deleteData(_coll_2Delete: String,_doc_2Delete:String) {
          //        StoreDB.collection(_coll_2Delete).document(_doc_2Delete).delete() { error in
          //            //            if err == nil {
          //            /*
                         //             // Update the UI from the main thread
                         //             DispatchQueue.main.async {
                         //             // Remove thestudentUser that was just deleted
                         //             AdminView             self.studentUsers.removeAll { studentUser in
                         //             // Check for thestudentUser to remove
                         //             return studentUser.id == studentUserToDelete.id
                         //             }
                         //             }
                         //             */
          //            print("Error")
          //            self.errorMessage = "Error deleting)"
          //        }
          //        print("Successfully deleted")
          //    }
          }
          
          
          /*------------------------------------------------------------------------------------------------------------------------*/
          /*
           Get a user's profile------To get a user's profile information
           UID,
           EMAIL,
           PROFILE PHOTO URL,
           USER PROVIDER INFO(no providers linked yet)
           
           
           // The user's ID, unique to the Firebase project.
           // Do NOT use this value to authenticate with your backend server,
           // if you have one. Use getTokenWithCompletion:completion: instead.
           */
          /*------------------------------------------------------------------------------------------------------------------------*/
          
          
          //
          //Get the data in collection and return it in the form of a studentUser class
          //      need to update to reflect the final userClass
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
          self.Users = snapshot.documents.map { d in
          
          
          // Create a studentUser item for each document returned
          return User(id: d.documentID,
          id: d["id"] as? String ?? "",
          name: d["name"] as? String ?? "",
          username: d["username"] as? String ?? "",
          email: d["email"] as? String ?? "",
          address: d["address"] as? Address ?? "",
          phone: d["phone"] as? String ?? "")}
          
          }
          }
          }
          }
          }
          
          }
          
          
          
          
          
          
          Add custom data in the form of given attributes to the collection
          need to update to reflect the final userClass
          
          func addData(id: String, name: String, username: String, email: String, address: String, phone: String) {
          // Add a document to a collection
          StoreDB.collectionGroup.collection("studentUser").addDocument(data: ["id": id, "name": name, "username": username, "email": email, "address": address, "phone": phone]
          ) { error in
          
          
          // Check for errors
          if error == nil {
          // No errors
          // Call get data to retrieve latest data
          //
          //
          //Call to get the users Data
          /*
           self.getData()
           */
          }
          else {
          // Handle the error
          }
          }
          }
          
          
          
          
          
          func updateData(studentUserToUpdate:studentUser) {
          // Set the data to update
          FirebaseManager.shared.firestore.collection("studentUser").document(studentUserToUpdate.id).setData(["Email":"Updated:  \(studentUserToUpdate.CWID)"], merge: true) { error in
          
          // Check for errors
          if error == nil {
          // Get the new data
          //
          //
          //Call to get the users Data
          /*
           self.getData()
           */
          }
          }
          }
          
          
          
          Specify the document to delete
          FirebaseManager.shared.firestore.collection(_collName).document(studentUserToDelete.id).delete { error in
          
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
          
          */*/
