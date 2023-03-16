//
//  ContentView.swift
//  MScoots
//
//  Created by Justin Trubela on 2/26/23.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    
    
    
    
    
    
    //imports functions for creating user and logging in
    @StateObject var model = DB_Authorization()
    
    
    @State private var isLoggedIn = false
    
    enum Field {
        case email, password
    }
    
    
    @State private var email = ""
    @State private var password = ""
    @State private var showingAlert = false
    @State private var buttonsDisabled = true
    @FocusState private var focusField: Field?
    @Environment(\.dismiss) private var dismiss
    //Create an @State NavigationPath() variable to use in the NavigationStacl
    @State private var path = NavigationPath()
    
    @State public var loginStatusErrorMessage = "0"

//
//    var emptyPath: NavigationPath = {
////        if path.isEmpty
//    }
    
    
    
    
    var body: some View {
        //Navigates to the UserHomeView upon successful login
                    NavigationStack(path: $path){
                    VStack{
                        Image("scooter").colorInvert().colorMultiply(.blue).position(x:155,y:0)
                        ZStack{
                            //add the title to the page
                            
                            //stack for the entire view
                            VStack{

        //Stack for Email addres and password input
            //Text for LoginStatusErrorMessage
                                VStack{
                                    TextField("Email Address", text: $email).AddMyTextFieldEntry()
                                        .keyboardType(.emailAddress)
                                        .autocorrectionDisabled().padding(5)
                                        .textInputAutocapitalization(.never)
                                        .submitLabel(.next)
                                        .focused($focusField, equals: .email)// field bound to the .email case
                                        .onSubmit {
                                            focusField = .password
                                        } .onChange(of: email) { _ in
                                            //Enable buttons?
                                            enableButtons()
                                        }

                                    SecureField("Password", text: $password).AddMyTextFieldEntry()
                                        .textInputAutocapitalization(.never)
                                        .submitLabel(.done)
                                        .focused($focusField, equals: .password) /* field bound to the .email case*/
                                        .onSubmit {
                                            focusField = nil
                                        } .onChange(of: password) { _ in
                                            //Enable buttons?
                                            enableButtons()
                                        }
                                        .padding(5)
/*implement test for login status error message
    
*/
                                    Text(loginStatusErrorMessage).foregroundColor(.red)

                                    
                                    
                                    VStack{
/*implement test for reset password
*/
                                        Button{
                                            
                                        }label:{
                                            Text("Reset Password...").buttonStyle(.borderedProminent)
                                                .underline()
                                                .fontWidth(.expanded)
                                                .foregroundColor(.blue)
                                        }}.buttonStyle(.plain).fontWidth(.expanded)
                                            Rectangle().AddMyDivider()
/*Implement user Login
    
*/
        //Navigation Link to UserHomeView
                                    
                                    Button{
                                       loginStatusErrorMessage = model.login_Registration_InputErrorCheck(email: email, password: password)
                                        
                                        
                                        if isLoggedIn{
                                            path.append("UserHomeView")
                                        }
                                        else{
                                            password = ""
                                        }

                                        
                                    } label: {
                                        Text("Login")
                                        
                                    }.foregroundColor(.blue).AddMy_ButtonSytle()
                                    Text(loginStatusErrorMessage)
                                        .foregroundColor(.red)
                                    Text(email)
                                    Text(password)

                                    
                                    
                                }.shadow(color: .blue, radius: 95).fontWidth(.expanded).foregroundColor(.blue)
                        }.shadow(color:.green,radius: 30,x:5,y:5)
                    }
                            .navigationBarBackButtonHidden().navigationTitle("Log in")
                }.navigationDestination(for: String.self) { view in
                    if view == "UserHomeView" {
                        UserHomeView()
                    }
                }.navigationViewStyle(StackNavigationViewStyle())
            }
                    .navigationBarBackButtonHidden()
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
