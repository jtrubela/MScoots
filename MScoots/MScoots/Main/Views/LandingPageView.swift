//
//  LandingPageView.swift
//  MScoots
//
//  Created by Justin Trubela on 2/27/23.
//

import SwiftUI

struct LandingPageView: View, Hashable {
    
    var body: some View {
        NavigationView{
            
            
            ZStack{
                Color.black.ignoresSafeArea()
                
                
                
                VStack{
                    Rectangle()
                        .MakeLoginView_Background_Style()
                }
                
                
                
                
                VStack{
                    
                    
                    
                    Text("MS Scoots")
                        .foregroundColor(.white)
                        .font(.system(size: 70, weight: .bold, design: .rounded))
                    
                    
                    
                    Spacer()
                    
                    
                    VStack{
                        
                        
                        VStack{
                            
                            
                            Spacer()
                            
                            
                            Image("scooter").animation(.easeIn)
                            
                            
                            Spacer()
                            
                            
                            Rectangle()
                                .AddMyDivider()
                        }
                        
                        
                        
                        VStack{
                            Text("Have an account?")
                                .bold()
                                .foregroundColor(.white)
                            
                            
                            
                            
                            NavigationLink("Log In", destination: LoginView(loginStatusMessage: ""))
                                .Add_LoginView_ButtonStyle()
                                .shadow(color: .red ,radius: 30)
                            
                            
                            
                            Rectangle()
                                .AddMyDivider()
                            
                            
                            
                            VStack{
                                Text("Don't have an account?")
                                    .bold()
                                    .foregroundColor(.white)
                                
                                
                                NavigationLink("Create an account", destination: RegistrationView(newUserStatusMessage: ""))
                                    .AddMyNavigationViewStyler()
                            }
                        }
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct LandingPageView_Previes: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
