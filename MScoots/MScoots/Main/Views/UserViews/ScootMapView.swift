//
//  ScootMapView.swift
//  MScoots
//
//  Created by Justin Trubela on 3/21/23.
//

import SwiftUI


struct ScootMapView: View {
    
    
    
    
    
    @State private var popUpMessage = "WEEEEEEEEEEEE"
    @Environment(\.presentationMode) var presentationMode
    
    @State private var chargingStations = ["Green", "Blue", "Yellow", "Black", "Orange", "Red", "Pink", "Gray", "White"]
    
    
    
    @State private var isShowingSheet = false
    @State private var zoomScale: CGFloat = 1.0
    @State private var offset: CGSize = .zero
    @Environment(\.dismiss) private var dismiss
    @State private var showAlert = false
    @State private var alertColor = ""
    
    
    var body: some View {
        ScrollView( [.horizontal, .vertical]) {
                ZStack{
                    Image("campusMap").resizable()
                        .scaledToFit()
                        .scaleEffect(zoomScale)
                        .offset(offset)
                        .edgesIgnoringSafeArea(.all)
                    
                    /*-----------------------------------------------------------------
                     Map-Image Button Representations
                     
                     ------------------------------------------------------------------*/
                    //Bottom Left
                    
                    //TODO: Yellow
                    //MARK: 400:450
                    Button {
                        self.showAlert = true
                        self.alertColor = "Yellow"
                    } label: {
                        
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.yellow)
                            .scaleEffect(2.0)
                    }
                    .position(x:400,y:450)
                    
                    .alert(isPresented: $showAlert, content: {
                        let confirm = Alert.Button.default(Text("Confirm 🚨")) { print("Confirmed.")
                            
                        }
                        let cancel = Alert.Button.cancel(Text("Cancel")) { /*do nothing*/ }
                        
                        return Alert(title: Text("Confirm alert"),
                                     message: Text(popUpMessage),
                                     primaryButton: confirm,
                                     secondaryButton: cancel)
                    })
                    
                    //TODO: Black
                    //MARK: 650:380
                    //Top Left
                    Button {
                        self.showAlert = true
                        self.alertColor = "Black"
                    } label: {
                        
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.black)
                            .scaleEffect(2.0)
                    }
                    .position(x:650,y:380)
                    .alert(isPresented: $showAlert, content: {
                        let confirm = Alert.Button.default(Text("Confirm 🚨")) { print("Confirmed.") }
                        let cancel = Alert.Button.cancel(Text("Cancel")) { /*do nothing*/ }
                        
                        return Alert(title: Text("Confirm alert"),
                                     message: Text(popUpMessage),
                                     primaryButton: confirm,
                                     secondaryButton: cancel)
                    })
                    //TODO: Purple
                    //MARK: 950:310
                    
                    
                    Button {
                        self.showAlert = true
                        self.alertColor = "Purple"
                    } label: {
                        
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.purple)
                            .scaleEffect(2.0)
                    }
                    .position(x:950,y:310)
                    .alert(isPresented: $showAlert, content: {
                        let confirm = Alert.Button.default(Text("Confirm 🚨")) { print("Confirmed.") }
                        let cancel = Alert.Button.cancel(Text("Cancel")) { /*do nothing*/ }
                        
                        return Alert(title: Text("Confirm alert"),
                                     message: Text(popUpMessage),
                                     primaryButton: confirm,
                                     secondaryButton: cancel)
                    })
                    
                    
                    //TODO: Orange
                    //MARK: 1170:550
                    //Top Middle
                    Button {
                        self.showAlert = true
                        self.alertColor = "Orange"
                    } label: {
                        
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.orange)
                            .scaleEffect(2.0)
                    }
                    .position(x:90,y:570)
                    .alert(isPresented: $showAlert, content: {
                        let confirm = Alert.Button.default(Text("Confirm 🚨")) { print("Confirmed.") }
                        let cancel = Alert.Button.cancel(Text("Cancel")) { /*do nothing*/ }
                        
                        return Alert(title: Text("Confirm alert"),
                                     message: Text(popUpMessage),
                                     primaryButton: confirm,
                                     secondaryButton: cancel)
                    })
                    
                    
                    //TODO: Gray
                    //MARK: 1170:550
                    Button {
                        self.showAlert = true
                        self.alertColor = "Gray"
                    } label: {
                        
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.gray)
                            .scaleEffect(2.0)
                    }
                    .position(x:1170,y:550)
                    .alert(isPresented: $showAlert, content: {
                        let confirm = Alert.Button.default(Text("Confirm 🚨")) { print("Confirmed.") }
                        let cancel = Alert.Button.cancel(Text("Cancel")) { /*do nothing*/ }
                        
                        return Alert(title: Text("Confirm alert"),
                                     message: Text(popUpMessage),
                                     primaryButton: confirm,
                                     secondaryButton: cancel)
                    })
                    
                    
                    //TODO: Red
                    //MARK: 840:650
                    //Top Middle
                    Button {
                        self.showAlert = true
                        self.alertColor = "Red"
                    } label: {
                        
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.red)
                            .scaleEffect(2.0)
                    }
                    .position(x:400,y:450)
                    .alert(isPresented: $showAlert, content: {
                        let confirm = Alert.Button.default(Text("Confirm 🚨")) { print("Confirmed.") }
                        let cancel = Alert.Button.cancel(Text("Cancel")) { /*do nothing*/ }
                        
                        return Alert(title: Text("Confirm alert"),
                                     message: Text(popUpMessage),
                                     primaryButton: confirm,
                                     secondaryButton: cancel)
                    })
                    
                
                    
                    
                    //TODO: Blue
                    //MARK: 190:890
                    //Top Middle
                    Button {
                        self.showAlert = true
                        self.alertColor = "Blue"
                    } label: {
                        
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.blue)
                            .scaleEffect(2.0)
                    }
                    .position(x:190,y:890)
                    .alert(isPresented: $showAlert, content: {
                        let confirm = Alert.Button.default(Text("Confirm 🚨")) { print("Confirmed.") }
                        let cancel = Alert.Button.cancel(Text("Cancel")) { /*do nothing*/ }
                        
                        return Alert(title: Text("Confirm alert"),
                                     message: Text(popUpMessage),
                                     primaryButton: confirm,
                                     secondaryButton: cancel)
                    })
                    
                    //TODO: White
                    //MARK: 520:780
                    Button {
                        self.showAlert = true
                        self.alertColor = "White"
                    } label: {
                        
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .scaleEffect(2.0)
                    }
                    .position(x:520,y:780)
                    .alert(isPresented: $showAlert, content: {
                        let confirm = Alert.Button.default(Text("Confirm 🚨")) { print("Confirmed.") }
                        let cancel = Alert.Button.cancel(Text("Cancel")) { /*do nothing*/ }
                        
                        return Alert(title: Text("Confirm alert"),
                                     message: Text(popUpMessage),
                                     primaryButton: confirm,
                                     secondaryButton: cancel)
                    })
                    
                    
                    //TODO: Pink
                    //MARK: 1190:550
                    Button {
                        self.showAlert = true
                        self.alertColor = "Pink"
                    } label: {
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.pink)
                            .scaleEffect(2.0)
                    }
                    .position(x:1190,y:230)
                    .alert(isPresented: $showAlert, content: {
                        let confirm = Alert.Button.default(Text("Confirm 🚨")) { print("Confirmed.") }
                        let cancel = Alert.Button.cancel(Text("Cancel")) { /*do nothing*/ }
                        
                        return Alert(title: Text("Confirm alert"),
                                     message: Text(popUpMessage),
                                     primaryButton: confirm,
                                     secondaryButton: cancel)
                    })
                    
                    
                    
                    
                    
                }
                
                
                
                .gesture(MagnificationGesture()
                    .onChanged { scale in
                        zoomScale = scale.magnitude
                    }
                )
                .gesture(DragGesture()
                    .onChanged { value in
                        offset = value.translation
                    }
                )
                
                
                
                
                .sheet(isPresented: $isShowingSheet, onDismiss: nil) {
                    ZStack{
                        List{
                            Text("Text")
                        }
                        
                    }
                    .toolbar {
                        //
                        
                        ToolbarItem(placement: .bottomBar) {
                            Button(action: {
                                isShowingSheet.toggle()
                            }, label: {
                                Image(systemName: "scooter")
                            })
                        }
                        
                        ToolbarItem(placement: .bottomBar) {
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "square.and.arrow.up")
                            })
                        }
                    }
                }
            }
        }
        
    }
    
//}

struct ScootMapView_Previews: PreviewProvider {
    static var previews: some View {
        ScootMapView()
    }
}
