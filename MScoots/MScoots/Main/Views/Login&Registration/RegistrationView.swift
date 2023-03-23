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
    
    @State var image_: Image?
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    @State var inputImage: UIImage?
    
    @State var CWID = ""
    @State var first_name = ""
    @State var last_name = ""
    
    //Section for trying to register an email address and password the manual way
    @State private var email = ""
    @State private var password = ""
    @State private var password2 = ""
    //variables for errors upon user login attempt
    enum Field {
        case email, password
    }
    // create instance for showing data back to user if user already created
    @State private var alertMessage = ""
    @State public var statusMessage = ""
    //  Variables for the alerts back to the user if upon register request see's errors in user input
    @State private var showingAlert = false
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
        VStack {
            
            List{
                /*
                 implement firestore data storage for these section variables
                 
                 */
                    Button {
                        shouldShowImagePicker.toggle()
                    } label: {
                        
                        VStack{

                            if let image_ = self.inputImage {
                                Image(uiImage: image_)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 128, height: 128)
                                    .cornerRadius(64)
                            } else {
                                Image(systemName: "person.fill")
                                    .font(.system(size: 64))
                                    .padding()
                                    .foregroundColor(Color(.label))
                                    .overlay(RoundedRectangle(cornerRadius: 64)
                                        .stroke(Color.black, lineWidth: 3)
                                    )
                            }
                        }.padding(.leading, 110)
                        .navigationViewStyle(StackNavigationViewStyle())
                        .fullScreenCover(
                            isPresented: $shouldShowImagePicker, onDismiss: nil) {
                                ImagePicker(image: $inputImage)
                            }
                            .frame(height: 100)

                            .navigationViewStyle(StackNavigationViewStyle())
                            
                        
                    }
                    //Section for name input
                    Section{
                        image_?.resizable()
                            .scaledToFit()
                        
                        HStack{
                            
                            Button("Save Image") {
                            guard let inputImage = inputImage else { return }
                            image_ = Image(uiImage: inputImage)
                            let imageSaver = ImageSaver()
                            imageSaver.writeToPhotosAlbum(image: inputImage)
                            
                        }
                            Spacer()
                            
                            Button("Select Image"){
                                shouldShowImagePicker = true
                            }
                            .navigationViewStyle(StackNavigationViewStyle())
                            .fullScreenCover(
                                isPresented: $shouldShowImagePicker, onDismiss: nil) {
                                    ImagePicker(image: $inputImage)
                                }
                            //                                .frame(height: 120)
                            
                                .sheet(
                                    isPresented: $shouldShowImagePicker) {
                                        ImagePicker(image: $inputImage)
                                    }.onChange(of: inputImage) { _ in loadImage() }
                        }.buttonStyle(.bordered).padding(.leading,20).padding(5)
                        
                        
                        
                        
                    }
                    Section("Name") {
                        TextField("First Name",text: $first_name)
                        TextField("Last Name", text: $last_name)
                    }
                    
                    //Section for CWID imput
                    Section("Campus Wide ID"){
                        TextField("CWID", text: $CWID)
                    }
                    
                    //Section for Email and Passowrd input
                    Section("Email"){
                        TextField("Email Address", text: $email)
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
                    }
                    Section("Password"){
                        SecureField("Password",text: $password)
                            .textInputAutocapitalization(.never)
                            .submitLabel(.done)
                            .focused($focusField, equals: .password) /* field bound to the .email case*/
                            .onSubmit {
                                focusField = .password
                            }
                            .onChange(of: password) { _ in
                                //Enable buttons?
                                enableButtons()
                            }
                            .padding(5)
                        SecureField("Re-Enter Password", text: $password2)
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
                        
                    }
                    Section("Test Variables"){
                        Text("AlertMessage: \(alertMessage)")
                        Text("showingAlert: \(String(showingAlert))")
                    }
                }
                
                Section{
                    if showingAlert{
                        Text("\(statusMessage)").foregroundColor(.red).font(.system(size: 25))
                    }
                }
                
                /* implement upon successful registration transition to UserHomeView
                 implement upon unsuccesful registration error message is shown to the user
                 
                 */
                Button {
                    alertMessage = registerAccount(email: email, password: password)
                    //                    statusErrorMessage = registerAccount(email: email, password: password)
                } label: {
                    //                NavigationLink("Register", destination: LandingPageView(), isActive: $isRegisteredUser)
                                    Text("Register").foregroundColor(.blue)
                }.AddMy_ButtonSytle()
                    .onSubmit {
                        alertMessage = statusMessage
                    }
                
            }.alert("Registration Completed\n\(alertMessage)", isPresented: $isRegisteredUser, actions: {
            })
            .onSubmit {
                if isRegisteredUser{
                    FirebaseManager.shared.auth.signIn(withEmail: email, password: password)
                    showingAlert.toggle()
                    
                }
            }
            .alert("Register Account Message\n\(statusMessage)", isPresented: $showingAlert, actions: {})
            .onSubmit {
                if isRegisteredUser{
                    FirebaseManager.shared.auth.signIn(withEmail: email, password: password)
                    showingAlert.toggle()
                
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
    image_ = Image(uiImage: inputImage)
        
        UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil)
    }
    func enableButtons() {
        let emailIsGood = email.count >= 6 && email.contains("@")
        let passwordIsGood = password.count >= 6
        buttonsDisabled = !(emailIsGood && passwordIsGood)
    }
    
    
    func registerAccount(email: String, password: String) -> String {
        var message = ""
        statusMessage = message
        
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { (authResult, error) in
            if let maybeError = error { //if there is an error, handle it
                showingAlert.toggle()
                let err = maybeError as NSError
                switch err.code {
                    //PASSWORD
                case AuthErrorCode.weakPassword.rawValue:
                    // Error: The password must be 6 characters long or more.
                    message = "Weak Password: must be 6 characters long or more"
                    statusMessage = message
                    print(message)
                    //INVALID EMAIL
                case AuthErrorCode.invalidEmail.rawValue:
                    message = "email address is  badly formatted"
                    statusMessage = message
                    print(message)
                    //CREDENTIALS TAKEN
                case AuthErrorCode.accountExistsWithDifferentCredential.rawValue:
                    message = "Credentials Already taken"
                    statusMessage = message
                    print(message)
                    //EMAIL TAKEN
                case AuthErrorCode.emailAlreadyInUse.rawValue:
                    message = "Email is already taken. Choose another"
                    statusMessage = message
                    print(message)
                    
                    //USER DISABLED
                case AuthErrorCode.userDisabled.rawValue:
                    message = "User has been disabled. Please contact support for further instructions - JT"
                    statusMessage = message
                    print(message)
                    //MISSING EMAIL
                case AuthErrorCode.missingEmail.rawValue:
                    message = "Missing the email field"
                    statusMessage = message
                    print(message)
                    
                default:
                    message = "Error: \(err.localizedDescription)"
                    statusMessage = message
                    print(message)
                }
            }
            else {
                if (FirebaseManager.shared.auth.currentUser != nil) {
                    let newUserInfo = FirebaseManager.shared.auth.currentUser
                    //                    print(String(newUserInfo?.uid ?? "nnn"))
                    //                    print(String(newUserIn.isEmailVerified) ?? String(true)))
                    //                    print(String(newUserInfo.providerID)
                    //                    print(String(newUserInfo)
                    //                    print(String(newUserInfo?.displayNa?? "d.sn"))
                    //                    print(String(newUserInfo?.phoneNumber ?? "p#"))
                    alertMessage = "User has been successfully created!\nUID:\(String(describing: newUserInfo?.uid)),\(String(describing: newUserInfo?.email))"
                    //                    isRegisteredUser = true
                    print(alertMessage)
                    
                    let email = newUserInfo?.email
                    statusMessage = "User\(newUserInfo?.uid ?? "--uid---") signed up successfully with email: \(String(describing: email))"
                    print(message)
                }
            }
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
