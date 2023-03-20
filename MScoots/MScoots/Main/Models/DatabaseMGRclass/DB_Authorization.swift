//
//  ViewModel.swift
//  MScoots
//
//
//  Created by Justin Trubela on 2/27/23.
//


import FirebaseAuth
import SwiftUI


class DB_Authorization: ObservableObject {

    
    //
    // Error message items for displaying message to the user
    //      for non-functional req problems with sign-in/password etc..
    //
//    @Published var newUserStatusErrorMessage = ""
//    @Published var loginStatusErrorMessage = ""
//    @Published var errorMessage = ""
    
    
/*------------------------------------------------------------------------------------------------------------------------*/
//
// AUTH - AUTHENTICATION
//
//
// Functions for Firebase Authorization
// info is based on generic email and password strings as of right now
/*------------------------------------------------------------------------------------------------------------------------*/
    
    
    /*------------------------------------------------------------------------------------------------------------------------*/
    //
    //
    //Create Account
    //
    //      accesses the DB with email and passowrd input
    //          if theres an error make the newUser error appear
    //          otherwise continue
    //
    /*------------------------------------------------------------------------------------------------------------------------*/
//    func createNewAccount(email: String, password: String, showingAlert: Bool) -> String {
//        @State var alertMessage = ""
//        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result,
//            error in
//            if let error = error { //login error occured
//                print("Failed to Register User user: \( error.localizedDescription)")
//                alertMessage = "Sign Up Error: \(error.localizedDescription)"
//                showingAlert = true
////                self.newUserStatusErrorMessage = "Failed to create user: \(err)"
////                print(err)
////                message = "\(err)"
//                return
//            }
//            
//            print("Successfully created user: \(result?.user.uid ?? "only printing created user")")
//        }
//        return message
//    }
    
    
    
    /*------------------------------------------------------------------------------------------------------------------------*/
    //
    //
    //Log the user into the DB
    //
    //      accesses the DB with email and passowrd input
    //          if theres an error make the user trying to login have an error appear
    //          otherwise continue
    //
    /*------------------------------------------------------------------------------------------------------------------------*/
    
    
//    public func login_Registration_InputErrorCheck(email: String, password: String) -> String{
//        FirebaseManager.shared.auth.signIn(withEmail: email, password: password, completion: { (auth, error) in
//            if let maybeError = error { //if there was an error, handle it
//                let err = maybeError as NSError
//                switch err.code {
//
//                //Credential issues
//
//                    // Credentials already in use
//                case AuthErrorCode.credentialAlreadyInUse.rawValue:
//                    self.loginStatusErrorMessage = "Credential are already in use"
//                                    print(self.loginStatusErrorMessage)
//
//                //Account exists with diff creditials
//                case AuthErrorCode.accountExistsWithDifferentCredential.rawValue:
//                    self.loginStatusErrorMessage = "Account Entereed Exists With Different Credential"
//                    print(self.loginStatusErrorMessage)
//                //User credentials not found
//                case AuthErrorCode.userNotFound.rawValue:
//                    self.loginStatusErrorMessage = "Can't locate the user, try with different credential"
//                    print(self.loginStatusErrorMessage)
//
//                //Password issues
//                case AuthErrorCode.wrongPassword.rawValue:
//                    self.loginStatusErrorMessage = "Password entered is not correct"
//                    print(self.loginStatusErrorMessage)
//                //Weak Password
//                case AuthErrorCode.weakPassword.rawValue:
//                    self.loginStatusErrorMessage = "Password is too weak"
//                    print(self.loginStatusErrorMessage)
//                //Email is invalid
//                case AuthErrorCode.invalidEmail.rawValue:
//                    self.loginStatusErrorMessage = "Email is invalid"
//                    print(self.loginStatusErrorMessage)
//                //Email is unverified
//                    case AuthErrorCode.unverifiedEmail.rawValue:
//                    self.loginStatusErrorMessage = "An email link was sent to your account, please verify it before loggin in"
//                    print(self.loginStatusErrorMessage)
//                //Network error
//                case AuthErrorCode.networkError.rawValue:
//                    self.loginStatusErrorMessage = "Error in network connection"
//                    print(self.loginStatusErrorMessage)
//                case AuthErrorCode.userDisabled.rawValue:
//                    self.loginStatusErrorMessage = "User is currently disabled"
//                    print(self.loginStatusErrorMessage)
//
//
//                default:
//                    print("unknown error: \(err.localizedDescription)")
//                }
//            } else { //there was no error so the user could be auth'd or maybe not!
//                if let _ = auth?.user {
//                    self.loginStatusErrorMessage = "user is authd"
//                    print(self.loginStatusErrorMessage)
//                } else {
//                    self.loginStatusErrorMessage = "no authenticated user"
//                    print(self.loginStatusErrorMessage)
//                }
//            }
//        })
//            return loginStatusErrorMessage
//    }
//
//
//    func loginUser(email: String, password: String){
//        //email and password get passed in from loginview
//        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, err in
//            if let err = err {
//                print("Failed to login user:", err)
//                self.loginStatusErrorMessage = "Failed to login user: \(err)"
//                return
//            }
//            print("Successfully logged in as user: \(result?.user.uid ?? "")")
//            print("result: \(result!)")
//        }
//    }
    

    
    /*------------------------------------------------------------------------------------------------------------------------*/
    //
    //
    //Log the user out of the DB
    //
    //
    //      accesses the current users Unique ID logged into the DB
    //          try to signout
    //          otherwise
    //      prints to the console the status
    //
    //
    /*------------------------------------------------------------------------------------------------------------------------*/
        
//        func logOut(){
//            let firebaseAuth = Auth.auth()
//            let userUID = firebaseAuth.currentUser?.uid
//            
//            do {
//                try firebaseAuth.signOut()
//            } catch let signOutError as NSError {
//                print("Error signing out: %@", signOutError)
//            }
//            print("userAuth.signOut: Successful---no user currently logged in")
//        }
        

//    }

/*------------------------------------------------------------------------------------------------------------------------*/
//
//                          Authethication Status
//
    /*------------------------------------------------------------------------------------------------------------------------*/
    //
    //
//
//
//
//
    //
    /*------------------------------------------------------------------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------*/

//func getUserAuthStatus() -> String {
//    if Auth.auth().currentUser != nil {
//      // User is signed in.
//      // ...
//        let user = Auth.auth().currentUser
//        if let user = user {
//          // The user's ID, unique to the Firebase project.
//          // Do NOT use this value to authenticate with your backend server,
//          // if you have one. Use getTokenWithCompletion:completion: instead.
//          let uid = user.uid
//            
//            
//            //unsused
//            _ = user.email
//            _ = user.photoURL
//            //
//            
//            
//          var multiFactorString = "MultiFactor: "
//          for info in user.multiFactor.enrolledFactors {
//            multiFactorString += info.displayName ?? "[DispayName]"
//            multiFactorString += " "
//          }
//            print("currentUser.Auth: Successful---User:\(uid) is logged in")
//            return "currentUser.Auth: Successful---User:\(uid) is logged in"
////                let userInfo = Auth.auth().currentUser?.providerData[indexPath.row]
////                cell?.textLabel?.text = userInfo?.providerID
////                // Provider-specific UID
////                cell?.detailTextLabel?.text = userInfo?.uid
//
//          // ...
//        }
//    } else {
//      // No user is signed in.
//      // ...
//        print("currentUser.Auth: Successful---No user is currently signed in")
//        return "currentUser.Auth: Successful---No user is currently signed in"
//    }
//    return "function call failed"
//}

}
