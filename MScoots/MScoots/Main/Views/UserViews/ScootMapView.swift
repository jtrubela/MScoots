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
//
    @State private var isShowingSheet = false
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack{
            ScrollView(.horizontal) {
                Image("campusMap")
            }
            
        }.sheet(isPresented: $isShowingSheet, onDismiss: nil) {
            ZStack{
                List{
                    Text("Text")
                }
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
        
        
        
        
        
        
        
        
        
        
        
//        Map(coordinateRegion: $mapRegion)
//        let locations = [
//            Location(name: "Montclair State University", coordinate: CLLocationCoordinate2D(latitude: 40.8666, longitude: 74.1976)),
//        ]

//        Text("Heres a map of all the \navailable scooters on campus")
        
    }
}

struct ScootMapView_Previews: PreviewProvider {
    static var previews: some View {
        ScootMapView()
    }
}
