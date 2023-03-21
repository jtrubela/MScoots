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
        

        


/*------------------------------------------------------------------------------------------------------------------------*/
//
//                          Authethication Status
//
//
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
/*------------------------------------------------------------------------------------------------------------------------*/
//
//                          Authethication ERRORS
//
//
/*------------------------------------------------------------------------------------------------------------------------*/

//Errors
/*
 /** Indicates a validation error with the custom token.
  */
 public static var invalidCustomToken: AuthErrorCode.Code { get }

 /** Indicates the service account and the API key belong to different projects.
  */
 public static var customTokenMismatch: AuthErrorCode.Code { get }

 /** Indicates the IDP token or requestUri is invalid.
  */
 public static var invalidCredential: AuthErrorCode.Code { get }

 /** Indicates the user's account is disabled on the server.
  */
 public static var userDisabled: AuthErrorCode.Code { get }

 /** Indicates the administrator disabled sign in with the specified identity provider.
  */
 public static var operationNotAllowed: AuthErrorCode.Code { get }

 /** Indicates the email used to attempt a sign up is already in use.
  */
 public static var emailAlreadyInUse: AuthErrorCode.Code { get }

 /** Indicates the email is invalid.
  */
 public static var invalidEmail: AuthErrorCode.Code { get }

 /** Indicates the user attempted sign in with a wrong password.
  */
 public static var wrongPassword: AuthErrorCode.Code { get }

 /** Indicates that too many requests were made to a server method.
  */
 public static var tooManyRequests: AuthErrorCode.Code { get }

 /** Indicates the user account was not found.
  */
 public static var userNotFound: AuthErrorCode.Code { get }

 /** Indicates account linking is required.
  */
 public static var accountExistsWithDifferentCredential: AuthErrorCode.Code { get }

 /** Indicates the user has attemped to change email or password more than 5 minutes after
     signing in.
  */
 public static var requiresRecentLogin: AuthErrorCode.Code { get }

 /** Indicates an attempt to link a provider to which the account is already linked.
  */
 public static var providerAlreadyLinked: AuthErrorCode.Code { get }

 /** Indicates an attempt to unlink a provider that is not linked.
  */
 public static var noSuchProvider: AuthErrorCode.Code { get }

 /** Indicates user's saved auth credential is invalid, the user needs to sign in again.
  */
 public static var invalidUserToken: AuthErrorCode.Code { get }

 /** Indicates a network error occurred (such as a timeout, interrupted connection, or
     unreachable host). These types of errors are often recoverable with a retry. The
     `NSUnderlyingError` field in the `NSError.userInfo` dictionary will contain the error
     encountered.
  */
 public static var networkError: AuthErrorCode.Code { get }

 /** Indicates the saved token has expired, for example, the user may have changed account
     password on another device. The user needs to sign in again on the device that made this
     request.
  */
 public static var userTokenExpired: AuthErrorCode.Code { get }

 /** Indicates an invalid API key was supplied in the request.
  */
 public static var invalidAPIKey: AuthErrorCode.Code { get }

 /** Indicates that an attempt was made to reauthenticate with a user which is not the current
     user.
  */
 public static var userMismatch: AuthErrorCode.Code { get }

 /** Indicates an attempt to link with a credential that has already been linked with a
     different Firebase account
  */
 public static var credentialAlreadyInUse: AuthErrorCode.Code { get }

 /** Indicates an attempt to set a password that is considered too weak.
  */
 public static var weakPassword: AuthErrorCode.Code { get }

 /** Indicates the App is not authorized to use Firebase Authentication with the
     provided API Key.
  */
 public static var appNotAuthorized: AuthErrorCode.Code { get }

 /** Indicates the OOB code is expired.
  */
 public static var expiredActionCode: AuthErrorCode.Code { get }

 /** Indicates the OOB code is invalid.
  */
 public static var invalidActionCode: AuthErrorCode.Code { get }

 /** Indicates that there are invalid parameters in the payload during a "send password reset
  *  email" attempt.
  */
 public static var invalidMessagePayload: AuthErrorCode.Code { get }

 /** Indicates that the sender email is invalid during a "send password reset email" attempt.
  */
 public static var invalidSender: AuthErrorCode.Code { get }

 /** Indicates that the recipient email is invalid.
  */
 public static var invalidRecipientEmail: AuthErrorCode.Code { get }

 /** Indicates that an email address was expected but one was not provided.
  */
 public static var missingEmail: AuthErrorCode.Code { get }

 /** Indicates that the iOS bundle ID is missing when a iOS App Store ID is provided.
  */
 public static var missingIosBundleID: AuthErrorCode.Code { get }

 /** Indicates that the android package name is missing when the `androidInstallApp` flag is set
     to true.
  */
 public static var missingAndroidPackageName: AuthErrorCode.Code { get }

 /** Indicates that the domain specified in the continue URL is not allowlisted in the Firebase
     console.
  */
 public static var unauthorizedDomain: AuthErrorCode.Code { get }

 /** Indicates that the domain specified in the continue URI is not valid.
  */
 public static var invalidContinueURI: AuthErrorCode.Code { get }

 /** Indicates that a continue URI was not provided in a request to the backend which requires
     one.
  */
 public static var missingContinueURI: AuthErrorCode.Code { get }

 /** Indicates that a phone number was not provided in a call to
     `verifyPhoneNumber:completion:`.
  */
 public static var missingPhoneNumber: AuthErrorCode.Code { get }

 /** Indicates that an invalid phone number was provided in a call to
     `verifyPhoneNumber:completion:`.
  */
 public static var invalidPhoneNumber: AuthErrorCode.Code { get }

 /** Indicates that the phone auth credential was created with an empty verification code.
  */
 public static var missingVerificationCode: AuthErrorCode.Code { get }

 /** Indicates that an invalid verification code was used in the verifyPhoneNumber request.
  */
 public static var invalidVerificationCode: AuthErrorCode.Code { get }

 /** Indicates that the phone auth credential was created with an empty verification ID.
  */
 public static var missingVerificationID: AuthErrorCode.Code { get }

 /** Indicates that an invalid verification ID was used in the verifyPhoneNumber request.
  */
 public static var invalidVerificationID: AuthErrorCode.Code { get }

 /** Indicates that the APNS device token is missing in the verifyClient request.
  */
 public static var missingAppCredential: AuthErrorCode.Code { get }

 /** Indicates that an invalid APNS device token was used in the verifyClient request.
  */
 public static var invalidAppCredential: AuthErrorCode.Code { get }

 /** Indicates that the SMS code has expired.
  */
 public static var sessionExpired: AuthErrorCode.Code { get }

 /** Indicates that the quota of SMS messages for a given project has been exceeded.
  */
 public static var quotaExceeded: AuthErrorCode.Code { get }

 /** Indicates that the APNs device token could not be obtained. The app may not have set up
     remote notification correctly, or may fail to forward the APNs device token to Auth
     if app delegate swizzling is disabled.
  */
 public static var missingAppToken: AuthErrorCode.Code { get }

 /** Indicates that the app fails to forward remote notification to Auth.
  */
 public static var notificationNotForwarded: AuthErrorCode.Code { get }

 /** Indicates that the app could not be verified by Firebase during phone number authentication.
  */
 public static var appNotVerified: AuthErrorCode.Code { get }

 /** Indicates that the reCAPTCHA token is not valid.
  */
 public static var captchaCheckFailed: AuthErrorCode.Code { get }

 /** Indicates that an attempt was made to present a new web context while one was already being
     presented.
  */
 public static var webContextAlreadyPresented: AuthErrorCode.Code { get }

 /** Indicates that the URL presentation was cancelled prematurely by the user.
  */
 public static var webContextCancelled: AuthErrorCode.Code { get }

 /** Indicates a general failure during the app verification flow.
  */
 public static var appVerificationUserInteractionFailure: AuthErrorCode.Code { get }

 /** Indicates that the clientID used to invoke a web flow is invalid.
  */
 public static var invalidClientID: AuthErrorCode.Code { get }

 /** Indicates that a network request within a SFSafariViewController or WKWebView failed.
  */
 public static var webNetworkRequestFailed: AuthErrorCode.Code { get }

 /** Indicates that an internal error occurred within a SFSafariViewController or WKWebView.
  */
 public static var webInternalError: AuthErrorCode.Code { get }

 /** Indicates a general failure during a web sign-in flow.
  */
 public static var webSignInUserInteractionFailure: AuthErrorCode.Code { get }

 /** Indicates that the local player was not authenticated prior to attempting Game Center
     signin.
  */
 public static var localPlayerNotAuthenticated: AuthErrorCode.Code { get }

 /** Indicates that a non-null user was expected as an argmument to the operation but a null
     user was provided.
  */
 public static var nullUser: AuthErrorCode.Code { get }

 /** Indicates that a Firebase Dynamic Link is not activated.
  */
 public static var dynamicLinkNotActivated: AuthErrorCode.Code { get }

 /**
  * Represents the error code for when the given provider id for a web operation is invalid.
  */
 public static var invalidProviderID: AuthErrorCode.Code { get }

 /**
  * Represents the error code for when an attempt is made to update the current user with a
  * tenantId that differs from the current FirebaseAuth instance's tenantId.
  */
 public static var tenantIDMismatch: AuthErrorCode.Code { get }

 /**
  * Represents the error code for when a request is made to the backend with an associated tenant
  * ID for an operation that does not support multi-tenancy.
  */
 public static var unsupportedTenantOperation: AuthErrorCode.Code { get }

 /** Indicates that the Firebase Dynamic Link domain used is either not configured or is
     unauthorized for the current project.
  */
 public static var invalidDynamicLinkDomain: AuthErrorCode.Code { get }

 /** Indicates that the credential is rejected because it's misformed or mismatching.
  */
 public static var rejectedCredential: AuthErrorCode.Code { get }

 /** Indicates that the GameKit framework is not linked prior to attempting Game Center signin.
  */
 public static var gameKitNotLinked: AuthErrorCode.Code { get }

 /** Indicates that the second factor is required for signin.
  */
 public static var secondFactorRequired: AuthErrorCode.Code { get }

 /** Indicates that the multi factor session is missing.
  */
 public static var missingMultiFactorSession: AuthErrorCode.Code { get }

 /** Indicates that the multi factor info is missing.
  */
 public static var missingMultiFactorInfo: AuthErrorCode.Code { get }

 /** Indicates that the multi factor session is invalid.
  */
 public static var invalidMultiFactorSession: AuthErrorCode.Code { get }

 /** Indicates that the multi factor info is not found.
  */
 public static var multiFactorInfoNotFound: AuthErrorCode.Code { get }

 /** Indicates that the operation is admin restricted.
  */
 public static var adminRestrictedOperation: AuthErrorCode.Code { get }

 /** Indicates that the email is required for verification.
  */
 public static var unverifiedEmail: AuthErrorCode.Code { get }

 /** Indicates that the second factor is already enrolled.
  */
 public static var secondFactorAlreadyEnrolled: AuthErrorCode.Code { get }

 /** Indicates that the maximum second factor count is exceeded.
  */
 public static var maximumSecondFactorCountExceeded: AuthErrorCode.Code { get }

 /** Indicates that the first factor is not supported.
  */
 public static var unsupportedFirstFactor: AuthErrorCode.Code { get }

 /** Indicates that the a verifed email is required to changed to.
  */
 public static var emailChangeNeedsVerification: AuthErrorCode.Code { get }

 /** Indicates that the nonce is missing or invalid.
  */
 public static var missingOrInvalidNonce: AuthErrorCode.Code { get }

 /** Raised when a Cloud Function returns a blocking error. Will include a message returned from
  * the function.
  */
 public static var blockingCloudFunctionError: AuthErrorCode.Code { get }

 /** Indicates an error for when the client identifier is missing.
  */
 public static var missingClientIdentifier: AuthErrorCode.Code { get }

 /** Indicates an error occurred while attempting to access the keychain.
  */
 public static var keychainError: AuthErrorCode.Code { get }

 /** Indicates an internal error occurred.
  */
 public static var internalError: AuthErrorCode.Code { get }

 /** Raised when a JWT fails to parse correctly. May be accompanied by an underlying error
     describing which step of the JWT parsing process failed.
  */
 public static var malformedJWT: AuthErrorCode.Code { get }
}
 */
//New Password
/*
 open func sendPasswordReset(withEmail email: String, completion: ((Error?) -> Void)? = nil)

 /** @fn sendPasswordResetWithEmail:completion:
     @brief Initiates a password reset for the given email address.
 
     @param email The email address of the user.
     @param completion Optionally; a block which is invoked when the request finishes. Invoked
         asynchronously on the main thread in the future.
 
     @remarks Possible error codes:
 
         + `AuthErrorCodeInvalidRecipientEmail` - Indicates an invalid recipient email was
             sent in the request.
         + `AuthErrorCodeInvalidSender` - Indicates an invalid sender email is set in
             the console for this action.
         + `AuthErrorCodeInvalidMessagePayload` - Indicates an invalid email template for
             sending update email.
 
 
  */
 open func sendPasswordReset(withEmail email: String) async throws

 
 /** @fn sendPasswordResetWithEmail:actionCodeSetting:completion:
     @brief Initiates a password reset for the given email address and `ActionCodeSettings` object.
 
     @param email The email address of the user.
     @param actionCodeSettings An `ActionCodeSettings` object containing settings related to
         handling action codes.
     @param completion Optionally; a block which is invoked when the request finishes. Invoked
         asynchronously on the main thread in the future.
 
     @remarks Possible error codes:
 
         + `AuthErrorCodeInvalidRecipientEmail` - Indicates an invalid recipient email was
             sent in the request.
         + `AuthErrorCodeInvalidSender` - Indicates an invalid sender email is set in
             the console for this action.
         + `AuthErrorCodeInvalidMessagePayload` - Indicates an invalid email template for
             sending update email.
         + `AuthErrorCodeMissingIosBundleID` - Indicates that the iOS bundle ID is missing when
             `handleCodeInApp` is set to true.
         + `AuthErrorCodeMissingAndroidPackageName` - Indicates that the android package name
             is missing when the `androidInstallApp` flag is set to true.
         + `AuthErrorCodeUnauthorizedDomain` - Indicates that the domain specified in the
             continue URL is not allowlisted in the Firebase console.
         + `AuthErrorCodeInvalidContinueURI` - Indicates that the domain specified in the
             continue URL is not valid.
 
 
  */
 open func sendPasswordReset(withEmail email: String, actionCodeSettings: ActionCodeSettings, completion: ((Error?) -> Void)? = nil)

 /** @fn sendPasswordResetWithEmail:actionCodeSetting:completion:
     @brief Initiates a password reset for the given email address and `ActionCodeSettings` object.
 
     @param email The email address of the user.
     @param actionCodeSettings An `ActionCodeSettings` object containing settings related to
         handling action codes.
     @param completion Optionally; a block which is invoked when the request finishes. Invoked
         asynchronously on the main thread in the future.
 
     @remarks Possible error codes:
 
         + `AuthErrorCodeInvalidRecipientEmail` - Indicates an invalid recipient email was
             sent in the request.
         + `AuthErrorCodeInvalidSender` - Indicates an invalid sender email is set in
             the console for this action.
         + `AuthErrorCodeInvalidMessagePayload` - Indicates an invalid email template for
             sending update email.
         + `AuthErrorCodeMissingIosBundleID` - Indicates that the iOS bundle ID is missing when
             `handleCodeInApp` is set to true.
         + `AuthErrorCodeMissingAndroidPackageName` - Indicates that the android package name
             is missing when the `androidInstallApp` flag is set to true.
         + `AuthErrorCodeUnauthorizedDomain` - Indicates that the domain specified in the
             continue URL is not allowlisted in the Firebase console.
         + `AuthErrorCodeInvalidContinueURI` - Indicates that the domain specified in the
             continue URL is not valid.
 
 
  */
 open func sendPasswordReset(withEmail email: String, actionCodeSettings: ActionCodeSettings) async throws

 
 /** @fn sendSignInLinkToEmail:actionCodeSettings:completion:
     @brief Sends a sign in with email link to provided email address.
 
     @param email The email address of the user.
     @param actionCodeSettings An `ActionCodeSettings` object containing settings related to
         handling action codes.
     @param completion Optionally; a block which is invoked when the request finishes. Invoked
         asynchronously on the main thread in the future.
  */
 */
