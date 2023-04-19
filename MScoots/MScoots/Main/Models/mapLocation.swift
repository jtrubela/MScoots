//
//  mapLocation.swift
//  MScoots
//
//  Created by Justin Trubela on 4/15/23.
//
// Class designed to get Location data easily

//import CoreLocation
import _MapKit_SwiftUI
import Foundation
import MapKit
import SwiftUI

class mapLocation: Identifiable{
    var id = UUID().uuidString
    
    //Coordinates and span values for getMapLocation function
    var Latitude: Double
    var Longitude: Double
    //Span the coordinates - creates a Zoom effect
    var latZoom:Float
    var longZoom:Float
    
    init(Latitude: Double, Longitude: Double, latZoom: Float, longZoom: Float) {
        self.Latitude = Latitude
        self.Longitude = Longitude
        self.latZoom = latZoom
        self.longZoom = longZoom
    }
    
    func getMapLocation(Latitude: Double, Longitude: Double ,latZoom:Float, longZoom:Float) -> MKCoordinateRegion{
        //Make a Coordinate Region
        let mapLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: CLLocationAccuracy(Latitude), longitude: CLLocationAccuracy(-Longitude)), span: MKCoordinateSpan(latitudeDelta: CLLocationDegrees(latZoom), longitudeDelta: CLLocationDegrees(longZoom)))
        return mapLocation
    }
  }
