//
//  Scooter.swift
//  MScoots
//
//  Created by Justin Trubela on 3/26/23.
//

import Foundation
import SwiftUI

//create a scooter object so that the user can find them
//  rent/return, admin can add and delete items
struct Scooter: Identifiable {
    //conform the object to Identifiable so that we can do a thorough search for
    // and have complete control over the scooter objects
    var id = NSUUID().uuidString
    //location is shown to the user when looking for scoothers to rent
    //admin will have the option to change and update these locations
    var location: String
    //this variable determines if the scooter is ready for the user to come and get it
    //checks against battery status, any support/service tickets have been submitted,
    //and if its in the general vecinity
    var isAvailable: String
    //shows the user the battery status for the scooter
    var battery: String
    //unused
    var nearestCharger: String
    var currentUser: studentUser? = nil
    
    
    init(id: String = UUID().uuidString, location: String, isAvailable: String, battery: String, nearestCharger: String, currentUser: studentUser? = nil) {
        self.id = id
        self.location = location
        self.isAvailable = isAvailable
        self.battery = battery
        self.nearestCharger = nearestCharger
        self.currentUser = currentUser
    }
}




    //variable to check against the system if the user is admin so they can mange the system/users
//    var currentUser: studentUser? = nil
    // TODO: Scooter data
//    @State var availableScooters = [Scooter]()
//    @State var unavailableScooters = [Scooter]()
//    @State var allScooters = [[Scooter]]()
//
//
//
//
    
    //Further finish interacting with the user to login or changh password until all UI is figured out
    //allows the system to check if for the classification of scooters
//    public func categorizeScootersByAvailability(scooters: [Scooter]) -> Image? {
//        for scooter in scooters {
//            //first check if the scooter availability is confirmed
//            let LEDcheck = checkDBScooterAvail(scooterAvail: scooter.isAvailable)
//            //if the status code sent back to the user represent a number from -1,0,1 with the highest being the best rating
////            if LEDcheck == "2" {
////                //if scooter status comes back as a 0 return the lit green LED image to show to the user
////                //add the scooter to the system to be determined
////                return Image("LED ON")
////            }
////            else if LEDcheck == "1" {
////                return Image(systemName: "scooter")
////            }
////            else if LEDcheck == "0" {
////                return Image(systemName:"qrcode.viewfinder")
////            }
////            else if LEDcheck == "-1" {
////                return Image("LED OFF")
////            }
////            else {
////                return Image(systemName:"pencil")
////            }
//        }
//        return nil
//    }
//}
//
//func checkDBScooterAvail(scooterAvail: String) -> String {
//    switch scooterAvail {
//    case "Available":
//        // show green LED for available scooter
//        return "1"
//    case "Too Far From Current Location":
//        // show green LED for available scooter
//        return "1"
//    case "Unavailable":
//        // show red LED for unavailable scooter
//        return "0"
//    case "Not enough Funds in Wallet":
//        // show red LED for unavailable scooter
//        return "0"
//    default:
//        // handle other cases, such as scooter being too far or battery too low
//        return "0"
//    }
//}

//Random generators generator that will be reported to the system or shown to the user to that scooters can be found/used
//unused as of right now
//var randomNumber = Int.random(in: 1..<61)
//var parkingLots: [Int] {
//    var lots = [Int]()
//    while lots.count < 61 {
//        let randomNumber = Int.random(in: 1...61)
//        if !lots.contains(randomNumber) {
//            lots.append(randomNumber)
//        }
//    }
//    return lots
//}
//
//
//
////used to provide a location to the users
//var randomLocation: String {
//    return availableLocations.randomElement() ?? "No Location Found"
//}
//
//
//
//
////locations the scooters could be left at
//var availableLocations = ["Sprague field", "Panzer Athletic Field", "Chapin Hall", "Russ Hall", "Freeman Hall", "Red Hawk Statue", "Calcia Hall", "Red Hawk Parking Deck", "Car Parc Diem", "Alexander Kasser Theater", "Sprague Library", "School of Communication and Media", "Memorial Auditorium", "Center of Environmental Life Sciences", "Center of Computing in Information Science", "Kelsey Hall", "Dixon Hall", "School of Business", "University Hall", "School of Nursing", "Student Center", "Red Hawk diner", "Bohn hall", "Blanton Hall", "The Heights Xomplex", "Student Rec Center", "Sam’s Place", "Yogi Bear stadium", "Floyd hall", "The Village"]
//
//
//
//
//
////used to make a decision as to what pallets/loads need to be taken care of.
////has the necessary fields to get the rest of this project completed
//var randomScooterAvailability: String {
//    let availabilityOptions = ["Available", "Unavailable", "Too Far From Current Location", "Battery Too Low", "Not Enough Funds in Wallet"]
//
//    return availabilityOptions.randomElement() ?? "unknown"
//}
//
//
//
//
//
////random get battery status report to show to user
//var randomBatteryStatus: String {
//    let batteryOptions = ["Charged", "Average", "Low"]
//
//    return batteryOptions.randomElement() ?? "unknown"
//}
//
//
//
//
//
//
////random get charging station ( unused )
//var randomChargingStation: String {
//    let chargingStations = ["Green", "Blue", "Yellow", "Black", "Orange", "Red", "Purple", "Gray", "White"]
//
//    return chargingStations.randomElement() ?? "Unknown"
//}




