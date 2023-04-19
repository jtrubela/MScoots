//
//  SwiftUIView.swift
//  MScoots
//
//  Created by Vincent Cavallaro on 4/15/23.
//

import SwiftUI
import MapKit

 struct mapView: View {
     @StateObject private var viewModel = MapViewModel()
     @ObservedObject var Firestore = Firebase_Firestore()
     

     
     @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.86700, longitude: -74.19740), span: MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009))
     
     struct Charger: Identifiable {
         let id = UUID()
         let name: String
         let coordinate: CLLocationCoordinate2D
     }
     
     @State private var chargingStations = [
            Charger(name: "Blue", coordinate:CLLocationCoordinate2D(latitude: 40.86360, longitude: -74.19770)),
            
            Charger(name: "Green", coordinate:CLLocationCoordinate2D(latitude: 40.86907, longitude: -74.19544)),

            Charger(name: "Yellow", coordinate:CLLocationCoordinate2D(latitude: 40.86386, longitude: -74.19524)),

            Charger(name: "Red", coordinate:CLLocationCoordinate2D(latitude: 40.86068, longitude: -74.19732)),

            Charger(name: "Purple", coordinate:CLLocationCoordinate2D(latitude: 40.87325, longitude: -74.19898)),

            Charger(name: "Orange", coordinate:CLLocationCoordinate2D(latitude: 40.86661, longitude: -74.19919)),

            Charger(name: "Pink", coordinate:CLLocationCoordinate2D(latitude: 40.86293, longitude: -74.19863)),
        ]
     

     var body: some View {
         //TODO: Incorporate some logic so that we can demonstrate moving to different parts of the map for demonstration purposes
         Map(coordinateRegion: $region,
                         annotationItems: chargingStations) {item in
             MapAnnotation(coordinate: item.coordinate) {
                 Button{}label:{
                     ZStack{
                         NavigationLink(destination: ScooterListView(), label: {
//                             Image(systemName: "mappin.circle.fill")
                             if item.name == "Blue"{
                                 Image(systemName: "mappin.circle.fill").foregroundColor(.blue).font(.system(size: 30))
                             }
                             else if item.name == "Green"{
                                 Image(systemName: "mappin.circle.fill").foregroundColor(.green).font(.system(size: 30))
                             }
                             else if item.name == "Yellow"{
                                 Image(systemName: "mappin.circle.fill").foregroundColor(.yellow).font(.system(size: 30))
                             }
                             else if item.name == "Red"{
                                 Image(systemName: "mappin.circle.fill").foregroundColor(.red).font(.system(size: 30))
                             }
                             else if item.name == "Purple"{
                                 Image(systemName: "mappin.circle.fill").foregroundColor(.purple).font(.system(size: 30))
                             }
                             else if item.name == "Orange"{
                                 Image(systemName: "mappin.circle.fill").foregroundColor(.orange).font(.system(size: 30))
                             }
                             else if item.name == "Pink"{
                                 Image(systemName: "mappin.circle.fill").foregroundColor(.brown).font(.system(size: 30))
                             }
                             else{
                                 Image(systemName: "mappin.circle.fill").foregroundColor(.black).font(.system(size: 30))
                             }
                                 
                         })
                     }
                 }
                 
             }
                     }
//         Map(coordinateRegion: $region, annotationItems: chargingStations) {
//             MapAnnotation(coordinate: $0.coordinate){
//                 Button{}label:{
//                     ZStack{
//                         NavigationLink(destination: ScooterListView(), label: {
//                             Image(systemName: "mappin.circle.fill").foregroundColor(.green)
//                                 .font(.system(size: 30))
//                         })
//
//
//                     }
//                 }
//             }
//                 }
                      .ignoresSafeArea(edges: .all)
                      .accentColor(Color(.systemRed))
                      .onAppear{
//                          viewModel.checkIfLocationSerivcesIsEnabled()
                      }
     }
 }

 struct mapView_Previews: PreviewProvider {
     static var previews: some View {
         mapView()
     }
 }
