//
//  ScooterManagerView.swift
//  MScoots
//
//  Created by Justin Trubela on 4/12/23.
//

import SwiftUI
import Firebase


struct ScooterManagerView: View {
    @ObservedObject var model = Firebase_Authorization()
    
    
    @ObservedObject var Firestore = Firebase_Firestore()
    @State var scooter_list = [Scooter]()
    
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
                //                    Button{
                //                        //TODO:   updateData(studentUserToUpdate: )
                //                    }label:{
                //                        Image(systemName: "pencil")
                //                    }
                //                    .padding(10)
                //                    // Delete button
                //                    Button{
                //                        //TODO:    deleteData(studentUserToDelete: )
                //
                //                    }label:{
                //                        Image(systemName: "minus.circle")
                //                    }
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
                                        }
                                    }
                                }
                                .onDelete(perform: delete)
                            }.toolbar {
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
                        .padding(20).buttonStyle(.borderedProminent)
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
