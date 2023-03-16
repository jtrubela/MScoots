//
//  LandingPageView.swift
//  MScoots
//
//  Created by Justin Trubela on 2/27/23.
//

import SwiftUI

struct LandingPageView: View {
    
    //Create an @State NavigationPath() variable to use in the NavigationStacl
    @State private var path = NavigationPath()
    
    @State private var isNewUser = false
    @State private var isCurrentUser = false
    
    
    var body: some View {
        //Navigates to either Login or Registration
        
        /*---------------------------------------------------------------------------------------------------------------------*/
        //
        //
        //          View Stack - Navigation stack goes to goes to different locations based on the type of user:
        //              -current user
        //              -new user
        //              --(admin) still not figured out yet
        /*
         Implement admin functionality
         -- still waiting on lenny to push that document
         
         */
        //
        //
        /*---------------------------------------------------------------------------------------------------------------------*/
        
        NavigationStack(path: $path){
            ZStack{
                Color.black.ignoresSafeArea()
                
                Rectangle().MakeLoginView_Background_Style()
                //Stack for Title and Image
                VStack{
                    
                    Text("MS Scoots").foregroundColor(.white)
                        .font(.system(size: 70, weight: .bold, design: .rounded))
                    
                    Spacer()
                    //Stack for Navigation to Login or Register Views
                    VStack{
                        VStack{
                            Spacer();  Image("scooter").animation(.easeIn);    Spacer()
                            Rectangle()
                                .AddMyDivider()
                        }
                        /*--------------------------------------------------------------------------------------------------------------/
                         //
                         //
                         //                              TOP OF THE STACK
                         //
                         //
                         /--------------------------------------------------------------------------------------------------------------*/
                        //Registration Stack
                        // If clicked its closest to the creation of the stack
                        /*---------------------------------------------------------------------------------------------------------------------/
                         //
                         //
                         //          Login Stack - Navigation stack goes to LoginView
                         //
                         //                            //Stack for login to acccount
                         //Navigation link to LoginView
                         //Passes in errorStatusMessage
                         //
                         /---------------------------------------------------------------------------------------------------------------------*/
                        VStack{
                            Text("Have an account?")
                                .bold()
                                .foregroundColor(.white)
                            Button{
                                
                                
//                                path.append("LoginView")
                                
                            } label: {
                                Text("Log In").Add_LoginView_ButtonStyle()
                            }
                            Rectangle()
                                .AddMyDivider().shadow(color: .red ,radius: 30)
                        }
                        
                        
                        /*--------------------------------------------------------------------------------------------------------------*/
                        //
                        //
                        /*--------------------------------------------------------------------------------------------------------------*/
                        
                        
                        //Registration Stack
                        // If clicked its closest to the navigation destination stack
                        /*
                         --------------------------------------------------------------------------------------------------------------
                         //
                         //
                         //          Registration Stack - Navigation stack goes to RegistrationView
                         //
                         //
                         //      Stack for create an account
                         //      Navigation link to RegistrationView
                         //      Passes in errorStatusMessage
                         --------------------------------------------------------------------------------------------------------------*/
                        VStack{
                            Text("Don't have an account?")
                                .bold()
                                .foregroundColor(.white)
                            Button{
                                newUser()
                            } label: {
                                Text("Create an account!")
                                    .AddMyNavigationViewStyler()
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: String.self) { view in
                
                if  view == "RegistrationView"{
                    RegistrationView()
                    
                }
                if view == "LoginView" {
                    LoginView()
                }
            }
            //only for login view
//            .onAppear {
//
//            }
//
        }
        
    }
    
    
    func newUser(){
                isNewUser.toggle()
                isCurrentUser = false
                
                path.append("RegistrationView")
    }
    
    
}
    
    struct LandingPageView_Previes: PreviewProvider {
        static var previews: some View {
                LandingPageView()

        }
    }

