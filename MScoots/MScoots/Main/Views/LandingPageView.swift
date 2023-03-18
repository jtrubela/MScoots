//
//  LandingPageView.swift
//  MScoots
//
//  Created by Justin Trubela on 2/27/23.
//

import SwiftUI

struct ViewItem: Identifiable, Hashable {
    let name: String
    let id = NSUUID().uuidString
}

struct LandingPageView: View {
    
    let views: [ViewItem] = [
        .init(name: "LoginView"),
        .init(name: "RegistrationView"),
        .init(name: "UserHomeView"),
        .init(name: "ScooterListView"),
    ]
    
    
    @ObservedObject var model = DB_Authorization()
    
    
    //
    @State private var loginClicked = false
    @State private var path = [ViewItem]()
    @State private var showFullStack = false
    
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
                                NavigationLink(value: views[0], label: {
                                    Text("Log In").foregroundColor(.red)
                                }).Add_LoginView_ButtonStyle()
                            }
                            Rectangle()
                                .AddMyDivider().shadow(color: .red ,radius: 30)
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
                                    newUser()
                                    //                                                            path.append("RegistrationView")
                                    //click on button
                                    // enters function body -
                                    //  isNewUser = true
                                    //  append registrationView to path
                                    //  end button function
                                    //  reach the end of the program
                                    //      hit navigationDestination
                                    //          for STRING.SELF ----WTF is that and how can i see what the data loooks like....i hate self references...still dont know how they are just able to say heyyyyy i can point to myself and do something
                                    // each view in path? --- if isNewUser -> RegistrationView?
                                } label: {
                                    NavigationLink(value: views[0], label: {
                                        Text("Create an account!")
                                    }).AddMyNavigationViewStyler()
                                    
                                }
                                Spacer()
                                
                            }
                        }
                    }
                    
                    .navigationDestination(for: ViewItem.self) { view in
                        ViewForItem(view)
                        if loginClicked{
                            
                        }
                    }
                    
                    
                    //Customize views for specific users
                    //                Button {
                    //                    showFullStack.toggle()
                    //                    if showFullStack {
                    //                        path = brands
                    //                    } else {
                    //                        path = [brands[0], brands[2], brands[1]]
                    //                    }
                    //                } label: {
                    //                    Text("View All")
                    //                }
                }
            }
        }
        
    }
    
    func ViewForItem(_ view: ViewItem) -> AnyView {
        switch view.name {
        case "LoginView":
            return AnyView(Color(.systemGreen))
        default:
            return AnyView(Color(.systemPink))
        }
    }
    
    func newUser(){
        isNewUser.toggle()
        isCurrentUser = false
        
        //                path.append("RegistrationView")
    }
    
    
    
    struct LandingPageView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationStack{
                LandingPageView()
            }
        }
    }
}




