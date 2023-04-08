import Foundation
import SwiftUI
import FirebaseStorage
import FirebaseCore
import FirebaseFirestore
import Firebase

struct UserManagerView: View {

    @ObservedObject var model = Firebase_Authorization()
    @State var list = [studentUser]()
    @State var Scoot_list = [Scooter]()


    @State var CWID = ""
    @State var email = ""
    @State var first_name = ""
    @State var last_name = ""
    @State var password = ""
    
    
    @State var Availability = ""
    @State var battery = ""
    @State var nearestCharger = ""
    @State var location = ""


    var body: some View {

        VStack {
            // EDIT AND REMOVE BUTTONS
            HStack(spacing: 15){
                //TODO: Update button
                Spacer()
                HStack {
                    Button{
                        //TODO:   updateData(studentUserToUpdate: )
                    }label:{
                        Image(systemName: "pencil")
                    }
                    .padding(10)
                    // Delete button
                    Button{
                        //TODO:    deleteData(studentUserToDelete: )
                    }label:{
                        Image(systemName: "minus.circle")
                    }
                }.buttonStyle(.bordered).foregroundColor(.black)
                    .padding(.trailing,20)
            }
            
            Divider()
            // studentUser entry fields
            VStack(spacing: 15) {
                
                TextField("CWID", text: $CWID)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("first_name", text: $first_name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("last_name", text: $last_name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding(10)
            
            Section{
                Button{
                    // Call add data
                    addData(CWID: CWID, email: email, first_name: first_name, last_name: last_name, password: password)
                    
                    // Clear the text fields
                    CWID = ""
                    email = ""
                    first_name = ""
                    last_name = ""
                    password = ""
                    
                }label:{
                    Text("Add New Student Item")
                }.buttonStyle(.borderedProminent)
            }.padding(10)
            
            Divider().AddMyDivider()
            
            // scooter
            VStack(spacing: 15){
                TextField("Availability", text: $Availability)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Battery status", text: $battery)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("nearestCharger", text: $nearestCharger)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("location", text: $location)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
            }.padding(10)
            VStack{
                Section{
                    //Scoooter list items button
                    Button{
                        // Call add data
                        addScootData(location: location, isAvailable: Availability, battery: battery, nearestCharger: nearestCharger)
                        // Clear the text fields
                        Availability = ""
                        battery = ""
                        nearestCharger = ""
                        location = ""
                        
                        
                    }label:{
                        Text("Add New Scooter Item")
                    }
                    
                }.padding(10).buttonStyle(.borderedProminent)
            }.padding(10)
        }
        }


    
//    func updateData(studentUserToUpdate:studentUser) {
//
//        // Get a reference to the database
//        let db = Firestore.firestore()
//
//        // Set the data to update
//        db.collection("studentUser").document(studentUserToUpdate.id).setData(["Email":"Updated: \(studentUserToUpdate.CWID)"], merge: true) { error in
//
//            // Check for errors
//            if error == nil {
//                // Get the new data
//                self.getData()
//            }
//        }
//    }
//
//    func deleteData(studentUserToDelete:studentUser) {
//
//        // Get a reference to the database
//        let db = Firestore.firestore()
//
//        // Specify the document to delete
//        db.collection("studentUser").document(studentUserToDelete.id).delete { error in
//
//            // Check for errors
//            if error == nil {
//                // No errors
//
//                // Update the UI from the main thread
//                DispatchQueue.main.async {
//
//                    // Remove thestudentUser that was just deleted
//                    self.list.removeAll { studentUser in
//
//                        // Check for thestudentUser to remove
//                        return studentUser.id == studentUserToDelete.id
//                    }
//                }
//
//
//            }
//        }
//
//    }
    
    func addData(CWID: String, email: String, first_name: String, last_name: String, password: String) {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Add a document to a collection
        db.collection("studentUser").addDocument(data: ["CWID":CWID, "email":email, "first_name":first_name,"last_name":last_name,"password":password]) { error in
            
            
            // Check for errors
            if error == nil {
                
                // No errors
                // Call get data to retrieve latest data
                self.getData()
            }
            else {
                // Handle the error
            }
        }
    }

func getData() {
    
    // Get a reference to the database
    let db = Firestore.firestore()
    
    // Read the documents at a specific path
    db.collection("studentUser").getDocuments { snapshot, error in
        
        // Check for errors
        if error == nil {
            
            print("No User")
            
            // No errors
            if let snapshot = snapshot {
                
                // Update the list property in the main thread
                DispatchQueue.main.async {
                    
                    // Get all the documents and create studentUsers
                    self.list = snapshot.documents.map { d in
                        
                        // Create a studentUser item for each document returned
                        return studentUser(CWID: d["CWID"] as? String ?? "",
                                           email: d["Email"] as? String ?? "",
                                           first_name: d["first_name"] as? String ?? "",
                                           last_name: d["last_name"] as? String ?? "",
                                           password: d["Password"] as? String ?? "")}
                    
                }
                print("User info found")
            }
        }
    }
}
//add func for scotter list

func addScootData(location: String, isAvailable: String, battery: String, nearestCharger: String)
{
    
    // Get a reference to the database
    let db = Firestore.firestore()
    
    // Add a document to a collection
    db.collection("scooter_list").addDocument(data: ["Availability":isAvailable, "battery":battery, "nearestCharger":nearestCharger,"location":location]) { error in
        
        
        // Check for errors
        if error == nil {
            
            // No errors
            // Call get data to retrieve latest data
            self.getScootData()
        }
        else {
            // Handle the error
        }
    }
}
    


func getScootData() {
    
    // Get a reference to the database
    let db = Firestore.firestore()
    
    // Read the documents at a specific path
    db.collection("scooter_list").getDocuments { snapshot, error in
        
        // Check for errors
        if error == nil {
            
            print("No User")
            
            // No errors
            if let snapshot = snapshot {
                
                // Update the list property in the main thread
                DispatchQueue.main.async {
                    
                    // Get all the documents and create studentUsers
                    self.Scoot_list = snapshot.documents.map { d in
                        
                        // Create a studentUser item for each document returned
//                        Scooter(location: <#T##String#>, isAvailable: <#T##String#>, battery: <#T##String#>, nearestCharger: <#T##String#>)
                        
                        return Scooter(location: d["location"] as? String ?? "",
                                       isAvailable: d["isAvailable"] as? String ?? "",
                                       battery: d["battery"] as? String ?? "",
                                       nearestCharger: d["nearestCharger"] as? String ?? ""
                                           )
                        
                    }

                }
                print("User info found")
            }
        }
    }
}

    
}


struct UserManagerView_Previews: PreviewProvider {
    static var previews: some View {
        UserManagerView()
    }
}
