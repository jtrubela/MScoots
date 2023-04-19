//  mapViewModel.swift
//  MScoots
//
//  Created by Vincent Cavallaro on 4/15/23.
//
//  Acts as the view model that updates the view
//  mapViewModel: determines if map can be utilized
//  mapLocation: makes a class to add location data for charging locations
// images for the mapviews listed below are in figma


import Foundation
import MapKit


final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    //TODO: These are quick jumps to locations for a placeholder until current location of user can be accessed
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.86700, longitude: -74.19740), span: MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009))
//    [
        //Entire Campus
       
//        ,
//        //Top Right
//        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.86907, longitude: -74.19544), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)),
//        //Middle Right
//        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.86386, longitude: -74.19524), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)),
//        //Bottom Right
//        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.86068, longitude: -74.19732), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)),
//        //Top Left
//        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.87325, longitude: -74.19898), span: MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007)),
//        //Middle Left
//        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.86661, longitude: -74.19919), span: MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007)),
//        //Bottom Left
//        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.86293, longitude: -74.19863), span: MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007)),
//    ]
    var locationManager: CLLocationManager?

    func checkIfLocationSerivcesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
        } else {
            print("Alert location services is off")
        }
    }

    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }

        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted. Please change settings.")
        case .denied:
            print("Your location is restricted. Please change settings.")
//TODO: re add back in when this has been factored into the usersLocation
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))

//TODO: get rid of once above todo is finished
//        case .authorizedAlways, .authorizedWhenInUse:
            //TODO: Add functionality to get the correct data when necessary
            print("Location is available")
        @unknown default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
        checkLocationAuthorization()

        // 1. Create a CLCircularRegion object with the center coordinate and radius of your geofence
        let geofenceRegion = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 40.8555, longitude: -74.1925), radius: 100, identifier: "MyGeofence")

        // 2. Start monitoring the region for entry and exit events
        locationManager?.startMonitoring(for: geofenceRegion)
    }

    // 3. Handle entry events
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Entered region: \(region.identifier)")
    }

    // 3. Handle exit events
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Exited region: \(region.identifier)")
    }
}
