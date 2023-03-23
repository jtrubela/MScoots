//
//  AdminUserHomeView.swift
//  MScoots
//
//  Created by Justin Trubela on 3/21/23.
//







//https://firebase.google.com/docs/firestore?authuser=0#implementation_path
//firestore

import SwiftUI

struct AdminUserHomeView: View{
    
    struct ViewItem: Identifiable, Hashable {
        let name: String
        let id = NSUUID().uuidString
    }
    
    let views: [ViewItem] = [
        .init(name: "LandingPageView"),
        .init(name: "LoginView"),
        .init(name: "RegistrationView"),
        .init(name: "UserHomeView"),
        .init(name: "ResetPasswordView"),
        .init(name: "AdminUserHomeView"),
        .init(name: "ScanQRView"),
        .init(name: "ScooterListView"),
        .init(name: "ScootMapView"),
        .init(name: "MyScootsView"),
        .init(name: "UserProfile_SettingsView"),
        .init(name: "WalletView"),
            //AdminScooterManagerView
            //AdminUserManagerView
            //AdminFindScooterView
            //Admin.....
    ]
    
    //    @State private var dropDownMenu = false
    @State private var model = DB_Authorization()
    @State private var path_Admin = [ViewItem]()
    @State private var path_AdminText = ""
    //DropDown View List
    @State var value = ""
    var placeholder = "Select View to go to"
    var dropDownList = ["LandingPageView", "LoginView", "RegistrationView", "UserHomeView","ResetPasswordView", "AdminUserHomeView", "ScanQRView", "ScooterListView","ScootMapView", "MyScootsView", "UserProfile_SettingsView", "WalletView"]
    
    var body: some View {
        //Navigates to a buttons location
        
        //        NavigationView{
        NavigationStack(path: $path_Admin){
            ZStack{
                VStack{
                    //STACK 1.1 -- Title
                    //Stack for Title
                    VStack{
                        //TitleStack
                        HStack{
                            Text("ADMIN HOME")
                                .font(.system(size: 32))
                                .fontWeight(.bold).padding(.leading, 30)
                            
                            Spacer()
                            Button{
                                //Log out and go back to landing page
                            } label: {
                                HStack{
                                    Image(systemName: "figure.wave")
                                    Text("Signout")
                                }.font(.system(size: 22))
                            }.buttonStyle(.bordered)
                        }
                        
                        //Admin Utilities
                        //Scooter information
                        VStack{
                            //List STACK
                            // Admin Scooter information
                            VStack{
                                List{
                                    Section{
                                        //Text("LIST 1")
                                        Text("Scooter Object")
                                        Text("Scooter Object")
                                        Text("Scooter Object")
                                        Text("Scooter Object")
                                    }
                                    header: {
                                        Text("Available Scooters")
                                    }
                                    Section{
                                        //Text("LIST 2")
                                        Text("Scooter Object")
                                        Text("Scooter Object")
                                        Text("Scooter Object")
                                        Text("Scooter Object")
                                    }
                                    header: {
                                        Text("Scooters in-Use")
                                    }
                                    Section{
                                        //Text("LIST 3")
                                        Text("Scooter Object")
                                        Text("Scooter Object")
                                        Text("Scooter Object")
                                        Text("Scooter Object")
                                    }
                                header: {
                                    Text("Scooters offline")
                                }
                                }.listStyle(.sidebar)
                            }.scrollIndicators(.visible)
                        }
                        .navigationBarTitleDisplayMode(.inline)
                        
                        //STACK 1.2 -- Admim Buttons
                        //Access to user views
                        VStack{
                            HStack{
                                NavigationLink(destination: ScooterListView()) {
                                    //modify regular scooter list view
                                    
                                    Button{
                                        
                                    } label: {
                                        VStack {
                                            Image(systemName: "scooter")
                                                .font(.system(size: 90))
                                            Text("Scooter Manager!")
                                                .foregroundColor(.white)
                                        }.frame(width: 180, height: 200)
                                    }
                                }
                                NavigationLink(destination: ScooterListView()) {
                                    //modify regular scooter list view
                                    Button{
                                        
                                    } label: {
                                        VStack {
                                            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                                                .font(.system(size: 90))
                                            
                                            Text("User Manager!")
                                                .foregroundColor(.white)
                                        }.frame(width: 180, height: 200)
                                    }
                                }.navigationBarBackButtonHidden(false)
                            }.background(Color.white)
                        }
                    }
                }
            }    //Navigation Stack Destination

            .navigationDestination(for: ViewItem.self) {      view in
                    VStack{
                        ViewForItem(view)
                    }
            }
            .background(Color.yellow)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack{
                        Menu {
                            ForEach(dropDownList, id: \.self){ view in
                                Button(view) {
                                    self.value = view
                                    path_AdminText = view
                                }
                            }
                        } label: {
                            VStack(spacing: 5){
                                HStack{
                                    Text(value.isEmpty ? placeholder : value)
                                        .foregroundColor(value.isEmpty ? .gray : .black)
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(Color.blue)
                                        .font(Font.system(size: 20, weight: .bold))
                                }
                                .padding(.horizontal)
                                Rectangle()
                                    .fill(Color.gray)
                                    .frame(height: 2)
                            }
                        }
                        //                        TextField("Enter View to go to", text: $path_AdminText).padding(.leading, 10)
                        Button{}label:{
                            NavigationLink("Go", value: ViewItem(name:  path_AdminText)).padding(.trailing, 20).buttonStyle(.bordered)
                        }
                    }
                }
            }
        }
    }
        
    
    //update the view to the navigationstack path variable
    func ViewForItem(_ view: ViewItem) -> AnyView {
        switch view.name {
        case "LandingPageView":
            return AnyView(LandingPageView())
        case "LoginView":
            return AnyView(LoginView())
        case "RegistrationView":
            return AnyView(RegistrationView())
        case "UserHomeView":
                return AnyView(UserHomeView())
        case "ResetPasswordView":
            return AnyView(ResetPasswordView())
        case "AdminUserHomeView":
            return AnyView(AdminUserHomeView())
        case "ScanQRView":
            return AnyView(ScanQRView())
        case "ScooterListView":
            return AnyView(ScooterListView())
        case "ScootMapView":
            return AnyView(ScootMapView())
        case "MyScootsView":
            return AnyView(MyScootsView())
        case "UserProfile_SettingsView":
            return AnyView(UserProfile_SettingsView())
        case "WalletView":
            return AnyView(WalletView())
        default:
            return AnyView(LandingPageView())
        }
    }
    
    //
    //    func logOut(){
    //        let userUID = FirebaseManager.shared.auth.currentUser?.uid
    //
    //        do {
    //            try FirebaseManager.shared.auth.signOut()
    //        } catch let signOutError as NSError {
    //            print("Error signing out: %@", signOutError)
    //        }
    //        print("user(\(String(describing: userUID))): Signed out Successfully---no user currently logged in")
    //    }
    //}
    
    struct AdminUserHomeView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationStack{
                AdminUserHomeView()
            }
        }
    }}
