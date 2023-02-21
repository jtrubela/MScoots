//
//  AdminView.swift
//  crud-demo
//
//  Created by Justin Trubela on 2/21/23.
//

import SwiftUI

struct AdminView: View {

    @ObservedObject var model = ViewModel()


    @State var CWID = ""
    @State var email = ""
    @State var first_name = ""
    @State var last_name = ""
    @State var password = ""


    var body: some View {

        VStack {

            List (model.list) { item in

                HStack {
                    Text(item.CWID)
                    Spacer()

                    // Update button
                    Button(action: {

                        // Delete myUser
                        model.updateData(studentUserToUpdate: item)
                    }, label: {
                        Image(systemName: "pencil")
                    })
                    .buttonStyle(BorderlessButtonStyle())


                    // Delete button
                    Button(action: {

                        // Delete myUser
                        model.deleteData(studentUserToDelete: item)
                    }, label: {
                        Image(systemName: "minus.circle")
                    })
                    .buttonStyle(BorderlessButtonStyle())

                }
            }

            Divider()

            VStack(spacing: 5) {

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
                    Text("Add New Student Item")
                })

            }
            .padding()

        }


    }

    init() {
        model.getData()
    }
}

struct AdminView_Previews: PreviewProvider {
    static var previews: some View {
        AdminView()
    }
}
