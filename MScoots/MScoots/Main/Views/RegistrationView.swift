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
    @ObservedObject var model = DB_Authorization()


    //User data(still not being used)
    // creates instances of registration items needed for view state change
    // checked against user database
    @State var CWID = ""
    @State var first_name = ""
    @State var last_name = ""
    
    @State var email = ""
    @State var password = ""
    @State var password2 = ""

    //View Variables
    //Create an @State NavigationPath() variable to use in the NavigationStack
    @State private var path = NavigationPath()
    
    //ViewModifying variables
    @State private var showingAlert = false
//    @State private var buttonsDisabled = true
    @State private var alertMessage = ""
//    @FocusState private var focusField: Field?
    @Environment(\.dismiss) private var dismiss
    
    
    
    // create instance for showing data back to user if user already created
    @State var newUserStatusErrorMessage = ""

    // create image picture verification
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    
    
    
    
    


    

    
    var body: some View {
        //Navigates to UserHome upon successfull registration
        NavigationStack(path: $path){
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
                    //Section for image picker
                    Section("Profile Image"){
                        
                        Button {
                            shouldShowImagePicker.toggle()
                        } label: {
                            VStack {
                                if let image = self.image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 90, height: 90)
                                        .cornerRadius(64)
                                } else {
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 64))
                                        .padding()
                                        .foregroundColor(Color(.label))
                                }
                            }
                            .overlay(RoundedRectangle(cornerRadius: 64)
                                .stroke(Color.black, lineWidth: 3)
                            )
                        }
                        
                        .navigationViewStyle(StackNavigationViewStyle())
                        .fullScreenCover(
                            isPresented: $shouldShowImagePicker, onDismiss: nil) {
                                ImagePicker(image: $image)
                            }
                    }
                    
                    //Section for name input
                    Section("Name") {
                        TextField("First Name",text: $first_name)
                        TextField("Last Name", text: $last_name)
                    }
                    
                    //Section for CWID imput
                    Section("Campus Wide ID"){
                        TextField("CWID", text: $CWID)
                    }
                    
                    //Section for Email and Passowrd input
                    Section("Email and Password"){
                        TextField("Email Address", text: $email)
                        
                        SecureField("Password",text: $password)
                        SecureField("Re-Enter Password", text: $password2)
                        
                    }
                }.toolbarColorScheme(.dark, for: .bottomBar).ignoresSafeArea().padding(10)
                    .navigationBarBackButtonHidden(true)
                
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
                    Text(newUserStatusErrorMessage)
                    Text("Waiting for error").foregroundColor(.red)
                }
            }
            .navigationDestination(for: String.self) { view in
                if view == "LandingPageView"{
                    LandingPageView()
                }
                if view == "RegistrationView"{
                    RegistrationView()
                }
                else{
                    LoginView()
                }
                
            }
            .alert(alertMessage, isPresented: $showingAlert){
                Button("OK", role: .cancel) {}
            }
        }.onAppear {
            //Check to see if user is logged in when app runs
            //navigate to the new screen and skip login screen
            if FirebaseManager.shared.auth.currentUser != nil {
                print("Login Successful")
                path.append("UserHomeView")
            }
            
        }
    }
          
        
        
        func createNewAccount(email: String, password: String, alertMessage: String) -> String {
            //alertmessage coming in is the correct db description
            //message is what i will be modiftying and pushing out to the view to show the user
            
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
                } else {
                    
                    let fullAlertMessage = "Successfully created user: \(result?.user.uid ?? "0") \n--->\(error?.localizedDescription ?? "0") \n---> \(message)"
//                    print("Failed to Register User user: \(error.localizedDescription) \n---> \(message)"
                    path.append("UserHomeView")
                }
            }
            return message
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
