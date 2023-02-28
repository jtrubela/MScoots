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
    
    @State private var dropDownMenu = false
    
    
    @ObservedObject var model = ViewModel()
    
    
    @State private var loggedOutMessage = ""
    @State private var isLoggedInMessage = ""
    
    var body: some View {
        
        NavigationView{
            
            
            
            ZStack{
                
                
                
                Color.init(red: 0.9, green: 0.0, blue: 0.1).ignoresSafeArea()
                
                
                
                VStack{
                    
                    
                    
                    VStack{
                        
                        
                        
                        VStack{
                            
                            
                            
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
                                .font(.system(size: 30))
                                .sheet(isPresented: $dropDownMenu, content: {
                                    
                                    
                                    
                                    
                                    List{
                                        
                                        
                                        Text(isLoggedInMessage)
                                            .foregroundColor(.blue)
                                        Text(loggedOutMessage)
                                            .foregroundColor(.red)
                                        
                                        Button{
                                            isLoggedInMessage = model.getUserAuthStatus()
                                            loggedOutMessage = model.logOut(userUID: isLoggedInMessage)
                                            
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
                        
                    }
                    VStack{
                        
                        
                        Grid{
                            
                            
                            HStack{
                                
                                
                                ForEach(0..<2) { row in
                                    
                                    VStack{
                                        
                                        ForEach(0..<3) { col in
                                            
                                            if  row == 1 && col == 2{
                                                
                                                
                                                
                                                Button {
                                                    
                                                } label: {
                                                    Image(systemName: "qrcode.viewfinder")
                                                        .frame(width:115, height: 115)
                                                        .font(.system(size: 110))
                                                }
                                                .background(Color.red)
                                                .clipShape(RoundedRectangle(cornerRadius: 20, style:.continuous))
                                            }
                                            
                                            
                                            
                                            else {
                                                
                                                Button{}label:{
                                                    Text("BUTTON")
                                                        .frame(width:115, height: 115)
                                                }
                                                .background(Color.red)
                                                .clipShape(RoundedRectangle(cornerRadius: 20, style:.continuous))
                                                
                                                
                                            }
                                            
                                        }.padding()
                                        
                                        
                                    }.padding(.bottom, 20)
                                        .shadow(color: .blue, radius: 8, x: 7, y: 8)
                                    
                                    
                                    
                                }
                            }
                        }
                    }
                    
                    
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
                        
                        
                        
                    }.frame(width: UIScreen.main.bounds.width , height: 140)
                        .background(Color.secondary)
                    
                    
                }
                .navigationBarTitleDisplayMode(.inline).navigationBarBackButtonHidden()
                .toolbar{ToolbarItemGroup(placement:.bottomBar){} }
                
            }
            
        }
        
    }
}

struct UserHomeView_Previews: PreviewProvider {
    static var previews: some View {
        UserHomeView()
    }
}
