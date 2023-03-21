// User.swift

import Foundation


class studentUser: Identifiable, Decodable {
    var id: String
    var CWID: String
    var email: String
    var first_name: String
    var last_name: String
    var password: String
    
    struct Address: Decodable {
        var street: String
        var suite: String
        var city: String
        var zipcode: String
        var geo: Geo

        struct Geo: Decodable {
            var lat: String
            var lng: String
        }
    }

    init(id: String, CWID: String, Email: String, first_name: String, last_name: String, Password: String) {
        self.id = id
        self.CWID = CWID
        self.email = Email
        self.first_name = first_name
        self.last_name = last_name
        self.password = Password
    }

}
