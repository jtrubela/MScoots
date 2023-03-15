// User.swift

import Foundation

struct User: Identifiable, Decodable {
//    var id: Int
    var id: String
    var name: String
    var username: String
    var email: String
    var address: Address
    var phone: String
//    var website: String
//    var company: Company

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

    struct Company: Decodable {
        var name: String
        var catchPhrase: String
        var bs: String
    }
    
    
//    init(id: String, name: String, username: String, email: String, address: Address, phone: String) {
//        self.id = id
//        self.name = name
//        self.username = username
//        self.email = email
//        self.address = address
//        self.phone = phone
//    }
//    
}


//class User:  Identifiable, Decodable {
//
//    var id: String
//
//    var email: String
//    var password: String
//
//
//    struct Profile: Decodable {
//
//        var picture: String
//
//        var first_name: String
//        var last_name: String
//
//        var address: Address
//        var phone: String
//
//        var CWID: String
//
//        struct Address: Decodable {
//            var street: String
//            var suite: String
//            var city: String
//            var zipcode: String
//            var geo: Geo
//
//            struct Geo: Decodable {
//                var lat: String
//                var lng: String
//            }
//        }
//    }
//
//    struct DB_information: Decodable {
//        //      "localId": "AodOsb4AVaSjdazH7nic0zS7Npx1",
//        var localID: String
//        //      "email": "jt@test.com",
//        var email: String
//        //      "emailVerified": false,
//        var emailVerified: Bool
//        //      "passwordHash": "e+yQHZHfMlJyW79g7n/9MXLBk+Yja5gIWGakbJTHp323PEmszkAxJUoBh7Alvhzb9EQnQc2JHxazOyDIquPPlw==",
//        var passwordHash: String
//        //      "salt": "hpm1Nh/+Vk9WMg==",
//        var salt: String
//        //      "lastSignedInAt": "1677580335648",
//        var lastSignedInAt: String
//        //      "createdAt": "1677438144994",
//        var createdAt: String
//        //      "providerUserInfo": []
//        var providerUserInfo: [String]
//
//
//    }
//
//
//
//
//}
//
//
//
//struct userDecoder: Codable {
//
//    var localID: String
//    var email: String
//    var emailVerified: Bool
//    var passwordHash: String
//    var salt: String
//    var lastSignedInAt: String
//    var createdAt: String
////    var prodiverUserInfo: String
//
//
//}


//class studentUser: Identifiable, Decodable {
//    var id: String
//    var CWID: String
//    var email: String
//    var first_name: String
//    var last_name: String
//    var password: String
//
//    init(id: String, CWID: String, Email: String, first_name: String, last_name: String, Password: String) {
//        self.id = id
//        self.CWID = CWID
//        self.email = Email
//        self.first_name = first_name
//        self.last_name = last_name
//        self.password = Password
//    }
//
//}
