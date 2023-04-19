//
//  LandingPageView.swift
//  MScoots
//
//  Created by Justin Trubela on 2/27/23.
//

import SwiftUI
import Firebase
import FirebaseAuth



struct LandingPageView: View {
    //View variables
    
    //Animation variables for scooter
    @State var animate: Bool = false
    let animation: Animation = Animation.linear(duration: 10.0).repeatForever(autoreverses: false)
    @State private var animationAmount = 0.0
    
    
    //StateObject accessing these variables in this view
    @StateObject var model = Firebase_Authorization()

    //show registration sheet action listener
    @State private var shouldShowRegistrationSheet = false
    @Environment(\.dismiss) var dismiss
    

    //User input fields to verify against the db
    enum Field {
        case email, password
    }
    @State private var email = ""
    @State private var password = ""
    
    //variables for changing focus on fields
    @FocusState private var focusField: Field?
    @State private var buttonsDisabled = true
    
    
    // Registration Sheet View
    @State public var showRegistrationSheet = false

    

    var body: some View {
        //Navigates to either Login or Registration
        
        /*---------------------------------------------------------------------------------------------------------------------*/
        //
        //
        //
        //
        /*---------------------------------------------------------------------------------------------------------------------*/
        
        NavigationView{
            ZStack{
                Color.black.ignoresSafeArea()
                
                Rectangle()
                    .MakeLoginView_Background_Style()
                
                
                //Stack for Title and Image
                VStack{
                    //Title
                    Text("MS Scoots")
                        .foregroundColor(.white)
                        .font(.system(size: 65, weight: .bold, design: .rounded))
                    //Animation
                    ZStack{
                        //Animation
                        GeometryReader { geo in
                            HStack(spacing: -5) {
                                ZStack{
                                    ZStack{
                                        Image("scooter")
                                        Image("rocky")
                                            .position(x:160,y:105)
                                            .scaleEffect(x:2.5,y:1.6)
                                    }
                                    Image("smoke-effect")
                                        .position(y:185).scaleEffect(x:1.0)
                                }
                                .aspectRatio(contentMode: .fit)
                            }
                            .frame(width: geo.size.width, height: geo.size.height,
                                   alignment: animate ? .trailing : .leading)
                        }
                        .onAppear {withAnimation(animation) {animate.toggle()} }

                    }
                                         
                    Rectangle().AddMyDivider()

                    Text("Have an account?").AddLandingFieldText()
                    //Login
                    
                    //Login and Registration
                    VStack{
                        //Email and Password Fields
                        VStack{
                            //Email
                            EmailTextField(email: $email, enableButtons: enableButtons).foregroundColor(.black)
                                .focused($focusField, equals: .email)// field bound to the .email case
                                .onSubmit {
                                    focusField = .password
                                }
                                .onChange(of: email) { _ in
                                    //Enable buttons?
                                    enableButtons()
                                }
                            //Password
                            SecurePasswordField(password: $password, email: email, buttonsDisabled: buttonsDisabled, enableButtons: enableButtons).foregroundColor(.black)
                                .focused($focusField, equals: .password) /* field bound to the .email case*/
                                .onSubmit {
                                    focusField = .password
                                }
                                .onChange(of: password) { _ in
                                    //Enable buttons?
                                    enableButtons()
                                }
                        }
                        
                        //Test for login status error message
                        //if login auth sends back an error
                        //display it in either red or blue depending on severity of error
                        Text(model.statusErrorMessage).foregroundColor(model.showingAlert ? .red : .blue ).frame(width: 320, height: 30, alignment: .center)
                       //if authenticated and is admin login
                        //switch to admin view
                        if model.isLoggedIn && model.isAdmin{
                            NavigationLink("",destination: AdminUserHomeView(), tag: "Admin", selection: $model.selection)
                        }
                        
                        //if not go to user view
                        if model.isLoggedIn{
                            NavigationLink("", destination: UserHomeView(), tag: "User", selection: $model.selection)
                        }
                        //if email has 6 or more characters and contains @ symbol
                        
                        if (email.count >= 6 && email.contains("@")){
                            Button{model.Login(email,password)
                            }label:{LandingViewLoginButton1()}
                        }
                        //set the button to clickable otherwise unclickable
                        else{
                            LandingViewLoginButton2()
                        }
                    }
                    //Reset PW or create an account
                    Section{
                        Rectangle()
                            .AddMyDivider()
                        //Registration
                        //Forgot Password
                        Text("Forgot your password?")
                            .AddLandingFieldText()

                        //TODO: implement test for reset password
                        Button{
                            showRegistrationSheet.toggle()
                        } label: {
                            Text("Reset Password")
                                .fontWeight(.bold)
                        }

                        Spacer()
                        //Register
                        Text("Don't have an account?")
                            .AddLandingFieldText()
                        //if clicked, show registration sheet
                        Button{
                            shouldShowRegistrationSheet.toggle()
                        } label: {
                            Text("Create an Account")
                                .fontWeight(.bold)
                                .underline(true,color:.blue)
                        }
                        Spacer()
                        //Show registration on change
                        .sheet(isPresented: $shouldShowRegistrationSheet, content: {
                            RegistrationView()
                        })
                        .navigationViewStyle(StackNavigationViewStyle())
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func enableButtons() {
        let emailIsGood = email.count >= 6 && email.contains("@")
        let passwordIsGood = password.count >= 6
        buttonsDisabled = !(emailIsGood && passwordIsGood)
    }

}


struct RegistrationView: View {
    //ModelView Values-functionality
    //imports functions needed to register
    @ObservedObject var model = Firebase_Authorization()
    @State var user: studentUser? = nil
    @State var statusMessage = "Test message"
    
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
        
            ZStack{
                NavigationView{
                    VStack{
                        List{
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
                        Section("Email"){
                            EmailTextField(email: $email, enableButtons: enableButtons)
                                                        .focused($focusField, equals: .email)// field bound to the .email case
                                                        .onSubmit {
                                                            focusField = .password
                                                        }
                                                        .onChange(of: email) { _ in
                                                            //Enable buttons?
                                                            enableButtons()
                                                        }
                        }

                        //TODO: Figure out why strong password is trying to change during password input
                        Section("Password"){
                            SecurePasswordField(password: $password, email: email, buttonsDisabled: buttonsDisabled, enableButtons: enableButtons)
                            //TODO: See if you can add these options on the section as the groups modifiers and eliminate some code
                                                        .focused($focusField, equals: .password) /* field bound to the .email case*/
                                                        .onSubmit {
                                                            focusField = .password
                                                        }
                                                        .onChange(of: password) { _ in
                                                            //Enable buttons?
                                                            enableButtons()
                                                        }
                            
                            
                            SecurePasswordField(password: $password2, email: email, buttonsDisabled: buttonsDisabled, enableButtons: enableButtons)
                                                        .focused($focusField, equals: .password) /* field bound to the .email case*/
                                                        .onSubmit {
                                                            focusField = .password
                                                        }
                                                        .onChange(of: password) { _ in
                                                            //Enable buttons?
                                                            enableButtons()
                                                        }
                            
                        }
                        

                            
                        //TODO: implement upon successful registration transition to UserHomeView.
                        //TODO: implement upon unsuccesful registration error message is shown to the user
                        
                        Button {
                            model.statusErrorMessage = model.registerAccount(email: email, password: password)
                            model.statusMessagee = model.registerAccount(email: email, password: password)
                            

                            
                            model.showingAlert_Reg.toggle()
                                                        
                        } label: {
                                Section{
                                    
                                    Text("Register").buttonStyle(.borderedProminent)
                                        .foregroundColor(.blue)
                                } header:{
                                    if model.showingAlert_Reg{
                                        Text("\(model.statusErrorMessage)").foregroundColor(.red)
                                    }
                                }
                                .padding(.leading,70)
                        }
                    
                        }
                        .navigationBarTitle("Registration")
                        
                }
            }
            .ignoresSafeArea()
            
            //Verify that the alert to register account shows the correct information
//            .alert("Register Account Message\n\(model.statusMessagee)", isPresented: $model.showingAlert_Reg, actions: {})
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
                if !isRegisteredUser{
                    // TODO: Verify that this call to login outputs to the console that the user has been authenticated and all of the proper view variables are correct
                    model.Login(email, password)
                    model.showingAlert_Reg.toggle()
                    
                }
            }
            .onSubmit {
                model.alertMessage = model.statusMessagee
            }
            
        }

        .navigationTitle("Registration")
            
    }
    
   
//    struct RegistrationView_Previews: PreviewProvider {
//        static var previews: some View {
//            //takes in error message so that we can access the login function in model
//            NavigationStack{
//                RegistrationView()
//            }
//        }
//    }

    
    func enableButtons() {
        let emailIsGood = email.count >= 6 && email.contains("@")
        let passwordIsGood = password.count >= 6
        buttonsDisabled = !(emailIsGood && passwordIsGood)
    }
}





struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
