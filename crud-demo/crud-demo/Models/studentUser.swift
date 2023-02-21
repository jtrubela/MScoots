//
//  studentUser.swift
//  crud-demo
//
//  Created by Justin Trubela on 2/21/23.
//

import Foundation

class studentUser: Identifiable {
    
    var id: String
    var CWID: String
    var Email: String
    var first_name: String
    var last_name: String
    var Password: String

    init(id: String, CWID: String, Email: String, first_name: String, last_name: String, Password: String) {
        self.id = id
        self.CWID = CWID
        self.Email = Email
        self.first_name = first_name
        self.last_name = last_name
        self.Password = Password
    }
    

}
