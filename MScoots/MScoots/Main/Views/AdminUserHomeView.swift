//
//  AdminUserHomeView.swift
//  MScoots
//
//  Created by Justin Trubela on 3/21/23.
//

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
        .init(name: "AdminUserHomeView")
        //AdminHomeView
            //AdminScooterManagerView
            //AdminUserManagerView
            //AdminFindScooterView
            //Admin.....
    ]
    
    //    @State private var dropDownMenu = false
    @State private var model = DB_Authorization()
    @State private var path_Admin = [ViewItem]()
    
    
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
                                //Do something
                            } label: {
                                HStack{
                                    Image(systemName: "figure.wave")
                                    Text("Signout")
                                }.font(.system(size: 22))
                            }.buttonStyle(.bordered)
                        }
                        
                        Rectangle().frame(width: UIScreen.main.bounds.width, height: 3, alignment: .center)
                        
                        Spacer()
                    }
                    //STACK 1.2 -- Admit Buttons
                    VStack{
                        List{
                        }
                    }
                    
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
                            
                        }
                    }
                    .font(.title2)
                    .frame(width: UIScreen.main.bounds.width , height: 200)
                    .background(Color.secondary)
                }
                
            }
            .navigationDestination(for: ViewItem.self) { view in
                VStack{
                    ViewForItem(view)
                    // TODO: Add a way to get back to normal views
                    
                    // TODO: Add view data for admin relate
                    
                    
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
        default:
            return AnyView(LandingPageView())
        }
    }
    
    
    func logOut(){
        let userUID = FirebaseManager.shared.auth.currentUser?.uid
        
        do {
            try FirebaseManager.shared.auth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        print("user(\(String(describing: userUID))): Signed out Successfully---no user currently logged in")
    }
}

struct AdminUserHomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            AdminUserHomeView()
        }
    }
}
