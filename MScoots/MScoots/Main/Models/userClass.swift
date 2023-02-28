//
//  userClass.swift
//  MScoots
//
//  Created by Justin Trubela on 2/27/23.
//

import Foundation

class studentUser: Identifiable {
    var id: String
    var CWID: String
    var email: String
    var first_name: String
    var last_name: String
    var password: String

    init(id: String, CWID: String, Email: String, first_name: String, last_name: String, Password: String) {
        self.id = id
        self.CWID = CWID
        self.email = Email
        self.first_name = first_name
        self.last_name = last_name
        self.password = Password
    }
    
}
