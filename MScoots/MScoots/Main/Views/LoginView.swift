//
//  ContentView.swift
//  MScoots
//
//  Created by Justin Trubela on 2/26/23.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
        struct ViewItem: Identifiable, Hashable {
            let name: String
            let id = NSUUID().uuidString
        }
    
        let views: [ViewItem] = [
            .init(name: "LoginView"),
            .init(name: "RegistrationView"),
            .init(name: "UserHomeView"),
        ]
    
    //imports functions for creating user and logging in
//    @StateObject var model = DB_Authorization()
    
    
    @State private var isLoggedIn = false
    
    enum Field {
        case email, password
    }
    
    //User input fields to verify against the db
    @State private var email = ""
    @State private var password = ""
    
    //variables for errors upon user login attempt
    @State private var showingAlert = false
    @State private var buttonsDisabled = true
    @FocusState private var focusField: Field?
    @Environment(\.dismiss) private var dismiss
    
    //Create an @State NavigationPath() variable to use in the NavigationStack
    @State private var path = [ViewItem]()
    @State public var loginStatusErrorMessage = ""

    
    
    
    var body: some View {
        //Navigates to the UserHomeView upon successful login
        NavigationStack(path: $path){
            VStack{
                Image("scooter")
                //  .colorInvert()
                //  .colorMultiply(.blue)
                ZStack{
                    //add the title to the page
                    
                    //stack for the entire view
                    VStack{
                        //Stack for Email address and password input
                        //Text for LoginStatusErrorMessage
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
                            if showingAlert {
                                Text(loginStatusErrorMessage).foregroundColor(.red)
                            }
                            
                            
                            VStack{
                                /*implement test for reset password
                                 */
                                Button{
                                    
                                } label: {
                                    Text("Reset Password...")
                                        .buttonStyle(.borderedProminent)
                                        .underline()
                                        .fontWidth(.expanded)
                                        .foregroundColor(.blue)
                                }
                            }
                            .buttonStyle(.plain)
                            .fontWidth(.expanded)
                            
                            
                            Rectangle()
                                .AddMyDivider()
//User Login
                            //Navigation Link to UserHomeView
                            Button{
                                loginStatusErrorMessage = login_Registration_InputErrorCheck(email: email, password: password)
                                
                                if isLoggedIn{
//                                    path.remove(at: 0)
                                    path.append(ViewItem(name: "UserHomeView"))
                                }
                                else{
                                    password = ""
                                }
                                
                                
                            } label: {
                                Text("Login")
                            }.foregroundColor(.blue)
                                .AddMy_ButtonSytle()

                            
                            
                            
                        }
                    }
                }
                .navigationDestination(for: ViewItem.self) { view in
                    
                    ViewForItem(view)
                }
                .navigationTitle("Log in")
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    
    //update the view to the navigationstack path variable
    func ViewForItem(_ view: ViewItem) -> AnyView {
        switch view.name {
        case "LoginView":
            return AnyView(LoginView())
        case "RegistrationView":
            return AnyView(RegistrationView())
        case "UserHomeView":
                return AnyView(UserHomeView())
        default:
            return AnyView(LandingPageView())
        }
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
                    loginStatusErrorMessage = "Password entered is not correct"
                    print(loginStatusErrorMessage)

                //Email is invalid
                case AuthErrorCode.invalidEmail.rawValue:
                    loginStatusErrorMessage = "Email is invalid"
                    print(loginStatusErrorMessage)
                //Email is unverified
                    case AuthErrorCode.unverifiedEmail.rawValue:
                    loginStatusErrorMessage = "An email link was sent to your account, please verify it before loggin in"
                    print(loginStatusErrorMessage)
                //Network error
                case AuthErrorCode.networkError.rawValue:
                    loginStatusErrorMessage = "Error in network connection"
                    print(loginStatusErrorMessage)
                //User disabled
                case AuthErrorCode.userDisabled.rawValue:
                    loginStatusErrorMessage = "User is currently disabled"
                    print(loginStatusErrorMessage)
                
                    
                default:
                    print("unknown error: \(err.localizedDescription)")
                }
            } else { //there was no error so the user could be auth'd or maybe not!
                if let _ = auth?.user {
                    path.append(ViewItem(name: "UserHomeView"))
                    loginStatusErrorMessage = "user is authd"
                    print(loginStatusErrorMessage)
                } else {
                    loginStatusErrorMessage = "no authenticated user"
                    print(loginStatusErrorMessage)
                }
            }
        })
            return loginStatusErrorMessage
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
