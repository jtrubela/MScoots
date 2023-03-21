//
//  LandingPageView.swift
//  MScoots
//
//  Created by Justin Trubela on 2/27/23.
//

import SwiftUI

struct LandingPageView: View {
    @State private var shouldShowRegistrationSheet = false
    
    @State private var isNewUser = false
    @State private var isCurrentUser = false
    
    @Environment(\.dismiss) var dismiss
    
    
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
        
        NavigationView{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                
                Rectangle()
                    .MakeLoginView_Background_Style()
                //Stack for Title and Image
                VStack{
                    
                    Text("MS Scoots")
                        .foregroundColor(.white)
                        .font(.system(size: 70, weight: .bold, design: .rounded))
                    
                    Spacer()
                    //Stack for Navigation to Login or Register Views
                    VStack{
                        VStack{
                            Spacer()
                            Image("scooter")
                                .animation(.easeIn)
                            Spacer()
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
                                //TODO:
                                currentUser()
                            } label: {
                                NavigationLink("Login", destination: LoginView())
                            }
                            .Add_LoginView_ButtonStyle()
                            
                            Rectangle()
                                .AddMyDivider()
                            /*--------------------------------------------------------------------------------------------------------------*/
                            //                        //
                            //                        //
                            //                        /*--------------------------------------------------------------------------------------------------------------*/
                            //
                            //
                            //                        //Registration Stack
                            //                        // If clicked its closest to the navigation destination stack
                            //                        /*
                            //                         --------------------------------------------------------------------------------------------------------------
                            //                         //
                            //                         //
                            //                         //          Registration Stack - Navigation stack goes to RegistrationView
                            //                         //
                            //                         //
                            //                         //      Stack for create an account
                            //                         //      Navigation link to RegistrationView
                            //                         //      Passes in errorStatusMessage
                            //                         --------------------------------------------------------------------------------------------------------------*/
                            
                            VStack{
                                Text("Don't have an account?")
                                    .bold()
                                    .foregroundColor(.white)
                                Button{
                                    shouldShowRegistrationSheet.toggle()
                                    newUser()
                                } label: {
                                    NavigationLink("Create an Account", destination: RegistrationView())
                                }.sheet(isPresented: $shouldShowRegistrationSheet, content: {
                                    RegistrationView()
                                })
                                .navigationViewStyle(StackNavigationViewStyle())
                                                        .fullScreenCover(
                                                            isPresented: $shouldShowRegistrationSheet, onDismiss: nil) {
                                                    
                                                        }
                                                            .frame(height: 120)
                                .AddRegisterAccountButton()
                                Spacer()
                            }
                        }
                    }
                }
            }
        }
    }

    //update alertMessage variables
    func currentUser(){
        isCurrentUser.toggle()
        isNewUser = false
    }
    func newUser(){
        isNewUser.toggle()
        isCurrentUser = false
    }
    
    struct LandingPageView_Previews: PreviewProvider {
        static var previews: some View {
                LandingPageView()
        }
    }
}




