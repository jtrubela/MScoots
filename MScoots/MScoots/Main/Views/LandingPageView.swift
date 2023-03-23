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
    
    @State var animate: Bool = false
    let animation: Animation = Animation.linear(duration: 10.0).repeatForever(autoreverses: false)
    
    @State private var animationAmount = 0.0
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
                    VStack{
                        Text("MS Scoots")
                            .foregroundColor(.white)
                            .font(.system(size: 70, weight: .bold, design: .rounded))
                    }
                    Spacer()
                    ZStack{
                        Spacer()
                        
                        
                        
                        
                        
                        
                        
                        
                        GeometryReader { geo in
                                    HStack(spacing: -1) {
                                        ZStack{
                                            ZStack{
                                                Image("scooter")
                                                Image("rocky").position(x:200,y:140)
                                                    .scaleEffect(x:2.5,y:1.6)
                                            }
                                            Image("smoke-effect").position(x:30,y:215).scaleEffect(x:1.0)
                                        }
                                            .aspectRatio(contentMode: .fit)
                                    }.frame(width: geo.size.width, height: geo.size.height,
                                           alignment: animate ? .trailing : .leading)}
                            .onAppear {withAnimation(animation) {animate.toggle()} }
                        
                        
//                        Image("scooter")
                        
                        
//                        GeometryReader { geo in
//                                    HStack(spacing: -1) {
//                                        Image("smoke-effect")
//                                            .aspectRatio(contentMode: .fit)
//                                    }.frame(width: geo.size.width, height: geo.size.height,
//                                           alignment: animate ? .trailing : .leading)}.ignoresSafeArea()
//                                        .onAppear {withAnimation(animation) {animate.toggle()} }
                        
                        
                        
                        
                    }
                    Spacer()
                    VStack{
                        Rectangle()
                            .AddMyDivider()
                    }
                    
                    VStack{
                        Text("Have an account?")
                            .bold()
                            .foregroundColor(.white)
                        
                        NavigationLink("Login", destination: LoginView())
                        
                            .Add_LoginView_ButtonStyle()
                        
                        Rectangle()
                            .AddMyDivider()
                        
                        VStack{
                            Text("Don't have an account?")
                                .bold()
                                .foregroundColor(.white)
                            Button{
                                shouldShowRegistrationSheet.toggle()
                                //                                    pathway.append(ViewItem(name:"RegistrationView"))
                            } label: {
                                NavigationLink("Create an Account", destination: RegistrationView())
                                
                            }.onChange(of: shouldShowRegistrationSheet) { newValue in
                                
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



struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}






//    struct ViewItem: Identifiable, Hashable {
//        let name: String
//        let id = NSUUID().uuidString
//    }
//
//    let views: [ViewItem] = [
//        .init(name: "LandingPageView"),
//        .init(name: "LoginView"),
//        .init(name: "RegistrationView"),
//        .init(name: "UserHomeView"),
//        .init(name: "ResetPasswordView"),
//        .init(name: "AdminUserHomeView"),
//        .init(name: "ScanQRView"),
//        .init(name: "ScooterListView"),
//        .init(name: "ScootMapView"),
//        .init(name: "MyScootsView"),
//        .init(name: "UserProfile_SettingsView"),
//        .init(name: "WalletView"),
//            //AdminScooterManagerView
//            //AdminUserManagerView
//            //AdminFindScooterView
//            //Admin.....
//    ]

//    @State private var pathway = [ViewItem]()


//
//    @State private var count = 0
//
//    var viewCountEasterEgg: Int {
//        if isNewUser {
//            count+=1
//        }
//        return count
//    }

//Anytime the views get logged out and return back to landing it should reset
//    var startState: Bool {
//            if (count == 0 && isNewUser == false && isCurrentUser == false) {
//                count = 0
//                return true }
//            isNewUser=false
//            isCurrentUser=false
//            shouldShowRegistrationSheet=false
//        return false
//    }

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


//update alertMessage variables
//    func switchUserValues(){
//        func currentUser(){
//            isCurrentUser.toggle()
//            isNewUser.toggle()
//            count+=1
//        }
//        func newUser(){
//            isNewUser.toggle()
//            isCurrentUser.toggle()
//            count+=1
//        }
//    }

//    func ViewForItem(_ view: ViewItem) -> AnyView {
//        switch view.name {
//        case "LandingPageView":
//            return AnyView(LandingPageView())
//        case "LoginView":
//            return AnyView(LoginView())
//        case "RegistrationView":
//            return AnyView(RegistrationView())
//        case "UserHomeView":
//                return AnyView(UserHomeView())
//        case "ResetPasswordView":
//            return AnyView(ResetPasswordView())
//        case "AdminUserHomeView":
//            return AnyView(AdminUserHomeView())
//        case "ScanQRView":
//            return AnyView(ScanQRView())
//        case "ScooterListView":
//            return AnyView(ScooterListView())
//        case "ScootMapView":
//            return AnyView(ScootMapView())
//        case "MyScootsView":
//            return AnyView(MyScootsView())
//        case "UserProfile_SettingsView":
//            return AnyView(UserProfile_SettingsView())
//        case "WalletView":
//            return AnyView(WalletView())
//        default:
//            return AnyView(LandingPageView())
//        }
//    }
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

//Stack for Navigation to Login or Register Views

//                            Button{
//                                withAnimation{
//                                    animationAmount += 360
//                                }
//                            }label :{

//                            }.animation(
//                                .interpolatingSpring(stiffness: 2, damping: 10), value: animationAmount)
//                            .rotation3DEffect(.degrees(animationAmount), axis: (x:0.0,y:1.0,z:0.0)
//                            )
//                        Button{
//                            //TODO:
////                            isCurrentUser()
//                        } label: {
//                        }
