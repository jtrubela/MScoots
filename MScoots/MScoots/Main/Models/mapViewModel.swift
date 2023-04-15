//
//  mapViewModel.swift
//  MScoots
//
//  Created by Vincent Cavallaro on 4/15/23.
//

import Foundation
import MapKit


final class mapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.8555, longitude: -74.1925), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))

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
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
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
