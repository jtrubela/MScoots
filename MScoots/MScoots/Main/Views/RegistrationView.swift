//
//  RegistrationView.swift
//  crud-demo
//
//  Created by Justin Trubela on 2/19/23.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct RegistrationView: View {
    //ModelView Values-functionality
    //imports functions needed to register
//    @ObservedObject var model = DB_Authorization()
    
    
    //User data(still not being used)
    // creates instances of registration items needed for view state change
    // checked against user database
    //@State var CWID = ""
    //@State var first_name = ""
    //@State var last_name = ""
    
    
    //Section for trying to register an email address and password the manual way
    @State var email = ""
    @State var password = ""
    @State var password2 = ""
    
    //View Variables
    //Create an @State NavigationPath() variable to use in the NavigationStack
    //    @State private var path = NavigationPath()
    
    //  ViewModifying variables
    //  Variables for the alerts back to the user if upon register request see's errors in user input
    @State private var showingAlert = false
    //    @State private var buttonsDisabled = true
    @State private var alertMessage = ""
    //    @FocusState private var focusField: Field?
    @Environment(\.dismiss) private var dismiss
    
    // create instance for showing data back to user if user already created
    @State var newUserStatusErrorMessage = ""
    
    
    
    
    
    
    
    
    
    
    var body: some View {
        //Navigates to UserHome upon successfull registration
        //        NavigationStack(path: $path){
        //Stack for login information
        //-profile image
        //-cwid
        //-first name
        //-last name
        //-email
        //-password1
        //-password2
        
        //-registration input error message
        //-registration button
        
        //Stack for all elements
        VStack {
            //List Stack for inputFields
            
            List{
/*
 implement firestore data storage for these section variables
 
 */
                //Section for name input
                //                    Section("Name") {
                //                        TextField("First Name",text: $first_name)
                //                        TextField("Last Name", text: $last_name)
                //                    }
                
                //Section for CWID imput
                //                    Section("Campus Wide ID"){
                //                        TextField("CWID", text: $CWID)
                //                    }
                
                //Section for Email and Passowrd input
                Section("Email"){
                    TextField("Email Address", text: $email)
                }
                Section("Password"){
                    SecureField("Password",text: $password)
                    SecureField("Re-Enter Password", text: $password2)
                }
            }
            
            /* implement upon successful registration transition to UserHomeView
             implement upon unsuccesful registration error message is shown to the user
             
             */
            Button {
                //Previous use of model.create
                //                    newUserStatusErrorMessage = model.createNewAccount(email: email, password: password)
                
            } label: {
                Text("Register")
            }.AddMy_ButtonSytle()
            /*
             implement new user status errors here
             */
            VStack{
                //previous call for self.new user
                //                    Text(self.newUserStatusErrorMessage).foregroundColor(.red)
                //                    Text(newUserStatusErrorMessage)
                //                    showingAlert ? Text("\(newUserStatusErrorMessage)").foregroundColor(.red) : Text("\(newUserStatusErrorMessage)").foregroundColor(.red)
                if showingAlert {
                    Text("\(newUserStatusErrorMessage)").foregroundColor(.red)
                }
            }
        }
        .navigationTitle("Registration")
        .alert(alertMessage, isPresented: $showingAlert){
            Button("OK", role: .cancel) {}
        }
        //        }
        //        .onAppear {
        //            //Check to see if user is logged in when app runs
        //            //navigate to the new screen and skip login screen
        //            if FirebaseManager.shared.auth.currentUser != nil {
        //                print("Login Successful")
        //                path.append("UserHomeView")
        //            }
        //
        //        }
    }
    
    
    
    func createNewAccount(email: String, password: String, alertMessage: String) -> String {
        //alertmessage coming in is the correct db description
        //message is what i will be modiftying and pushing out to the view to show the user
        //ALERT MESSAGE MESSAGES
        //Credential issues
        
        // Credentials already in use
        /*                case          AuthErrorCode.credentialAlreadyInUse.rawValue:
         //                    loginStatusErrorMessage = "Credential             are already in use"
         //                    print(loginStatusErrorMessage)
         */
        //Account exists with diff creditials
        /*                case          AuthErrorCode.accountExistsWithDifferentCredential          .rawValue:
         //                    loginStatusErrorMessage = "Account            Entereed Exists With Different Credential"
         print(loginStatusErrorMessage)
         //User credentials not found
         case AuthErrorCode.userNotFound.rawValue:
         loginStatusErrorMessage = "Can't locate the user, try with          different credential"
         print(loginStatusErrorMessage)
         
         //Password issues
         //Weak Password
         case AuthErrorCode.weakPassword.rawValue:
         loginStatusErrorMessage = "Password is too weak"
         print(loginStatusErrorMessage)
         */
        
        var message = alertMessage
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result,
            error in
            if let error = error { //login error occured
                let fullAlertMessage = "Failed to Register User user: \(error.localizedDescription) \n---> \(message)"
                print(fullAlertMessage)
                /*
                 implement alertmessage from loginView/DBauth function
                 */
                //data that will be added in to portray the correct db auth description to user
                //
                message = "Sign Up Error: \(error.localizedDescription)"
                showingAlert = true
                
                //                self.newUserStatusErrorMessage = "Failed to create user: \(err)"
                //                print(err)
                //                message = "\(err)"
            }
            //                else {
            
            //                    var fullAlertMessage = "Successfully created user: \(result?.user.uid ?? "0") \n--->\(error?.localizedDescription ?? "0") \n---> \(message)"
            //                    print("Failed to Register User user: \(error.localizedDescription) \n---> \(message)"
            //                    path.append("UserHomeView")
            //                }
        }
        return message
    }
    
    
    
    
    /*------------------------------------------------------------------------------------------------------------------------*/
    //
    //                          UI IMAGE PICKER FOR REGISTRATION VIEW
    //
    /*------------------------------------------------------------------------------------------------------------------------*/
    //
    //User profile information
    //  Add Profile Image
    //  functions needed to access Firebase Cloud Store to save data
    //
    //
    //  Store the users selected image
    //
    /*------------------------------------------------------------------------------------------------------------------------*/
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
}


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        //takes in error message so that we can access the login function in model
        NavigationStack{
            RegistrationView()
        }
    }
}
