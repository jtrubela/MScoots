////
////  TestUIView.swift
////  MScoots
////
////  Created by Justin Trubela on 3/17/23.
////
//
//import SwiftUI
//
////
////  ContentView.swift
////  MScoots
////
////  Created by Justin Trubela on 2/26/23.
////
//
//import SwiftUI
//import Firebase
//
//struct TestUIView: View {
//    
//    struct ViewItem: Identifiable, Hashable {
//        let name: String
//        let id = NSUUID().uuidString
//    }
//    
//    let views: [ViewItem] = [
//        .init(name: "LoginView"),
//        .init(name: "UserHomeView"),
//    ]
//    
//    //imports functions for creating user and logging in
//    @StateObject var model = DB_Authorization()
//    
//    
//    @State private var isLoggedIn = false
//    
//    
//    //User input fields to verify against the db
//    @State private var email = ""
//    @State private var password = ""
//    
//    @State private var path = [ViewItem]()
//    
//    @State public var loginStatusErrorMessage = ""
//    
//    
//    
//    var body: some View {
//        
//        NavigationStack(path: $path){
//            VStack{
//                    TextField("Email Address", text: $email).AddMyTextFieldEntry()
//                    SecureField("Password", text: $password).AddMyTextFieldEntry()
//                    Button{
//                        path = []
////                        isLoggedIn.toggle()
////                        if isLoggedIn{
//                            path = [views[1]]
////                        }
////                        else{
////                            path = [views[0]]
////                        }
//                    } label: {
////                        NavigationLink("\(brands[3].name)",value: brands[3])
//                        NavigationLink("\(views[1].name)",value: views[1])
////                        Text("Login")
//                    }.foregroundColor(.blue).AddMy_ButtonSytle()
//                .navigationTitle("Log in")
//            }
//            .navigationDestination(for: ViewItem.self) { view in
//                    ViewForItem(view)
//            }
//        }
//    }
//
//    
//    
//    //update the view to the navigationstack path variable
//    func ViewForItem(_ UIview: ViewItem) -> AnyView {
//        switch UIview.name {
//        case "LoginView":
//            return AnyView(LoginView())
//        case "RegistrationView":
//            return AnyView(RegistrationView())
//        case "UserHomeView":
//            return AnyView(UserHomeView())
//        default:
//            return AnyView(LandingPageView())
//        }
//    }
//}
//
//
//struct TestUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestUIView()
//    }
//}
