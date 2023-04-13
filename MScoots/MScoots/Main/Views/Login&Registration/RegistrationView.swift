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
    @ObservedObject var model = Firebase_Authorization()
    @State var user: studentUser? = nil
//    @State var image_: Image?
//    @State var shouldShowImagePicker = false
//    @State var image: UIImage?
//    @State var inputImage: UIImage?
    
    @State var Address = ""
    @State var Street = ""
    @State var City = ""
    @State var ZipCode = ""
    
    @State var CWID = ""
    @State private var email = ""
    //Section for trying to register an email address and password the manual way
    @State private var password = ""
    @State private var password2 = ""
    @State var first_name = ""
    @State var last_name = ""
    
    //variables for errors upon user login attempt
    enum Field {
        case email, password
    }
    // create instance for showing data back to user if user already created
//    @State private var alertMessage = ""
//    @State public var statusMessage = ""
    //  Variables for the alerts back to the user if upon register request see's errors in user input
//    @State private var showingAlert = false
    @State private var isRegisteredUser = false
    
    
    //View Variables
    //  ViewModifying variables
    @State private var buttonsDisabled = true
    @FocusState private var focusField: Field?
    @Environment(\.dismiss) private var dismiss
    
    var comparePasswords: Bool {
        if password == password2 {
            return true
        }
        return false
    }
    
    
    
    
    var body: some View {
        //Navigates to UserHome upon successfull registration
        NavigationView{
            ZStack{
                VStack{
                    List{
                        //MARK: FIREBASE IMPLEMENTATION BASED OFF THIS DATA
                        
                        //TODO: ADD NEW FIELDS FOR FIREBASE IMPLMENTATION: (TO USER CLASS AND THE VIEW          INPUT FIELDS)-PHONE NUMBER < ADDRESS< OHOTO URL, EMAIL VERIFIED, DISPLAYNAME
                        
                        //MARK: CHOOSE WHICH EVER ONES ARE EASIER TO WORK WITH
                        //                    VStack{
                        //
                        //                Button {
                        //                    model.shouldShowImagePicker.toggle()
                        //                } label: {
                        //                    //TODO: Double check the if let image and image styler i made did not message anything up in ViewStyling
                        //                    ProfilePhotoButton()
                        //                        .padding(.leading, 110)
                        //                        .navigationViewStyle(StackNavigationViewStyle())
                        //                        .fullScreenCover(
                        //                            isPresented: $model.shouldShowImagePicker, onDismiss: nil) {
                        //                                ImagePicker(image: $model.inputImage)
                        //                            }
                        //                            .frame(height: 100)
                        //
                        //                            .navigationViewStyle(StackNavigationViewStyle())
                        //
                        //
                        //                }
                        //
                        //
                        //                        HStack{
                        ////                            Section("Profile Photo"){
                        //                            model.image_?.resizable().padding()
                        //                                .scaledToFit()
                        //
                        //                            Spacer()
                        //                            Button("Save Image") {
                        //                                guard let inputImage = model.inputImage else { return }
                        //                                model.image_ = Image(uiImage: inputImage)
                        //                                let imageSaver = ImageSaver()
                        //                                imageSaver.writeToPhotosAlbum(image: inputImage)
                        //
                        //                            }
                        //                            Spacer()
                        //
                        //                            Button("Select Image"){
                        //                                model.shouldShowImagePicker = true
                        //                            }
                        //                            .navigationViewStyle(StackNavigationViewStyle())
                        ////                        }
                        //                    }.fullScreenCover(
                        //                        isPresented: $model.shouldShowImagePicker, onDismiss: nil) {
                        //                            ImagePicker(image: $model.inputImage)
                        //                        }
                        //
                        //                        .sheet(
                        //                            isPresented: $model.shouldShowImagePicker) {
                        //                                ImagePicker(image: $model.inputImage)
                        //                            }
                        //                            .onChange(of: model.inputImage) { _ in loadImage() }
                        //                    .buttonStyle(.bordered).padding(.leading,20).padding(5)
                        //
                        //                }
                        //Section for name input
                        Section("Name") {
                            TextField("First Name",text: $first_name)
                            TextField("Last Name", text: $last_name)
                        }
//                        Section("Address") {
//                            TextField("First Name",text: $first_name)
//                            TextField("Last Name", text: $last_name)
//                        }
//
                        //Section for CWID imput
                        Section("Campus Wide ID"){
                            TextField("CWID", text: $CWID)
                        }
                        
                        //Section for Email and Passowrd input
                        Section("Email"){
                            EmailTextField(email: $email, enableButtons: enableButtons)
                            //                            .focused($focusField, equals: .email)// field bound to the .email case
                            //                            .onSubmit {
                            //                                focusField = .password
                            //                            }
                            //                            .onChange(of: email) { _ in
                            //                                //Enable buttons?
                            //                                enableButtons()
                            //                            }
                        }
                        
                        //                //Section for address
                        //                Section{
                        //
                        //                }
                        
                        //TODO: Figure out why strong password is trying to change during password input
                        Section("Password"){
                            SecurePasswordField(password: $password, email: email, buttonsDisabled: buttonsDisabled, enableButtons: enableButtons)
                            //TODO: See if you can add these options on the section as the groups modifiers and eliminate some code
                            //                            .focused($focusField, equals: .password) /* field bound to the .email case*/
                            //                            .onSubmit {
                            //                                focusField = .password
                            //                            }
                            //                            .onChange(of: password) { _ in
                            //                                //Enable buttons?
                            //                                enableButtons()
                            //                            }
                            
                            
                            SecurePasswordField(password: $password2, email: email, buttonsDisabled: buttonsDisabled, enableButtons: enableButtons)
                            //                            .focused($focusField, equals: .password) /* field bound to the .email case*/
                            //                            .onSubmit {
                            //                                focusField = .password
                            //                            }
                            //                            .onChange(of: password) { _ in
                            //                                //Enable buttons?
                            //                                enableButtons()
                            //                            }
                            
                        }
                        
                        //                    focused($focusField, equals: .password) /* field bound to the .email case*/
                        //                        .onSubmit {
                        //                            focusField = .password
                        //                        }
                        //                        .onChange(of: password) { _ in
                        //                            //Enable buttons?
                        //                            enableButtons()
                        //                        }
                        //                        .padding(5)
                        
                        //            //TODO: REGISTER BUTTON SHOWING ABOOVE AND BELOVE THIS
                        //                Section("Test Variables"){
                        //                    Text("AlertMessage: \(model.alertMessage)")
                        //                    Text("showingAlert: \(String(model.showingAlert_Reg))")
                        //                }
                        
                        
                        if model.showingAlert_Reg{
                            Text("\(model.statusMessage)").foregroundColor(.red).font(.system(size: 25))
                        }
                        //TODO: implement upon successful registration transition to UserHomeView.
                        //TODO: implement upon unsuccesful registration error message is shown to the user
                        
                        
//                        //            TODO: BUTTTON 2
//                        Button {
//                            model.alertMessage = model.registerAccount(email: email, password: password)
//                        } label: {
//                            Text("Register").foregroundColor(.blue)
//                        }
//                        .AddMy_ButtonStyle()
                        // TODO: Test isRegistered logs the user into the account
                        
                        
                        
                        //MARK: ALERTS BACK TO THE USER
                    }
                }
                .padding(.top, 140)
            }
            .ignoresSafeArea()
            
            //Verify that the alert to register account shows the correct information
            .alert("Register Account Message\n\(model.statusMessage)", isPresented: $model.showingAlert_Reg, actions: {})
            .alert("Registration Completed\n\(model.alertMessage)", isPresented: $isRegisteredUser, actions: {
            })
            //MARK: 2 onSubmit calls for auth.signIn
            //TODO: Verify bother work
            .onSubmit {
                if isRegisteredUser{
                    FirebaseManager.shared.auth.signIn(withEmail: email, password: password)
                    model.showingAlert_Reg.toggle()
                    
                }
            }
            .onSubmit {
                if isRegisteredUser{
                    // TODO: Verify that this call to login outputs to the console that the user has been authenticated and all of the proper view variables are correct
                    model.Login(email, password)
                    //                    FirebaseManager.shared.auth.signIn(withEmail: email, password: password)
                    model.showingAlert_Reg.toggle()
                    
                }
            }
            .onSubmit {
                model.alertMessage = model.statusMessage
            }
            
        }.toolbar {
            ToolbarItem(placement: .bottomBar) {
                HStack{
                    //            TODO: BUTTTON 2
                    Button {
                        model.alertMessage = model.registerAccount(email: email, password: password)
                    } label: {
                        Text("Register").foregroundColor(.blue)
                    }
                    .AddMy_ButtonStyle()
                }
            }
        }
        .navigationTitle("Registration")
            
    }
    
   
    struct RegistrationView_Previews: PreviewProvider {
        static var previews: some View {
            //takes in error message so that we can access the login function in model
            NavigationStack{
                RegistrationView()
            }
        }
    }

    
    func enableButtons() {
        let emailIsGood = email.count >= 6 && email.contains("@")
        let passwordIsGood = password.count >= 6
        buttonsDisabled = !(emailIsGood && passwordIsGood)
    }
}


