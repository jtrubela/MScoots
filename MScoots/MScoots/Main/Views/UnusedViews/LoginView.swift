////
////  ContentView.swift
////  MScoots
////
////  Created by Justin Trubela on 2/26/23.
////
//// implement UUID of 2IME2CmEYCWn7tUzvRPjkxrgUc33 as admin for JT
////       if FirebaseManager.shared.auth.currentUser?.uid == "2IME2CmEYCWn7tUzvRPjkxrgUc33"
////
//
//import SwiftUI
//import Firebase
//
//struct LoginView: View {
//
//    //imports functions for creating user and logging in
//    @StateObject var model = DB_Authorization()
//
//    @State private var isLoggedIn = false
//    @State private var isAdmin = false
//
//    //If email is determined to be admin, make button appear
//    // if email and password entered correctly...enter admin mode
////    var isAdminCredentials: Bool {
////        if email == "jtrubela@icloud.com"{
////            isAdmin.toggle()
////            statusErrorMessage = "Enter correct password to enter Admin Account"
////            return true
////        }
////        return false
////    }
//
//
//    //User input fields to verify against the db
//    enum Field {
//            case email, password
//        }
//    @State private var email = ""
//    @State private var password = ""
//
//    //variables for errors upon user login attempt
//    @State private var showingAlert = false
//    @State private var buttonsDisabled = true
//
//    //variables for changing focus on fields
//    @FocusState private var focusField: Field?
//    @Environment(\.dismiss) private var dismiss
//
//    @State private var selection: String? = nil
//
//    @State public var statusErrorMessage = ""
//
//        var body: some View {
//    //        //Navigates to the UserHomeView upon successful login
//            NavigationView{
//                VStack{
//                        VStack{
//                            TextField("Email Address", text: $email)
//                                .AddMyTextFieldEntry()
//                                .AddMyEmailFieldEntry()
//                                .focused($focusField, equals: .email)// field bound to the .email case
//                                .onSubmit {focusField = .password}
//                                .onChange(of: email) { _ in
//                                    //Enable buttons?
//                                    enableButtons()
////                                    isAdmin = true
//                                }
//
//                            SecureField("Password", text: $password)
//                                .AddMyTextFieldEntry()
//                                .AddMyPasswordFieldEntry()
//                                .focused($focusField, equals: .password)
//                                .onSubmit {focusField = nil}
//                                .onChange(of: password) { _ in
//                                    //Enable buttons?
//                                    enableButtons()
//                                }
//
////test for login status error message
//                Text(statusErrorMessage).foregroundColor(showingAlert ? .red : .blue )
////User Login
////Navigation Link to UserHomeView
//
//                            //if user is logged in and is using the admin email and password
//                            //go to Admin page
//                            if isLoggedIn && isAdmin{
//                                NavigationLink("",destination: AdminUserHomeView(), tag: "Admin", selection: $selection)
////                                    { AdminUserHomeView() }
//                            }
//                            //if user is logged in
//                            //go to user home page
//                            if isLoggedIn{
//                                NavigationLink("", destination: UserHomeView(), tag: "User", selection: $selection)
//                            }
//                            //if email has 6 or more characters
//                            //and contains @ symbol
//                            //set the button to clickable
//                            //otherwise unclickable
//                            if (email.count >= 6 && email.contains("@")){
//                                Button{
//                                    FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { (result, error) in
//                                        //if login sends an error update status error message
//                                        if error != nil {
//                                            statusErrorMessage = login_Registration_InputErrorCheck(email: email, password: password)
//
//                                        } else {
//                                            isLoggedIn = true
//                                            if email == "jtrubela@icloud.com"{
//                                                isAdmin = true
//                                                self.selection = "Admin"
//                                            }
//                                            else{
//                                                self.selection = "User"
//                                            }
//                                            print("User: \(String(describing: Auth.auth().currentUser?.uid)) is Authenticated")
//                                        }
//                                    }
//                                } label: {
//                                    Text("Login")
//                                        .foregroundColor(.blue)
//                                        .AddMy_ButtonStyle()
//                                }
//                            }
//                            else{
//                                Button("Login"){
//
//                                }
//                                .foregroundColor(.gray).buttonStyle(.bordered)
//                            }
//
//
////TODO: implement test for reset password
//                    NavigationLink("Reset Password", destination: ResetPasswordView())
//                }
////                    Text("isLoggedIn: \(String(isLoggedIn))")
////                    Text("isAdmin: \(String(isAdmin))")
////                    Text("isAdminSignedIn: \(String(isAdminCredentials))")
////                    Text("StatusErrorMessage: \(statusErrorMessage)")
//            }
//        }
//    }
//
//    func enableButtons() {
//        let emailIsGood = email.count >= 6 && email.contains("@")
//        let passwordIsGood = password.count >= 6
//        buttonsDisabled = !(emailIsGood && passwordIsGood)
//    }
//
//    func signOut(){
//        let userUID = FirebaseManager.shared.auth.currentUser?.uid
//        do {
//            try FirebaseManager.shared.auth.signOut()
//        } catch let signOutError as NSError {
//            print("Error signing out: %@", signOutError)
//        }
//        print("user(\(String(describing: userUID))): Signed out Successfully---no user currently logged in")
//    }
//
//    func login_Registration_InputErrorCheck(email: String, password: String) -> String{
//        //if previous error...set error message back to false
//        showingAlert = false
//        FirebaseManager.shared.auth.signIn(withEmail: email, password: password, completion: { (auth, error) in
//            if let maybeError = error { //if there was an error, handle it
//                showingAlert.toggle()
//                let err = maybeError as NSError
//                switch err.code {
//                //Password invalid
//                case AuthErrorCode.wrongPassword.rawValue:
//                    statusErrorMessage = "Password entered is not correct"
//                    print(statusErrorMessage)
//                //Email is invalid
//                case AuthErrorCode.invalidEmail.rawValue:
//                    statusErrorMessage = "Email is invalid"
//                    print(statusErrorMessage)
//                //Email is unverified
//                case AuthErrorCode.unverifiedEmail.rawValue:
//                    statusErrorMessage = "An email link was sent to your account, please verify it before loggin in"
//                    print(statusErrorMessage)
//                //Network error
//                case AuthErrorCode.networkError.rawValue:
//                    statusErrorMessage = "Error in network connection"
//                    print(statusErrorMessage)
//                //User disabled
//                case AuthErrorCode.userDisabled.rawValue:
//                    statusErrorMessage = "User is currently disabled"
//                    print(statusErrorMessage)
//                default:
//                    print("unknown error: \(err.localizedDescription)")
//                }
//            } else { //there was no error so the user could be auth'd or maybe not!
//                if let _ = auth?.user {
//                    statusErrorMessage = "user is authd"
//                    print(statusErrorMessage)
//                }
//            }
//        })
//        return statusErrorMessage
//    }
//
//
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
//
//
