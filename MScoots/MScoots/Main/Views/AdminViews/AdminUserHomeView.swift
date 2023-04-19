//
//  AdminUserHomeView.swift
//  MScoots
//
//  Created by Justin Trubela on 3/21/23.
//

//firestore
//https://firebase.google.com/docs/firestore?authuser=0#implementation_path

import SwiftUI

struct AdminUserHomeView: View{
    
    @StateObject var model: Firebase_Authorization = Firebase_Authorization()
    
    @State private var path_Admin = [ViewItem]()
    @State private var path_AdminText = ""
    //DropDown View List
    @State var value = ""
    var placeholder = "Select View"

//TODO: items for the drop down list
    var dropDownList =
    [
        "LandingPageView",
        "RegistrationView",
        "UserHomeView",
        "ResetPasswordView",
        "ScanQRView",
        "ScooterListView",
        "ScootMapView",
        "MyScootsView",
        "UserProfile_SettingsView",
        "WalletView"
    ]
    
    var body: some View {
        //Navigates to a buttons location
        NavigationStack(path: $path_Admin){
            ZStack{
                VStack{
                    //STACK 1.1 -- Title
                    VStack{
                        HStack{
                            
                            
                            //TODO: Titles
                            Text("ADMIN HOME")
                                .font(.system(size: 32))
                                .fontWeight(.bold)
                                .padding(.leading, 30)
                            Spacer()
                            
                            Button{
                                //Log out and go back to landing page
                                model.isLoggedIn =
                                model.logOut()
                            } label: {
                                NavigationLink("Log Out",value: ViewItem(name: "LandingPageView"))
                                HStack{
                                    Image(systemName: "figure.wave")
                                }
                                .font(.system(size: 22))
                            }
                            .buttonStyle(.bordered)
                            
                            Spacer()
                        }
                        //Admin Utilities
                        // Admin Scooter information
                        VStack{
                            List{
                                //Sections
                                Section{
                                    //TODO: Show random scooters
                                    Text("Scooter")
                                    Text("Scooter")
                                }
                            header: {
                                Text("Scooters")
                            }
                                Section{
                                    //TODO: Show random scooters
                                    Text("Scooter")
                                    Text("Scooter")
                                }
                            header: {
                                Text("Scooters in-Use")
                            }
                                Section{
                                    //TODO: Show random scooters
                                    Text("Scooter")
                                    Text("Scooter")
                                }
                            header: {
                                Text("Scooters offline")
                            }
                            }.listStyle(.sidebar)
                        }
                        .scrollIndicators(.visible)
                        .navigationBarTitleDisplayMode(.inline)
                        
                        //STACK 1.2 -- Admim Buttons
                        //Access to user views
                        VStack{
                            HStack{
                                NavigationLink(destination: ScooterManagerView()) {
                                    VStack {
                                        Image(systemName: "scooter")
                                            .font(.system(size: 90))
                                        Text("Scooter Manager!")
                                            .foregroundColor(.black)
                                    }
                                    .frame(width: 180, height: 200)
                                }



                                NavigationLink(destination: UserManagerView()) {
                                    VStack {
                                        Image(systemName: "person.crop.circle.fill.badge.checkmark")
                                            .font(.system(size: 90))
                                        Text("User Manager!")
                                            .foregroundColor(.gray)
                                    }
                                    .frame(width: 180, height: 200)
                                }
                                .navigationBarBackButtonHidden(false)
                            }
                            }
                    }
                }
            }
            //Navigation Stack Destination
            .navigationDestination(for: ViewItem.self) {      view in
                ViewForItem(view)
            }
            .background(Color.yellow)
            .toolbar {
                //toolbar
                ToolbarItem(placement: .bottomBar) {
                    HStack{
                        Menu {
                            // dropDownList
                            ForEach(dropDownList, id: \.self){ view in
                                Button(view) {
                                    self.value = view
                                    path_AdminText = view
                                }
                            }
                        } label: {
                            VStack{
                                HStack{
                                    Text(value.isEmpty ? placeholder : value)
                                        .foregroundColor(value.isEmpty ? .gray : .black)
                                    Spacer()
                                    //dropDownList button
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
                        Button{}label:{
                            NavigationLink("Go", value: ViewItem(name:  path_AdminText)).padding(.trailing, 20).buttonStyle(.bordered)
                        }
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    
    struct ViewItem: Identifiable, Hashable {
        let name: String
        let id = NSUUID().uuidString
    }
    
    let views: [ViewItem] =
    [
        .init(name: "LandingPageView"),
        .init(name: "RegistrationView"),
        .init(name: "UserHomeView"),
        .init(name: "ScanQRView"),
        .init(name: "AdminUserHomeView"),
        .init(name: "ScooterManagerView"),
        .init(name: "UserManagerView"),
        .init(name: "LoadingPageView"),
        .init(name: "UserProfile_SettingsView"),
        .init(name: "ResetPasswordView"),
        .init(name: "WalletView"),
        .init(name: "ScooterListView"),
        .init(name: "mapView"),
    ]
    
    //update the view to the navigationstack path variable
    func ViewForItem(_ view: ViewItem) -> AnyView {
        switch view.name {
        case "LandingPageView":
            return AnyView(LandingPageView())
        case "RegistrationView":
            return AnyView(RegistrationView())
        case "UserHomeView":
            return AnyView(UserHomeView())
        case "ScanQRView":
            return AnyView(ScanQRView())
        case "AdminUserHomeView":
            return AnyView(AdminUserHomeView())
        case "ScooterMangerView":
            return AnyView(ScooterManagerView())
        case "UserMangerView":
            return AnyView(UserManagerView())
        case "LoadingScreenView":
            return AnyView(LoadingScreenView())
        case "UserProfile_SettingsView":
            return AnyView(UserProfile_SettingsView())
        case "ResetPasswordView":
            return AnyView(ResetPasswordView())
        case "WalletView":
            return AnyView(WalletView())
        case "ScooterListView":
            return AnyView(ScooterListView())
        case "mapView":
            return AnyView(mapView())

        default:
            return AnyView(AdminUserHomeView())
        }
    }
    
    
    
    
    struct AdminUserHomeView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationStack{
                AdminUserHomeView()
            }
        }
    }
}
