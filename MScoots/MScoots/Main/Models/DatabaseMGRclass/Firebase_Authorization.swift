//
//  ViewModel.swift
//  MScoots
//
//
//  Created by Justin Trubela on 2/27/23.
//
import FirebaseAuth
import SwiftUI


class Firebase_Authorization: ObservableObject {
    //allows this class to used the shared authorization code used in the firebase manager
    let firebase = FirebaseManager.shared.auth
    
    
    // Error message items for displaying message to the user
    //      for non-functional req problems with sign-in/password etc..
    
    //Using showingAlert for use in RegistrationView and LandingPageView to login
    @Published var showingAlert_Reg = false
    

    

    
    
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
    //Login Auth
    
    //used to present messages back to the user in event of unsuccessful/successful login attempt
    @Published var showingAlert = false
    //Linked to Login Error message
    @Published var statusErrorMessage = "!"
    @Published var alertMessage = "!!"
    @Published var statusMessage = "!"
    

    func registerAccount(email: String, password: String) -> String {
        //if previous error...set error message back to false
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { (auth, error) in
            
            if let maybeError = error { //if there was an error, handle it
                self.showingAlert.toggle()
                let err = self.checkError(err: maybeError as NSError)
                self.statusErrorMessage = err
                self.showingAlert.toggle()
                self.statusErrorMessage = err
                self.statusMessagee = err
                print(err)
            } else {
                if (FirebaseManager.shared.auth.currentUser != nil) {
                    let newUserInfo = FirebaseManager.shared.auth.currentUser

                    self.alertMessage = "User has been successfully created!\nUID:\(String(describing: newUserInfo?.uid)),\(String(describing: newUserInfo?.email))"
                    self.statusMessagee = "User has been successfully created!\nUID:\(String(describing: newUserInfo?.uid)),\(String(describing: newUserInfo?.email))"
                    //                    isRegisteredUser = true
                    print(self.alertMessage)
                    
                    let email = newUserInfo?.email
                    self.statusMessage = "User\(newUserInfo?.uid ?? "--uid---") signed up successfully with email: \(String(describing: email))"
                    self.statusMessagee = "User\(newUserInfo?.uid ?? "--uid---") signed up successfully with email: \(String(describing: email))"
                }
            }
        }
        return self.statusMessage
    }
    

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
    @Published var isLoggedIn = false
    @Published var isAdmin = false
    @Published var selection: String? = nil
    @Published var statusMessagee = "Status Error Message"



    func Login(_ email: String,_ password: String){
        //if previous error...set error message back to false
        self.showingAlert = false
        MScoots.FirebaseManager.shared.auth.signIn(withEmail: email, password: password, completion: { (auth, error) in
            if let maybeError = error { //if there was an error, handle it
                self.showingAlert.toggle()
                
                let err = self.checkError(err: maybeError as NSError)
                self.statusErrorMessage = err
                self.statusMessagee = err
                
                print(err)
                
            } else { //there was no error so the user could be auth'd or maybe not!
                if let _ = auth?.user {
                    self.isLoggedIn = true
                    
                    if email == "Jtrubela@icloud.com"{
                        self.isAdmin = true
                        self.selection = "Admin"
                    }
                    else if password.isEmpty{
                        self.statusErrorMessage = "Password needs to be entered"
                        self.statusMessagee = "Password needs to be entered"
                    }
                    else{
                        self.selection = "User"
                    }
                    print("User: \(String(describing: self.firebase.currentUser?.uid)) is Authenticated")
                    self.statusErrorMessage = "user is authd"
                    self.statusMessagee = "user is authd"
                    print(self.statusErrorMessage)
                }
            }
        })
    }
    
    func checkError(err: NSError) -> String{
        //PASSWORD
        switch err.code {
            //Password invalid
        case AuthErrorCode.wrongPassword.rawValue:
            return "Password entered is not correct"
            //Email is invalid
        case AuthErrorCode.invalidEmail.rawValue:
            return "Email is invalid"
            //Email is unverified
        case AuthErrorCode.unverifiedEmail.rawValue:
            return "An email link was sent to your account, please verify it before loggin in"
            //Network error
        case AuthErrorCode.networkError.rawValue:
            return "Error in network connection"
            //User disabled
        case AuthErrorCode.userDisabled.rawValue:
            return "User has been disabled. Please contact support for further instructions - JT"
        case AuthErrorCode.invalidCustomToken.rawValue:
            return "The custom token format is incorrect"
        case AuthErrorCode.customTokenMismatch.rawValue:
            return "The custom token corresponds to a different audience"
        case AuthErrorCode.invalidCredential.rawValue:
            return "The supplied auth credential is malformed or has expired"
        case AuthErrorCode.userDisabled.rawValue:
            return "The user account has been disabled by an administrator"
        case AuthErrorCode.operationNotAllowed.rawValue:
            return "The given sign-in provider is disabled for this Firebase project"
            //EMAIL TAKEN
        case AuthErrorCode.emailAlreadyInUse.rawValue:
            return "The email address is already in use by another account"
        case AuthErrorCode.invalidEmail.rawValue:
            return "The email address is badly formatted"
        case AuthErrorCode.wrongPassword.rawValue:
            return "The password is invalid or the user does not have a password"
        case AuthErrorCode.tooManyRequests.rawValue:
            return "We have blocked all requests from this device due to unusual activity"
        case AuthErrorCode.userNotFound.rawValue:
            return "There is no user record corresponding to this identifier"
            //CREDENTIALS TAKEN
        case AuthErrorCode.accountExistsWithDifferentCredential.rawValue:
            return "An account already exists with the same email address but differentsign-in credentials"
        case AuthErrorCode.requiresRecentLogin.rawValue:
            return "This operation is sensitive and requires recent authentication. Log inagain before retrying this request"
        case AuthErrorCode.providerAlreadyLinked.rawValue:
            return "This account is already linked to a different provider"
        case AuthErrorCode.noSuchProvider.rawValue:
            return "The specified provider is not enabled for this Firebase project"
        case AuthErrorCode.invalidUserToken.rawValue:
            return "The user's credential is no longer valid. The user must sign in again"
        case AuthErrorCode.userTokenExpired.rawValue:
            return "The user's credential has expired. The user must sign in again"
        case AuthErrorCode.invalidAPIKey.rawValue:
            return "Your API key is invalid, please check you have copied it correctly"
        case AuthErrorCode.userMismatch.rawValue:
            return "The supplied credentials do not correspond to the previously signed inuser"
        case AuthErrorCode.credentialAlreadyInUse.rawValue:
            return "This credential is already associated with a different user account"
        case AuthErrorCode.weakPassword.rawValue:
            return "!!!The password must be 6 characters long or more"
        case AuthErrorCode.appNotAuthorized.rawValue:
            return "This app is not authorized to use Firebase Authentication. Please verifythat the correct bundle identifier has been entered in the Firebase Console"
        case AuthErrorCode.expiredActionCode.rawValue:
            return "The action code has expired"
        case AuthErrorCode.invalidActionCode.rawValue:
            return "The action code is invalid. This can happen if the code is malformed,expired, or has already been used"
        case AuthErrorCode.invalidMessagePayload.rawValue:
            return "The message payload was invalid"
        case AuthErrorCode.invalidSender.rawValue:
            return "The sender ID provided for an Auth instance is invalid"
        case AuthErrorCode.invalidRecipientEmail.rawValue:
            return "The recipient email address is invalid"
        case AuthErrorCode.missingPhoneNumber.rawValue:
            return "To send verification codes, provide a phone number for the recipient"
        case AuthErrorCode.missingVerificationCode.rawValue:
            return "The phone auth credential was created with an empty SMS verification code"
        case AuthErrorCode.missingVerificationID.rawValue:
            return "The phone auth credential was created with an empty verification ID"
        case AuthErrorCode.quotaExceeded.rawValue:
            return "The quota for this operation has been exceeded"
        case AuthErrorCode.sessionExpired.rawValue:
            return "Session Expired"
        case AuthErrorCode.missingEmail.rawValue:
            return "Missing the email field"
        default:
            return "unknown error: \(err.localizedDescription)"
        }
    }

    
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
        
    func logOut() -> Bool{
        let userUID = firebase.currentUser?.uid
        
        do {
            try firebase.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            return true
        }
        print("user(\(String(describing: userUID))): Signed out Successfully---no user currently logged in")
        return false
    }
}
