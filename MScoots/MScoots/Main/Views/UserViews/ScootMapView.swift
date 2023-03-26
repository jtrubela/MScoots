//
//  ScootMapView.swift
//  MScoots
//
//  Created by Justin Trubela on 3/21/23.
//

import SwiftUI
//import MapKit
//import CoreLocation


//struct Location: Identifiable {
//    let id = UUID()
//    let name: String
//    let coordinate: CLLocationCoordinate2D
//}

struct ScootMapView: View {
    //40.8666° N, 74.1976° W
    
    //    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.8666, longitude: 74.1976), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    //Alerts for all 8 charging station buttons on the map
    @State private var showAlertR = false
    @State private var showAlertO = false
    @State private var showAlertY = false
    @State private var showAlertG = false
    @State private var showAlertBlu = false
    @State private var showAlertP = false
    @State private var showAlertBlk = false
    @State private var showAlertW = false
    @State private var showAlert = false

    @State private var isShowing = false
    @State private var popUpMessage = ""
    
    @State private var chargingStations = ["Green", "Blue", "Yellow", "Black", "Orange", "Red", "Purple", "Gray", "White"]
    

    
    @State private var isShowingSheet = false
    @State private var zoomScale: CGFloat = 1.0
    @State private var offset: CGSize = .zero
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView( .horizontal, showsIndicators: true) {
            ScrollView( .vertical, showsIndicators: true){
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
//Blue and Green
                    Button{}label:{
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.blue)
                            .scaleEffect(2.0)
                    }
                    .position(x:190,y:890)
                    //Top Left
                    Button{}label:{
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.green)
                            .scaleEffect(2.0)
                    }
                    .position(x:90,y:570)
                    
                    
                    
                    
                    
                    //Top Middle
                    Button{}label:{
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.yellow)
                            .scaleEffect(2.0)
                    }
                    .position(x:400,y:450)
                    //Bottom Middle
                    Button{}label:{
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.orange)
                            .scaleEffect(2.0)
                    }
                    .position(x:520,y:780)
                    
                    
                    
                    
                    
                    
                    //Top Right
                    Button{}label:{
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.black)
                            .scaleEffect(2.0)
                    }
                    .position(x:650,y:380)
                    
                    
                    
                    //Bottom Right
                    Button{}label:{
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.purple)
                            .scaleEffect(2.0)
                    }
                    .position(x:950,y:310)
                    
                    
                    
                    
                    
                    
                    
                    Button{}label:{
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.gray)
                            .scaleEffect(2.0)
                    }
                    .position(x:1170,y:550)
                    //Bottom Middle
                    Button{}label:{
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .scaleEffect(2.0)
                    }
                    .position(x:1190,y:230)
                    
                    
                    
                    
                    
                    
                    Button{}label:{
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.red)
                            .scaleEffect(2.0)
                    }
                    .position(x:840,y:650)
                    
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
                
                
//                ScrollView(.horizontal) {
//                    ScrollView(.vertical){
//
//                        ZStack {
//                            Image("campusMap").ignoresSafeArea()
//                            Image(systemName: "mappin.circle.fill")
//                                .font(.title)
//                                .foregroundColor(.red)
//                                .scaleEffect(1.3)
//                        }
//                        Image(systemName: "arrowtriangle.down.fill")
//                            .font(.caption)
//                            .foregroundColor(.red)
//                            .offset(x: 0, y: -5)
//                            .scaleEffect(10.0)
//
//                    }
//                }
                
            }.sheet(isPresented: $isShowingSheet, onDismiss: nil) {
                ZStack{
                    List{
                        Text("Text")
                    }
                }.alert(isPresented: $showAlertR) {
                    Alert(
                    title: Text("An important title!"),
                                message: Text("A message that adds additional context on the alert.")
                    )
                }.alert(isPresented: $showAlertO) {
                    Alert(
                    title: Text("An important title!"),
                                message: Text("A message that adds additional context on the alert.")
                    )
                }.alert(isPresented: $showAlertY) {
                    Alert(
                    title: Text("An important title!"),
                                message: Text("A message that adds additional context on the alert.")
                    )
                }.alert(isPresented: $showAlertG) {
                    Alert(
                    title: Text("An important title!"),
                                message: Text("A message that adds additional context on the alert.")
                    )
                }.alert(isPresented: $showAlertBlu) {
                    Alert(
                    title: Text("An important title!"),
                                message: Text("A message that adds additional context on the alert.")
                    )
                }.alert(isPresented: $showAlertP) {
                    Alert(
                    title: Text("An important title!"),
                                message: Text("A message that adds additional context on the alert.")
                    )
                }.alert(isPresented: $showAlertBlk) {
                    Alert(
                    title: Text("An important title!"),
                                message: Text("A message that adds additional context on the alert.")
                    )
                }.alert(isPresented: $showAlertW) {
                    Alert(
                    title: Text("An important title!"),
                                message: Text("A message that adds additional context on the alert.")
                    )
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

struct ScootMapView_Previews: PreviewProvider {
    static var previews: some View {
        ScootMapView()
    }
}
