//
//  ContentView.swift
//  MScoots
//
//  Created by Justin Trubela on 2/26/23.
//

import SwiftUI

struct LoginView: View {
    
    
    @ObservedObject var model = ViewModel()
    
    
    @State var isLoggedIn = false
    
    
    
    @State var email = ""
    @State var password = ""
    
    
    @State var loginStatusMessage: String
    


    
    var body: some View {
        
        
        VStack{
            
            
            NavigationView{
                
                
                ZStack{
                    
                    
                    VStack{
                        
                        
                    }.navigationTitle("Log in")
                    
                    
                    
                    VStack{
                        
                        
                        Rectangle()
                            .AddMyDivider()
                        
                        
                        
                        VStack{
                            
                            
                            TextField("Email Address", text: $email).AddMyTextFieldEntry().padding(15)
                            SecureField("Password", text: $password).AddMyTextFieldEntry()
                                .padding(15)
                            
                            
                        }
                        .padding(16)
                        
                        
                        Rectangle()
                            .AddMyDivider()
                        
                        VStack{

                            
                            VStack(spacing: 20){
                                
                                
                                Button{
                                    model.loginUser(email: email, password: password)
                                } label: {
                                    Text("Sign In Auth Test")
                                }
                                Text(loginStatusMessage)
                                    .foregroundColor(.red)
                                
                                
                                
                                NavigationLink("Log in", destination: UserHomeView())
                                    .buttonStyle(.plain)
                            }
                        }
                        
                        
                    }.padding(5)
                        .MakeMyBackground()
                    
                }
                
                
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(loginStatusMessage: "")
    }
}
