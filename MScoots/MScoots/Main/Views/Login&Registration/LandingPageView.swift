//
//  LandingPageView.swift
//  MScoots
//
//  Created by Justin Trubela on 2/27/23.
//

import SwiftUI

struct LandingPageView: View {
    //View variables
    
    //Animation variables for scooter
    @State var animate: Bool = false
    let animation: Animation = Animation.linear(duration: 10.0).repeatForever(autoreverses: false)
    @State private var animationAmount = 0.0
    
    
    //StateObject accessing these variables in this view
    @StateObject var model = Firebase_Authorization()
    //@State public var showingAlert: Bool
    //@State public var statusErrorMessage: String
    //@State private var isLoggedIn = false
    //@State private var isAdmin = false
    //@State private var selection: String? = nil
    

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
                                            .position(x:210,y:150)
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
                        NavigationLink("Reset Password", destination: ResetPasswordView())
                            .fontWeight(.bold)

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

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
