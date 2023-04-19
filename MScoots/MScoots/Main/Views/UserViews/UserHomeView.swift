//
//  UserHomeView.swift
//  MScoots
//
//  Created by Justin Trubela on 2/26/23.
//

import SwiftUI

struct UserHomeView: View{
    @State private var model = Firebase_Authorization()
    @State private var isLoggedIn = true
    @State private var selection: String? = nil
    
    var body: some View {
        //Navigates to a buttons location
        NavigationView{
            ZStack{
                Color.init(red: 0.9, green: 0.0, blue: 0.1).ignoresSafeArea()

                VStack{
                    
                    VStack{
                        HStack{
                            VStack{
                                Text("Home")
                                    .font(.system(size: 32))
                                    .fontWeight(.bold).padding(.leading, 30)
                            }
                            
                            Spacer()
                            
                            HStack{
                                Button { } label: {
                                    ProfileButton(ImageText: "person.fill")
                                }
                                    
                            }
                            
                            Spacer()

                            if !isLoggedIn{
                                NavigationLink("", destination: LandingPageView(), tag: "LandingPage", selection: $selection)
                            }
                            
                            Button{
                                //Log out and go back to landing page
                                model.isLoggedIn =
                                model.logOut()
                            } label: {
                                NavigationLink("Log Out", destination: LandingPageView(), tag: "LandingPage", selection: $selection)
                                HStack{
                                    Image(systemName: "figure.wave")
                                }
                                .font(.system(size: 22))
                            }
                            .buttonStyle(.bordered)
                            Spacer()
                        }
                        Rectangle().AddMyDivider()

                    }

                    VStack{
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
                            }
                            .padding()
                        }
                        
                        HStack{
//TODO: Add this line back in when the mapview is completed
//                            NavigationLink(destination: ScootMapView()) {
                            
                            
                                //Temporary Nav link to wait vinnies implementation of geofencing
                                NavigationLink(destination: mapView()) {
                                    
                                    
                                    

                                VStack {
                                    Image(systemName: "map")
                                        .font(.system(size: 110))
                                    Text("Map")
                                        .font(.title2).foregroundColor(.white)
                                    
                                }
                            }
                                .padding()
                            
                            NavigationLink(destination: WalletView()) {
                                VStack {
                                    Image(systemName: "creditcard.circle")
                                        .font(.system(size: 120))
                                    Text("Wallet")
                                        .font(.title).foregroundColor(.white)
                                }
                            }
                            .padding()
                        }
                    }
                    
                    //STACK 1.3 -- Nav Bar Buttons
                    VStack{
                        HStack{
                            //Stack for navigation button linked to ????
                            NavigationLink(destination: ScanQRView()) {
                            }
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
        }            .navigationBarBackButtonHidden(true)
    }
}



struct UserHomeView_Previews: PreviewProvider {
    static var previews: some View {
        UserHomeView()
    }
}
