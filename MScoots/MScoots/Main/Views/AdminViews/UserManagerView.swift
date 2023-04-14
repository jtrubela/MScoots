//UserManagerView.swift

// temporary view allowing the user to see all the stored information in the studentUser and scooter firestore DB
// needs to be integrated into the main views for the admin to manage users/scooters and allow the user to store any information that should/could be updated by the user


//import Foundation
import SwiftUI
//import Firebase


struct UserManagerView: View {
    @ObservedObject var model = Firebase_Authorization()
    @ObservedObject var Firestore = Firebase_Firestore()

    @State var list = [studentUser]()
    
    @State var CWID = ""
    @State var email = ""
    @State var first_name = ""
    @State var last_name = ""
    @State var password = ""
    
    func clear_studentUserTextFields(){
        // Clear the text fields
        CWID = ""
        email = ""
        first_name = ""
        last_name = ""
        password = ""
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
                
                    VStack{
                        Section{
                            
                            List{
                                ForEach(Firestore.list) { item in
                                    NavigationLink("\(item.last_name), \(item.first_name)\n \(String(item.id).truncated(limit:10))"){
                                        VStack{
                                            List{
                                                Section{
                                                    Text("\(item.last_name), \(item.first_name)")
                                                }header:{
                                                    Text("Name")
                                                }
                                                
                                                Section{
                                                    Text(item.id)
                                                }header:{
                                                    Text("Unique User ID(UUID)")
                                                }

                                                Section{
                                                    Text(item.CWID)
                                                }header:{
                                                    Text("CWID")
                                                }
                                                
                                                Section{
                                                    Text(item.email)
                                                }header:{
                                                    Text("Email")
                                                }
                                                
                                                Section{
                                                    Text(item.password)
                                                }header:{
                                                    Text("Password")
                                                    
                                                }
                                            }
                                            Text("\(item.last_name), \(item.first_name)")
                                            Text(item.CWID)
                                            Text(item.email)
                                        }
                                    }
                                }
                                .onDelete(perform: delete)
                                
                            }.toolbar {
                                EditButton()
                                
                            }.navigationBarTitle("UserManager")
                            
                        } header: {
                            Text("Student Users in DataBase").textCase(.none)
                        }
                        
                        Section{
                            // studentUser entry fields
                            
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
                            
                            
                            Button{
                                // Call add data
                                Firestore.addData(CWID: CWID, email: email, first_name: first_name, last_name: last_name, password: password)
                                
                                // Clear the text fields
                                clear_studentUserTextFields()
                                
                            }label:{
                                Text("Add New Student Item")
                            }.buttonStyle(.borderedProminent)
                            
                        }
                    }
                    
                
                
            }
            .onAppear(perform: Firestore.getData)
        }
    }
    
}



extension String {
    enum TruncationPosition {
        case head
        case middle
        case tail
    }
    
    func truncated(limit: Int, position: TruncationPosition = .tail, leader: String = "...") -> String {
        guard self.count > limit else { return self }
        
        switch position {
        case .head:
            return leader + self.suffix(limit)
        case .middle:
            let headCharactersCount = Int(ceil(Float(limit - leader.count) / 2.0))
            
            let tailCharactersCount = Int(floor(Float(limit - leader.count) / 2.0))
            
            return "\(self.prefix(headCharactersCount))\(leader)\(self.suffix(tailCharactersCount))"
        case .tail:
            return self.prefix(limit) + leader
        }
    }
}

struct UserManagerView_Previews: PreviewProvider {
    static var previews: some View {
        UserManagerView()
    }
}
