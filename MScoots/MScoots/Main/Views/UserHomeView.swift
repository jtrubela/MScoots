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
    @ObservedObject var model = ViewModel()
    
    @State private var dropDownMenu = false
    
    
    
    @State var isLoggedIn = false
    @State private var isLoggedInMessage = ""
    
    
    @State var isLoggedOut = true
    @State private var isLoggedOutMessage = ""
    
    
    
    var body: some View {
        
        NavigationView{
            // Travel to home screeen                          -->
            
            
            ZStack{
                //
                //                                             -->
                
                Color.init(red: 0.9, green: 0.0, blue: 0.1).ignoresSafeArea()
                //
                
                //Stack -
                //      1) Title and Hamburger
                //      2) User Buttons
                //      3) Nav Bar Buttons
                VStack{
                    //STACK 1.1 -- Title and Hamburger
                    Spacer()
                    VStack{
                        //
                        
                        //
                        
                        
                        //
                        
                        //
                        Rectangle()
                            .frame(width: 350, height: 3, alignment: .center)
                        
                        HStack{
                            Text("Home")
                                .font(.system(size: 42))
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.leading, 30)
                            Spacer()
                            
                            Button{
                                dropDownMenu.toggle()
                            } label: {
                                Image(systemName: "line.3.horizontal")
                                    .addMyHambugerMenuStyler()
                            }
                            .font(.system(size: 30)).frame(width: 50, height :50)
                            .sheet(isPresented: $dropDownMenu, content: {
                                //
                                
                                List{
                                    //
                                    Section{}
                                    Button{
                                        isLoggedOutMessage = model.logOut()
                                        
                                    } label: {
                                        Image(systemName: "figure.wave")
                                        Text("Sign Out")
                                    }
                                    
                                    
                                    Button{} label: {
                                        Text("Wallet")
                                        Image(systemName: "creditcard.fill")
                                    }
                                    
                                    
                                    Button {} label: {
                                        Text("Options")
                                        Image(systemName: "ellipsis.circle.fill")
                                    }
                                    
                                    
                                    Button {} label: {
                                        Text("Settings")
                                        Image(systemName: "gearshape")
                                    }
                                    
                                    
                                    ForEach(1..<6){ button in
                                        Button
                                        {} label: {
                                            Text("SomeUserButton #\(button)")
                                        }
                                    }
                                    
                                    
                                    
                                    
                                }
                                
                                
                            })
                            .foregroundColor(.black)
                            Button {print("welcome to settings")} label: { }
                            
                            
                            
                        }
                        .foregroundColor(.black)
                        .padding(.trailing, 30)
                        
                        
                        
                        
                        Rectangle()
                            .frame(width: 350, height: 3, alignment: .center)
                        
                        Spacer()
                        
                        
                    }
                    Spacer()
                    //STACK 1.2 -- User Buttons
                    VStack{
                        Grid{
                            ForEach(0..<2) { row in
                                HStack{
                                    //ROW 1
                                    if row == 0 {
                                        Button {
                                            
                                        } label: {
                                            VStack{
                                                Image(systemName: "qrcode.viewfinder")
                                                    .frame(width:115, height: 115)
                                                    .font(.system(size: 110))
                                                Text("Scan QR Code").font(.title).foregroundColor(.white)
                                            }
                                        }.padding()
                                        
                                        Button{
                                            
                                        }label:{
                                            VStack{
                                                Image(systemName: "square.and.arrow.up.fill")
                                                    .frame(width:115, height: 115)
                                                    .font(.system(size: 110))
                                                Text("Button Label").font(.title).foregroundColor(.white)
                                            }
                                        }
                                    }
                                    //ROW 2
                                    if row == 1 {
                                        Button {
                                            
                                        } label: {
                                            VStack{
                                                Image(systemName: "qrcode.viewfinder")
                                                    .frame(width:115, height: 115)
                                                    .font(.system(size: 110))
                                                Text("Scan QR Code").font(.title).foregroundColor(.white)
                                            }
                                        }.padding()
                                        
                                        Button{
                                            
                                        }label:{
                                            VStack{
                                                Image(systemName: "square.and.arrow.up.fill")
                                                    .frame(width:115, height: 115)
                                                    .font(.system(size: 110))
                                                Text("Button Label").font(.title).foregroundColor(.white)
                                            }
                                        }
                                    }
                                }.padding()
                                    .shadow(color: .blue, radius: 8, x: 7, y: 8)
                            }
                        }
                    }
                    Spacer()
                    //STACK 1.3 -- Nav Bar Buttons
                    VStack{
                        HStack{
                            Spacer()
       
                            ForEach(0..<3) { col in
                                Button {print("Pressed")}
                            label: {
                                Text("Button \(col + 1)")
                                    .frame(width: 100, height: 100)
                                    .background(Color.red)
                                    .clipShape(RoundedRectangle(cornerRadius: 20, style:.continuous))
                                    .shadow(color: .black, radius: 7, x: 8, y: 9)
                            }
                            }.padding(10)
                            
                            
                            Spacer()
                            
                            
                        }
                        .padding(20)
                        Spacer()
                        
                        
                        
                    }
                    .frame(width: UIScreen.main.bounds.width , height: 140)
                    .background(Color.secondary)
                    
                }
                .navigationBarTitleDisplayMode(.inline).navigationBarBackButtonHidden()
                //                                .toolbar{ToolbarItemGroup(placement:.bottomBar){} }.navigationBarBackButtonHidden()
                
            }
            
        }
        
    }
}

struct UserHomeView_Previews: PreviewProvider {
    static var previews: some View {
        UserHomeView()
    }
}
