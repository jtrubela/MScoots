//
//  ScooterModelClass.swift
//  MScoots
//
//  Created by Justin Trubela on 3/26/23.
//

import Foundation

struct Scooter: Identifiable {
    var id = UUID().uuidString
    
    var location: String
    
    var isAvailable: String
    
    var battery: String
    var nearestCharger: String
    
    var currentUser: studentUser? = nil
}

// TODO: Scooter data
    
    var randomNumber = Int.random(in: 1..<61)
var parkingLots: [Int] {
    var lots = [Int]()
    while lots.count < 61 {
        let randomNumber = Int.random(in: 1...61)
        if !lots.contains(randomNumber) {
            lots.append(randomNumber)
        }
    }
    return lots
}
    
    
        var availableLocations = ["Sprague field", "Panzer Athletic Field", "Chapin Hall", "Russ Hall", "Freeman Hall", "Red Hawk Statue", "Calcia Hall", "Red Hawk Parking Deck", "Car Parc Diem", "Alexander Kasser Theater", "Sprague Library", "School of Communication and Media", "Memorial Auditorium", "Center of Environmental Life Sciences", "Center of Computing in Information Science", "Kelsey Hall", "Dixon Hall", "School of Business", "University Hall", "School of Nursing", "Student Center", "Red Hawk diner", "Bohn hall", "Blanton Hall", "The Heights Xomplex", "Student Rec Center", "Sam’s Place", "Yogi Bear stadium", "Floyd hall", "The Village"]

        
        var randomLocation: String {
            return availableLocations.randomElement() ?? "No Location Found"
        }
        
        var randomScooterAvailability: String {
            let availabilityOptions = ["Available", "Unavailable", "Too Far From Current Location", "Battery Too Low", "Not Enough Funds in Wallet"]
            
            return availabilityOptions.randomElement() ?? "unknown"
        }

        func checkScooterAvail(scooterAvail: String) -> Int {
            switch scooterAvail {
            case "Available":
                // show green LED for available scooter
                return 1
            case "Too Far From Current Location":
                // show green LED for available scooter
                return 1
            case "Unavailable":
                // show red LED for unavailable scooter
                return 0
            case "Not enough Funds in Wallet":
                // show red LED for unavailable scooter
                return 0
            default:
                // handle other cases, such as scooter being too far or battery too low
                return -1
            }
        }
        
        var randomBatteryStatus: String {
            let batteryOptions = ["Charged", "Average", "Low"]
            
            return batteryOptions.randomElement() ?? "unknown"
        }
        
        var randomChargingStation: String {
            let chargingStations = ["Green", "Blue", "Yellow", "Black", "Orange", "Red", "Purple", "Gray", "White"]
            
            return chargingStations.randomElement() ?? "Unknown"
        }
        
    
var scooters: [Scooter] =
    [
        
        Scooter(location: randomLocation, isAvailable: randomScooterAvailability, battery: randomBatteryStatus, nearestCharger: randomChargingStation),
        Scooter(location: randomLocation, isAvailable: randomScooterAvailability, battery: randomBatteryStatus, nearestCharger: randomChargingStation),
        Scooter(location: randomLocation, isAvailable: randomScooterAvailability, battery: randomBatteryStatus, nearestCharger: randomChargingStation),
        Scooter(location: randomLocation, isAvailable: randomScooterAvailability, battery: randomBatteryStatus, nearestCharger: randomChargingStation),
        Scooter(location: randomLocation, isAvailable: randomScooterAvailability, battery: randomBatteryStatus, nearestCharger: randomChargingStation),
        
        Scooter(location: "Computer Science Building", isAvailable: "Unavailable", battery: "Charged", nearestCharger: "Black", currentUser: studentUser(id: "123456789", CWID: "21622025", Email: "trubelaj1@montclair.edu", first_name: "Justin", last_name: "Trubela", Password: "Password!123"))
    ]

