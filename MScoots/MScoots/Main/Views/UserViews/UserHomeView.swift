//
//  UserHomeView.swift
//  MScoots
//
//  Created by Justin Trubela on 2/26/23.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct UserHomeView: View{
    
    //    @State private var dropDownMenu = false
    @State private var model = DB_Authorization()
    
    
    var body: some View {
        //Navigates to a buttons location
        NavigationView{
            ZStack{
                Color.init(red: 0.9, green: 0.0, blue: 0.1).ignoresSafeArea()
                //Stack for elements-
                //      1) Title and Hamburger
                //      2) User Buttons
                //      3) Nav Bar Buttons
                VStack{
                    
                    VStack{
                        //STACK 1.1 -- Title and Hamburger
                        //Stack for Title and Hamburger Menu
                        HStack{
                            VStack{
                                Text("Home")
                                    .font(.system(size: 32))
                                    .fontWeight(.bold).padding(.leading, 30)
                            }
                            Spacer()
                            VStack{
                                Button{}label:{
                                    Image(systemName: "person.fill").font(.system(size: 30))
                                }
                                .font(.system(size: 34))
                                .padding()
                                .foregroundColor(Color(.label))
                                .overlay(RoundedRectangle(cornerRadius: 64)
                                    .stroke(Color.black, lineWidth: 3)
                                )
                                Text("Profile").font(.headline)

                            }.padding(.leading,120)
                            Spacer()
                            /*
                             //                            Button{
                             //                                dropDownMenu.toggle()
                             //                            } label: {
                             //                                Image(systemName: "line.3.horizontal")
                             //                                    .addMyHambugerMenuStyler()
                             //                            }
                             //                            .font(.system(size: 30))
                             
                             //                                .frame(width: 50, height :50)
                             //                            .sheet(isPresented: $dropDownMenu, content: {
                             //                                //List stack for drop down menu items
                             //                                // -Signout
                             //                                // -Wallet
                             //                                // -Settings
                             //                                List{
                             //
                             ////                                    Button{
                             //////                                        logOut()
                             ////
                             ////
                             ////                                    } label: {
                             //
                             ////                                        Image(systemName: "figure.wave")
                             //                        NavigationLink("Sign Out",destination:  LoginView())
                             ////                                    }
                             //                                }
                             //                            })
                             
                             Button {
                             //                                logOut()
                             //                                func logOut(){
                             let firebaseAuth = Auth.auth()
                             
                             do {
                             try firebaseAuth.signOut()
                             print("userAuth.signOut: Successful---no user currently logged in")
                             } catch let signOutError as NSError {
                             print("Error signing out: %@", signOutError)
                             }
                             //        dropDownMenu.toggle()
                             
                             print("userAuth.signOut: Successful---no user currently logged in")
                             //                                }
                             
                             } label:{
                             NavigationLink("Sign Out",destination:  LandingPageView()).padding(.trailing, 30).buttonStyle(.borderedProminent)
                             }
                             //                            .onSubmit {
                             //                                model.logOut()
                             //                            }
                             */
                        }
                        .foregroundColor(.black).padding(.trailing, 20)
                        Rectangle().AddMyDivider()
                        Spacer()
                            .navigationBarBackButtonHidden(true)
                    }
                    //STACK 1.2 -- User Buttons
                    VStack{
                        //ROW 1
                        HStack{
                            //Stack for navigation button linked to ScanQRView to view scooters
                            NavigationLink(destination: ScanQRView()) {
                                VStack {
                                    Image(systemName: "qrcode.viewfinder")
                                        .font(.system(size: 110))
                                    VStack{
                                        Text("Scan")
                                        Text("QR Code")
                                    }
                                    .font(.title2).foregroundColor(.white)
                                }
                            }.padding()
                            
                            //Stack for navigation button linked to ScooterListView to view scooters
                            
                            NavigationLink(destination: ScooterListView()) {
                                VStack {
                                    Image(systemName: "scooter")
                                        .font(.system(size: 110))
                                    Text("Find a Scoot!")
                                        .font(.title2).foregroundColor(.white)
                                }
                            }.padding()
                        }
                        
                        //ROW 2
                        HStack{
                            /* implement scan button option 2
                             implement transition to option 2 screen
                             */
                            NavigationLink(destination: ScootMapView()) {
                                VStack {
                                    Image(systemName: "map")
                                        .font(.system(size: 110))
                                    Text("Map")
                                        .font(.title2).foregroundColor(.white)
                                    
                                }
                            }.padding()
                            
                            /* implement scan button option 2
                             implement transition to option 2 screen
                             */
                            
                            NavigationLink(destination: WalletView()) {
                                VStack {
                                    Image(systemName: "creditcard.circle")
                                        .font(.system(size: 120))
                                    Text("Wallet")
                                        .font(.title).foregroundColor(.white)
                                }
                            }.padding()
                        }
                    }
                    
                    //STACK 1.3 -- Nav Bar Buttons
                    VStack{
                        HStack{
                            //Stack for navigation button linked to ????
                            NavigationLink(destination: ScanQRView()) {
//                                VStack {
//                                    Image(systemName: "person.crop.circle.fill.badge.checkmark").padding(.leading, 10)
//                                        .font(.system(size: 70))
//                                        .frame(width: 100, height: 100)
//                                        .background(Color.red)
//                                        .clipShape(RoundedRectangle(cornerRadius: 20, style:.continuous))
//                                        .shadow(color: .black, radius: 7, x: 8, y: 9)
//                                    Text("Button")
//                                        .font(.title2).foregroundColor(.white)
//                                }
                            }
//                            .padding()
                            //Stack for navigation button linked to ????
                            /*
                             Implement a My Scooter Information View
                             
                             */
                            NavigationLink(destination: MyScootsView()) {
                                VStack {
                                    Image("scooter").scaleEffect(x:0.4,y:0.4)
                                        .frame(width: 100, height: 100)
                                        .background(Color.red)
                                        .clipShape(RoundedRectangle(cornerRadius: 20, style:.continuous))
                                        .shadow(color: .black, radius: 7, x: 8, y: 9)
                                    Text("My Scooter")
                                        .font(.title2).foregroundColor(.white)
                                }
                            }
                            .padding()
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width , height: 170)
                    .background(Color.secondary)
                }
            }
        }.navigationBarBackButtonHidden(false)
    }
}
    
//    func logOut(){
//        let firebaseAuth = Auth.auth()
//
//        do {
//            try firebaseAuth.signOut()
//            print("userAuth.signOut: Successful---no user currently logged in")
//        } catch let signOutError as NSError {
//            print("Error signing out: %@", signOutError)
//        }
////        dropDownMenu.toggle()
//
//        print("userAuth.signOut: Successful---no user currently logged in")
//    }
//    
//    func logOut(){
//        let firebaseAuth = Auth.auth()
//        let userUID = firebaseAuth.currentUser?.uid
//        
//        do {
//            try firebaseAuth.signOut()
//        } catch let signOutError as NSError {
//            print("Error signing out: %@", signOutError)
//        }
//        print("user(\(String(describing: userUID))): Signed out Successfully---no user currently logged in")
//    }
//}

struct UserHomeView_Previews: PreviewProvider {
    static var previews: some View {
            UserHomeView()
    }
}
