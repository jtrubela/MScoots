//
//  ContentView.swift
//  MScoots
//
//  Created by Justin Trubela on 2/26/23.
//

import SwiftUI


struct LoginView: View {
    
    
    @ObservedObject var model = ViewModel()
    //
    
    @State var email = ""
    @State var apassword = ""
    
    @State var loginStatusMessage = ""
    
    //each time a view is satisfied,,,throw a toggle and switch views
    
    
    @State var isAuthenticated = false
    @State var nextView = false
    @State var theNextViewAfterThat = false
    
    var body: some View {
        
        
        //if this view stack reaches an authentication status
        if isAuthenticated == false {
            //show this view

                NavigationView{
                    VStack{
                        Image("scooter").colorInvert().colorMultiply(.blue).position(x:155,y:0)
                    ZStack{
                        VStack{
                        }.navigationTitle("Log in").background(Color.teal)
                        VStack{
                            Rectangle()
                                .AddMyDivider()
                            VStack{
                                TextField("Email Address", text: $email).AddMyTextFieldEntry().padding(5)
                                SecureField("Password", text: $apassword).AddMyTextFieldEntry().padding(5)
                                    Text(loginStatusMessage).foregroundColor(.red)
                                VStack{
                                    
                                    Rectangle().AddMyDivider()
                                    
                                        Button{
                                            
                                        }label:{
                                            Text("Reset Password...").buttonStyle(.borderedProminent)
                                                .underline()
                                                .fontWidth(.expanded)
                                                .foregroundColor(.blue)
                                        }
                                        
                                    
                                }
                                .buttonStyle(.plain)
                                .underline()
                                .fontWidth(.expanded)
                                    
                                            
                                            
                                            Rectangle().AddMyDivider()
                                        NavigationLink("Log in", destination: UserHomeView())
                                    .foregroundColor(.blue)
                                    .AddMy_ButtonSytle()
                                    .padding(.top)
                                Button{
                                    model.loginUser(email: email, password: apassword)
                                } label: {
                                    Text("Admin Login").underline()
                                }.padding(.top, 30)
                                
                                Spacer()
                            }.padding(15)
                                .MakeMyBackground().shadow(color: .blue, radius: 95)
                                .underline()
                                .fontWidth(.expanded)
                                .foregroundColor(.blue)
                        }.shadow(color:.green,radius: 30,x:5,y:5)
                    }.navigationViewStyle(StackNavigationViewStyle()).navigationBarBackButtonHidden()
                }
            }
            if isAuthenticated == true {
                ZStack{
                    Color.blue.MakeRoundedSquareBackground()
                    Text("Testing")
                }
            }
        }
    }
}
    
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView(loginStatusMessage: "")
        }
    }
