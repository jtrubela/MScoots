//
//  MScootsApp.swift
//  MScoots
//
//  Created by Justin Trubela on 2/26/23.
//

import SwiftUI

@main
struct MScootsApp: App {

    var body: some Scene {
        
        //Change this to true to manually switch to admin/testing view to see accounts
        //not fully implemented yet
        let adminView = false
        let network = Network()
        WindowGroup {
            if adminView {
                AdminView(network: network).environmentObject(network)
            }
            else{
                LandingPageView()
            }
        }
    }
    
    //Network class  &  Adminview View
    /*
     //
     //  Takes all the users in the database and adds them to the view to be seen on app
     //      for testing purposes only
     //
     //  Created by Justin Trubela on 3/1/23.
     //

     //The only way I have found how to export the user data is into JSON. I have not connected this yet to make the JSON file into a URL decoder but I do have a JSON decoder than can do that.
         //might need to add a textfield on admin view to input the url to be converted


     /*
      Takes in an array of users to be shown iteratively
      Turns the URL given,
      
      
      */


     //import SwiftUI

     */
    class Network: ObservableObject {
        @Published var users: [User] = []

        func getUsers() {
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { fatalError("Missing URL") }

            let urlRequest = URLRequest(url: url)

            let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                if let error = error {
                    print("Request error: ", error)
                    return
                }

                guard let response = response as? HTTPURLResponse else { return }

                if response.statusCode == 200 {
                    guard let data = data else { return }
                    DispatchQueue.main.async {
                        do {
                            let decodedUsers = try JSONDecoder().decode([User].self, from: data)
                            self.users = decodedUsers
                        } catch let error {
                            print("Error decoding: ", error)
                        }
                    }
                }
            }

            dataTask.resume()
        }
    }
    struct AdminView: View {
        @ObservedObject var network: Network
        
        var message = ""

        var body: some View {
            ScrollView {
                Text("All users")
                    .font(.title)
                    .bold()

                VStack(alignment: .leading) {
                    ForEach(network.users) { user in
                        HStack(alignment:.top) {
                            Text("\(user.id)")

                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .bold()

                                Text(user.email.lowercased())

                                Text(user.phone)
                            }
                        }
                        .frame(width: 300, alignment: .leading)
                        .padding()
                        .background(Color(#colorLiteral(red: 0.6667672396, green: 0.7527905703, blue: 1, alpha: 0.2662717301)))
                        .cornerRadius(20)
                    }
                }

            }
            .padding(.vertical)
            .onAppear {
                network.getUsers()
            }
        }
    }
    //struct AdminView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        AdminView(adminModel: 0, network: Network)
    //            .environmentObject(Network())
    //    }
    //}
}


//
//  crud_demoApp.swift
//  crud-demo
//
//  Created by Justin Trubela on 2/19/23.
//


//import SwiftUI
//import Firebase
//import FirebaseStorage
//
//class FirebaseManager: NSObject {
//
//    let auth: Auth
//    let storage: Storage
//    let firestore: Firestore
//
//    static let shared = FirebaseManager()
//
//    override init() {
//
//        self.auth = Auth.auth()
//        self.storage = Storage.storage()
//        self.firestore = Firestore.firestore()
//
//        super.init()
//    }
//
//}
//
//@main
//struct crud_demoApp: App {
//    // register app delegate for Firebase setup
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//
//
//    var body: some Scene {
//        WindowGroup {
//            NavigationView {
//                MainMessagesView()
//            }
//        }
//    }
//}


/*Unused - THINGS TO GET TO */

    /* Functions */
        /* Password Checker */
        //func checkPasswordMatch(user: User){
        //    let password1=user.Password
        //    let password2=user.Password_ReEntered
        //    if password1.elementsEqual(password2){
        //        print("Wrong Passwords: Make sure ......")
        //    }
        //    else{
        //    }
        //}

        /* UserAuth - Login Checker */
        //class UserAuth: ObservableObject {
        //
        //  let didChange = PassthroughSubject<UserAuth,Never>()
        //
        //  // required to conform to protocol 'ObservableObject'
        //  let willChange = PassthroughSubject<UserAuth,Never>()
        //
        //  func login() {
        //    // login request... on success:
        //    self.isLoggedin = true
        //  }
        //
        //  var isLoggedin = false {
        //    didSet {
        //      didChange.send(self)
        //    }
        //
        //    // willSet {
        //    //       willChange.send(self)
        //    // }
        //  }
        //}

        /* Valid Email checker */
        //func isValidEmail(email: String) -> Bool {
        //    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        //    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        //    return emailTest.evaluate(with: email)
        //}

    /* Classes*/
        /* guestUser */
        //class guestUser: Identifiable {
        //    var id: String
        //    var Email: String
        //    var first_name: String
        //    var last_name: String
        //    var Password: String
        //
        //    init(id: String, Email: String, first_name: String, last_name: String, Password: String) {
        //        self.id = id
        //        self.Email = Email
        //        self.first_name = first_name
        //        self.last_name = last_name
        //        self.Password = Password
        //    }
        //}

    /* scooterPayment */
        //class scooterPayment: Identifiable{
        //    var id: String
        //
        //    var date: Date
        //
        //    var person: String
        //
        //    var type: String
        //    var amountCharged: String
        //
        //    var cardNumber: String
        //    var CVV: Int
        //
        //    init(id: String, date: Date, person: String, type: String, amountCharged: String, cardNumber: String, CVV: Int) {
        //        self.id = id
        //        self.date = date
        //        self.person = person
        //        self.type = type
        //        self.amountCharged = amountCharged
        //        self.cardNumber = cardNumber
        //        self.CVV = CVV
        //    }
        //}



    /* Views - imported*/
        /* SignupView ---NOW REGISTRATION VIEW */
            //struct SignupView: View {
            //
            //    /*-----------------------Signup View------------------------*/
            //    /*                                                         */
            //    /*      Variables                                          */
            //    /*                                                         */
            //    /*      Computed Properties                                */
            //    /*                                                         */
            //    /*      Property Wrapped Values                            */
            //
            //    @Binding var newUser: studentUser
            //
            //    /*                                                         */
            //    /*      Functions                                          */
            //
            //    /*----------------------Database View----------------------*/
            //    /*                                                         */
            //    /*                    Database Methods                     */
            //
            //    /*                                                         */
            //    /*                                                         */
            //    /*-------<---END-------Database View-------<---END---------*/
            //
            //
            //    /*                                                         */
            //
            //    /*                                                         */
            //    /*                                                         */
            //    /*                                                         */
            //    /*                                                         */
            //    /*---------------------------------------------------------*/    /*                                                         */
            //    /*---------------------------------------------------------*/
            //    var body: some View {
            //
            //
            //        List{
            //
            //            Section("Name") {
            //                TextField("First Name",text: $newUser.first_name)
            //                TextField("Last Name", text: $newUser.last_name)
            //            }
            //
            //            Section("Campus Wide ID"){
            //                TextField("CWID", text: $newUser.CWID)
            //            }
            //
            //            Section("Email and Password"){
            //                TextField("Email Address", text: $newUser.Email)
            //
            //                Section{
            //                    SecureField("Password",text: $newUser.Password)
            //                    //                TextField("Password", text: $newUser.Password)
            //                    //                TextField("Re-enter Password", text: $newUser.Password_ReEntered)
            //                }
            //            }
            //
            //
            //        }.navigationBarTitle("Registration")
            //
            //    }
            //}

        //Login View
        //struct LoginView: View {
        //
        //
        //    //Login view does not keep initially have a binding value
        //
        //
        //    /*-----------------------Login View------------------------*/
        //    /*                                                         */
        //    /*   Property Wrapper Values Shared with App Delegator     */
        //    /*                                                         */
        //    @State var user = studentUser(id: "", CWID: "", Email: "", first_name: "", last_name: "", Password: "")
        //    //    @State var user = User(FirstName: "", LastName: "", CWID: "", EmailAddress: "", Password: "", Password_ReEntered: "")
        //     @EnvironmentObject var userAuth: UserAuth
        //
        //
        //    //  Check to see if the user exists
        //        //No UI data needs to be referenced yet
        //        //as soon as there is a register button involved thats when you call the @binding
        //
        //    /*                                                         */
        //    /*                      Variables                          */
        //    /*                                                         */
        //    /*      `           Computed Properties                    */
        //    /*                                                         */
        //    /*                      Functions                          */
        //    /*                                                         */
        //    //changed from user: User
        ////    func login(user: studentUser){
        ////        Auth.auth().signIn(withEmail: user.Email, password: user.Password){
        ////            resut, error in
        ////            if error != nil{
        ////                print(error!.localizedDescription)
        ////            }
        ////        }
        ////    }
        //    //    func login(user: User){
        ////        Auth.auth().signIn(withEmail: user.EmailAddress,
        ////                           password: user.Password){
        ////            result, error in
        ////            if error != nil{
        ////                print(error!.localizedDescription)
        ////            }
        ////
        ////        }
        ////    }
        //    /*                                                         */
        //    /*                                                         */
        //    /*                                                         */
        //    /*                                                         */
        //    /*-----------<---END---Login View---END--->----------------*/
        //
        //
        //
        //    var body: some View {
        //        NavigationView{
        //            ZStack{
        //                Color.black.ignoresSafeArea()
        //
        //
        //                VStack{
        //
        //                    Rectangle()
        //                        .MakeLoginView_Background_Style()
        //                }
        //
        //
        //                VStack{
        //
        //                    Text("MS Scoots")
        //                        .foregroundColor(.white)
        //                        .font(.system(size: 70, weight: .bold, design: .rounded))
        //                    Spacer()
        //
        //                    VStack{
        //                        VStack{
        //                            Image("scooter").animation(.easeIn)
        //
        //                            TextField("Email Address",text: $user.Email)
        //                                .MakeTextFieldEntry()
        //                            SecureField("Password",text: $user.Password)
        //                                .MakeTextFieldEntry()
        //                        }
        //                        VStack{
        //                            Divider()
        ////                            Rectangle()
        ////                                .Add_Divider()
        ////                                .padding(15)
        //
        //
        //                            Button{
        ////                                login(user: user)
        //                            } label: {
        //                                Text("Log In")
        //                                    .Add_LoginView_ButtonStyle()
        //                                    .shadow(color: .red, radius: 30)
        //                            }
        //                            VStack{
        //                                Text("Don't have an account?")
        //                                    .bold()
        //                                    .foregroundColor(.white)
        //                                NavigationLink("Create an account", destination: ContentView())
        //                                    .frame(width: 300,height: 50)
        //                                    .background(Color.white)
        //                                    .cornerRadius(10)
        //                                    .clipShape(Capsule())
        //                                    .padding(15)
        //                            }
        //                        }
        //                    }
        //                }
        //            }
        //        }
        //    }
        //}


//        NavigationStack {
//            Text("Hello, World!").padding()
//                .navigationTitle("SwiftUI")
//                .toolbar {
//                    ToolbarItemGroup(placement: .bottomBar) {
//
//                        HStack{
//                            ForEach(0..<3) { col in
//                                Button {
//                                    print("Pressed")
//                                }
//                            label: {
//                                Text("Button \(col + 1)")
//                                    .frame(width: 80, height: 80)
//                                    .background(Color.red)
//                                    .clipShape(RoundedRectangle(cornerRadius: 20, style:.continuous))
//                            }
//                            }
//                        }.background(Color.black)

//                        HStack{
//                            Button {
//                                print("Pressed")
//                            }
//                        label: {
//                            Text("Button 1")
//                                .frame(width: 80, height: 80)
//                                .background(Color.red)
//                                .clipShape(RoundedRectangle(cornerRadius: 20, style:.continuous))
//                        }
//                            Button {
//                                print("Pressed")
//                            }
//                        label: {
//                            Text("Button 2")
//                                .frame(width: 80, height: 80)
//                                .background(Color.red)
//                                .clipShape(RoundedRectangle(cornerRadius: 20, style:.continuous))
//                        }
//                            Button {
//                                print("Pressed")
//                            }
//                        label: {
//                            Text("Button 3")
//                                .frame(width: 80, height: 80)
//                                .background(Color.red)
//                                .clipShape(RoundedRectangle(cornerRadius: 20, style:.continuous))
//                        }
//
//                        }.background(Color.black)
//                    }
//                }
//        }
