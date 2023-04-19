//
//  ScooterManagerView.swift
//  MScoots
//
//  Created by Justin Trubela on 4/12/23.
//

import SwiftUI
import Foundation
import Firebase
import FirebaseStorage
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

struct ScooterManagerView: View {
    let firestore = FirebaseManager.shared.firestore
    
//    @ObservedObject var model = Firebase_Authorization()
    
    
    @ObservedObject var Firestore = Firebase_Firestore()
    @State var scooter_list = [Scooter]()
    func delete(at offsets: IndexSet) {
        scooter_list.remove(atOffsets: offsets)
//        Firestore.deleteData(studentUserToDelete: )
    }
    
    @State var Availability = ""
    @State var battery = ""
    @State var nearestCharger = ""
    @State var location = ""
    
    
    
    
    func clear_scooterTextFields() {
        // Clear the text fields
        Availability = ""
        battery = ""
        nearestCharger = ""
        location = ""
    }
    
    var body: some View {
        NavigationView{
            VStack {
                
                
                //TODO: Update button
                //                HStack {
                //
                //                    Text("DB").font(.largeTitle).padding(.leading,20)
                //                    Spacer()
                //

                //                    .padding(10)
                //                    // Delete button

                //
                //                }.buttonStyle(.bordered).foregroundColor(.black).padding(.trailing,30)
                
                    // scooter
                        Section{
                            
                            List {
                                ForEach(Firestore.Scoot_list) { scoot in
                                        NavigationLink("\(String(scoot.id).truncated(limit: 10))") {
                                            
                                            VStack{
                                                Text("Scooter")
                                                VStack{
                                                    List{
                                                        Section{
                                                            Text("\(scoot.id)")
                                                        } header: {
                                                            Text("ID:").bold()
                                                        }
                                                        Section{
                                                            Text("\(scoot.isAvailable)")
                                                        } header: {
                                                            Text("Availability")
                                                        }
                                                        Section{
                                                            Text("\(scoot.location)")
                                                        } header: {
                                                            Text("Location")
                                                        }
                                                    }
                                                    
                                                }
                                                HStack{
                                                    Button{
                                                        //TODO:    deleteData(scooterToDelete: )
                                                        
                                                    }label:{
                                                        Image(systemName: "trash.fill").foregroundColor(.red)
                                                    }.padding(5)
                                                    Button{
                                                        //TODO:   updateData(scooterToUpdate: )
                                                    }label:{
                                                        Image(systemName: "pencil")
                                                    }.padding(5)
                                                }
                                            }
                                        }
                                        
                                    }
                                .onDelete(perform: delete)
                            }.toolbar {
                                HStack{
                                    Button{
                                        //TODO:    deleteData(scooterToDelete: )
                                        
                                    }label:{
                                        Image(systemName: "trash.fill").foregroundColor(.red)
                                    }.padding(5)
                                    Button{
                                        //TODO:   updateData(scooterToUpdate: )
                                    }label:{
                                        Image(systemName: "pencil")
                                    }.padding(5)
                                }
                                EditButton()
                                
                                
                            }.navigationBarTitle("Scooter Manager")
                            
                        } header: {
                            Text("Scooter data in DataBase").textCase(.none)
                        }
                        Section{
                            TextField("Availability", text: $Availability)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            TextField("Battery status", text: $battery)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            TextField("nearestCharger", text: $nearestCharger)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            TextField("location", text: $location)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            
                            
                            //Scoooter list items button
                            Button{
                                // Call add data
                                Firestore.addScootData(location: location, isAvailable: Availability, battery: battery, nearestCharger: nearestCharger)
                                
                                clear_scooterTextFields()
                                
                            } label:{
                                Text("Add New Scooter Item")
                            }
                        }
//                        .padding(20)
                        .buttonStyle(.borderedProminent)
            }
            .onAppear(perform: Firestore.getScootData)
        }
    }
    
}

struct ScooterManagerView_Previews: PreviewProvider {
    static var previews: some View {
        ScooterManagerView()
    }
}


//Scooter Onject instantiator
//takes in the systems current data from the random Location/Scooter attribute/and scooter status to use to locate these scooters on the scooterlist system
//var scooters: [Scooter] =
//[
//    Scooter(location: "Computer Science Building", isAvailable: "Unavailable", battery: "Charged", nearestCharger: "Black", currentUser: studentUser(CWID: "21622025", email: "trubelaj1@montclair.edu", first_name: "Justin", last_name: "Trubela", password: "Password!123")),
////    Scooter(location: randomLocation, isAvailable: "2", battery: randomBatteryStatus, nearestCharger: randomChargingStation),
//]
//
//
