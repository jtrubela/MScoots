//
//  RegistrationView.swift
//  crud-demo
//
//  Created by Justin Trubela on 2/19/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @ObservedObject var model = ViewModel()
    
    

    @State var CWID = ""
    @State var email = ""
    @State var first_name = ""
    @State var last_name = ""
    @State var password = ""
    

    
    var body: some View {
        
        VStack {
            List{
                
                Section("Name") {
                    TextField("First Name",text: $first_name)
                    TextField("Last Name", text: $last_name)
                }
                
                Section("Campus Wide ID"){
                    TextField("CWID", text: $CWID)
                }
                
                Section("Email and Password"){
                    TextField("Email Address", text: $email)
                    
                    Section{
                        SecureField("Password",text: $password)
                    }
                }
                Button(action: {
                    // Call add data
                    model.addData(CWID: CWID, email: email, first_name: first_name, last_name: last_name, password: password)
                    
                    // Clear the text fields
                    CWID = ""
                    email = ""
                    first_name = ""
                    last_name = ""
                    password = ""
                    
                }, label: {
                    Text("Register")
                })
            }.navigationBarTitle("Registration")

        }
        
        
    }
    
    init() {
        model.getData()
    }
    
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
