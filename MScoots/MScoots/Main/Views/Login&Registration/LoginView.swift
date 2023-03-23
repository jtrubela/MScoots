//
//  ContentView.swift
//  MScoots
//
//  Created by Justin Trubela on 2/26/23.
//
// implement UUID of 2IME2CmEYCWn7tUzvRPjkxrgUc33 as admin for JT
//       if FirebaseManager.shared.auth.currentUser?.uid == "2IME2CmEYCWn7tUzvRPjkxrgUc33"
//

import SwiftUI
import Firebase

struct LoginView: View {
    
        struct ViewItem: Identifiable, Hashable {
            let name: String
            let id = NSUUID().uuidString
        }
    
        let views: [ViewItem] = [
            .init(name: "LandingPageView"),
            .init(name: "LoginView"),
            .init(name: "RegistrationView"),
            .init(name: "UserHomeView"),
            .init(name: "ResetPasswordView"),
            .init(name: "AdminUserHomeView"),
            .init(name: "ScanQRView"),
            .init(name: "ScooterListView"),
            .init(name: "ScootMapView"),
            .init(name: "MyScootsView"),
            .init(name: "UserProfile_SettingsView"),
            .init(name: "WalletView"),
                //AdminScooterManagerView
                //AdminUserManagerView
                //AdminFindScooterView
                //Admin.....
        ]
    
    //imports functions for creating user and logging in
    @StateObject var model = DB_Authorization()
    
    //Create an @State NavigationPath() variable to use in the NavigationStack
    @State private var path = [ViewItem]()
    //will show a logout -> return to root
    // in admin mode
    
    
    @State private var isLoggedIn = false
    @State private var isAdmin = false
    @State private var admin_OR_userButtonText = "Forgot Password"
    


    //User input fields to verify against the db
    enum Field {
            case email, password
        }
    @State private var email = ""
    @State private var password = ""
    
    //If email is determined to be admin, make button appear
    // if email and password entered correctly...enter admin mode
    var isAdminSignedIn: Bool {
        if email == "jtrubela@icloud.com"{
            isAdmin.toggle()
            admin_OR_userButtonText = "ADMIN MODE"
            statusErrorMessage = "Enter correct password to enter Admin Account"
            path = []
            return true
        }
        return false
    }
    
    
    
    //variables for errors upon user login attempt
    @State private var showingAlert = false
    @State private var buttonsDisabled = true
    
    
    @FocusState private var focusField: Field?
    @Environment(\.dismiss) private var dismiss
    

    @State private var showFullStack = false
    
    @State public var statusErrorMessage = ""

    
    
    
    var body: some View {
        //Navigates to the UserHomeView upon successful login
        NavigationStack(path: $path){
/*******/
            VStack{
                
                
                //add the title to the page
                
                //stack for the entire view
/**/            VStack{
                    Image("scooter")
//Image                    //  .colorInvert()
                    //  .colorMultiply(.blue)
                    //Stack for Email address and password input
                    //Text for LoginStatusErrorMessage
                    
//Text input
                    VStack{
                        TextField("Email Address", text: $email)
                            .AddMyTextFieldEntry()
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled().padding(5)
                            .textInputAutocapitalization(.never)
                            .submitLabel(.next)
                            .focused($focusField, equals: .email)// field bound to the .email case
                            .onSubmit {
                                focusField = .password
                            }
                            .onChange(of: email) { _ in
                                //Enable buttons?
                                enableButtons()
                                if isAdminSignedIn{
                                    showFullStack = true
                                }
                                
                            }
                        
                        SecureField("Password", text: $password).AddMyTextFieldEntry()
                            .textInputAutocapitalization(.never)
                            .submitLabel(.done)
                            .focused($focusField, equals: .password) /* field bound to the .email case*/
                            .onSubmit {
                                focusField = nil
                            }
                            .onChange(of: password) { _ in
                                //Enable buttons?
                                enableButtons()
                            }
                            .padding(5)
                        
                        //test for login status error message
                        if isAdmin{
                            Text("isAdmin: \(String(isAdmin))")
                        }
                        if showingAlert {
                            Text(statusErrorMessage).foregroundColor(.red)
                        }
                        if showFullStack && isAdmin {
                            Text(statusErrorMessage).foregroundColor(.blue)
                        }
                        
                        
                        
                        VStack{
                            
                            if isAdmin && showFullStack && password == "Password!123"{
                                
                                NavigationLink("\(admin_OR_userButtonText)", destination: AdminUserHomeView())
                                    .buttonStyle(.bordered).underline()
                            }
                            else{
                                NavigationLink("\(String(admin_OR_userButtonText))", destination: ResetPasswordView())
                                    .buttonStyle(.bordered).underline()

                            }

                            /*implement test for reset password
                             
                             
                                */
//showFullStack ? Button{
//
//                } label: {
//                            Text("\(admin_OR_userButtonText)")
//                                    .buttonStyle(.borderedProminent)
//                                    .underline()
//                                    .fontWidth(.expanded)
//                                    .foregroundColor(.blue)} :
//                Button{
//                                if password == "Password!123"{
////                                  path = []
//                                    path.append(ViewItem(name:"AdminUserHomeView"))
//                                } else {
//                                    resetAllData()
//                                    showingAlert.toggle()
//                                    loginStatusErrorMessage = "Incorrect admin password"
//                                }
//                            } label: {
//                                Text("\(admin_OR_userButtonText)")
//                                    .buttonStyle(.borderedProminent)
//                                    .underline()
//                                    .fontWidth(.expanded)
//                                    .foregroundColor(.blue)
//                            }
                        }
                        .buttonStyle(.plain)
                        .fontWidth(.expanded)
//
//                            Rectangle()
//                                .AddMyDivider()
//User Login
                        //Navigation Link to UserHomeView
                        Button{
                            statusErrorMessage = login_Registration_InputErrorCheck(email: email, password: password)
                            
                            if isLoggedIn{
                                path.append(ViewItem(name: "UserHomeView"))
                            }
                            else{
                                email = ""
                                password = ""
                            }
                        } label: {
                            Text("Login")
                        }.foregroundColor(.blue)
                            .AddMy_ButtonSytle()
                    }
/**/            }
                
                .navigationDestination(for: ViewItem.self) { view in
                    VStack{
                        ViewForItem(view)
                        
                        
                        if view.name == "UserHomeView"{
                            if isAdmin && email == "jtrubela@icloud.com"{
                                Button {
                                    path = views
                                } label: {
                                    Text("LogOut")
                                }
                           
                            } else {
                                Button {
                                    path = []
                                    signOut()
                                } label: {
                                    Text("LogOut")
                                }
                            }
                        }
                        
                    }
                    .navigationBarBackButtonHidden(true)
                }
                .navigationBarBackButtonHidden(true)
                .navigationTitle("Log in")
            }
            .navigationBarBackButtonHidden(true)
        }
//        .navigationBarBackButtonHidden(true)

    }
    
    
    //update the view to the navigationstack path variable
    func ViewForItem(_ view: ViewItem) -> AnyView {
        switch view.name {
        case "LandingPageView":
            return AnyView(LandingPageView())
        case "LoginView":
            return AnyView(LoginView())
        case "RegistrationView":
            return AnyView(RegistrationView())
        case "UserHomeView":
                return AnyView(UserHomeView())
        case "ResetPasswordView":
            return AnyView(ResetPasswordView())
        case "AdminUserHomeView":
            return AnyView(AdminUserHomeView())
        case "ScanQRView":
            return AnyView(ScanQRView())
        case "ScooterListView":
            return AnyView(ScooterListView())
        case "ScootMapView":
            return AnyView(ScootMapView())
        case "MyScootsView":
            return AnyView(MyScootsView())
        case "UserProfile_SettingsView":
            return AnyView(UserProfile_SettingsView())
        case "WalletView":
            return AnyView(WalletView())
        default:
            return AnyView(LandingPageView())
        }
    }
    
    func signOut(){
        let userUID = FirebaseManager.shared.auth.currentUser?.uid
        
        do {
            try FirebaseManager.shared.auth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        print("user(\(String(describing: userUID))): Signed out Successfully---no user currently logged in")
    }
    
    func resetAllData(){
        email = ""
        password = ""
        showFullStack = false
        isAdmin = false
        admin_OR_userButtonText = ""
    }
    
    func login_Registration_InputErrorCheck(email: String, password: String) -> String{
        //if previous error...set error message back to false
        showingAlert = false
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password, completion: { (auth, error) in
            if let maybeError = error { //if there was an error, handle it
                showingAlert.toggle()
                let err = maybeError as NSError
                switch err.code {
 
                    
                //Password invalid
                case AuthErrorCode.wrongPassword.rawValue:
                    statusErrorMessage = "Password entered is not correct"
                    print(statusErrorMessage)

                //Email is invalid
                case AuthErrorCode.invalidEmail.rawValue:
                    statusErrorMessage = "Email is invalid"
                    print(statusErrorMessage)
                //Email is unverified
                    case AuthErrorCode.unverifiedEmail.rawValue:
                    statusErrorMessage = "An email link was sent to your account, please verify it before loggin in"
                    print(statusErrorMessage)
                //Network error
                case AuthErrorCode.networkError.rawValue:
                    statusErrorMessage = "Error in network connection"
                    print(statusErrorMessage)
                //User disabled
                case AuthErrorCode.userDisabled.rawValue:
                    statusErrorMessage = "User is currently disabled"
                    print(statusErrorMessage)
                
                    
                default:
                    print("unknown error: \(err.localizedDescription)")
                }
            } else { //there was no error so the user could be auth'd or maybe not!
                if let _ = auth?.user {
                    path.append(ViewItem(name: "UserHomeView"))
                    statusErrorMessage = "user is authd"
                    print(statusErrorMessage)
                } else {
                    statusErrorMessage = "no authenticated user"
                    print(statusErrorMessage)
                }
            }
        })
            return statusErrorMessage
    }

    func enableButtons() {
        let emailIsGood = email.count >= 6 && email.contains("@")
        let passwordIsGood = password.count >= 6
        buttonsDisabled = !(emailIsGood && passwordIsGood)
    }
    
    
}

    
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationStack{
                LoginView()
            }
        }
    }
