//
//  utilityStyling.swift
//  MScoots
//
//  Created by Justin Trubela on 2/27/23.
//
//
//  The purpose for this file is to create a standardized way to add custom modifiers to achieve a uniform
//      output for items used throughout the projects
//
//
//  For modifying elements for view content items you need to establish the following:
//      an extension of View that returns some view
//      a struct that uses that returned view
//

import Foundation
import SwiftUI


/*-----------------------------------------------------------------------------------------------------/
 //View Items                View Items                 View Items                     View Items
 //                     View Items                                             View Items
 //     View Items        View Items      View Items         View Items                 View Items
 //             View Items               View Items                        View Items
 //    View Items         View Items         View Items         View Items         Views/Scenes
 /------------------------------------------------------------------------------------------------------*/


struct ProfilePhotoButton: View {
    var image_: Image?
    var inputImage: UIImage?
    
    var body: some View {
        VStack{
            if let image_ = self.inputImage {
                Image(uiImage: image_)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 128, height: 128)
                    .cornerRadius(64)
            } else {
                Image(systemName: "person.fill")
                    .font(.system(size: 64))
                    .padding()
                    .foregroundColor(Color(.label))
                    .overlay(RoundedRectangle(cornerRadius: 64)
                        .stroke(Color.black, lineWidth: 3)
                    )
            }
        }

    }
}










struct ScooterListItemView: View {
    var Scooter: Scooter?
    
    var ImageText = "scooterList"
    var imageNum: Int {
        checkScooterAvail(scooterAvail: Scooter?.isAvailable ?? "\(randomScooterAvailability)!")
    }
    
    
    var body: some View {
        HStack{
            Text(Scooter?.location ?? "\(randomLocation)!")
                .font(Font.system(size: 16))


            
            Spacer()
            
            
            let LEDcheck = imageNum
            if LEDcheck == 1{
                Image("LED ON")
            }
            else if LEDcheck == 0{
                Image("LED OFF")
            }
            Spacer()
            Image(ImageText)

            Spacer()
            //TODO: Add logic for availability
            //if scooter is available turn green light on, otherwise turn grey light on
        }
    }
}

struct EmailTextField: View {
    @Binding var email: String
    var buttonsDisabled = false
    var enableButtons: () -> Void
    
    var body: some View {
        TextField("Email Address", text: $email).padding(10)
            .frame(width: 320, height: 40, alignment: .center)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .font(.title2)
            .textFieldStyle(.plain)
//            .focused($focusField, equals: .email)// field bound to the .email case
//            .onSubmit {focusField = .password}
            .onChange(of: email) { _ in
                //Enable buttons?
                self.enableButtons()
            }
    }
}


struct SecurePasswordField: View {
    
    @Binding var password: String
    var email: String
    var buttonsDisabled = false

    
    var enableButtons: () -> Void


    
    

    
    
    var body: some View {
        
        SecureField("Password", text: $password)
            .padding(10)
            .frame(width: 320, height: 40, alignment: .center)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .font(.title2)
            .textFieldStyle(.plain)
//            .focused($focusField, equals: password)
//            .onSubmit {
//                focusField = nil
//
//            }
            .onChange(of: email) { _ in
                self.enableButtons()
            }
    }
    
}



struct ProfileButton: View {
    var ImageText: String
    
    var body: some View {
        
        Image(systemName: ImageText)
            .font(.system(size: 30))
        
            .font(.system(size: 34))
            .padding()
            .foregroundColor(Color(.label))
            .overlay(RoundedRectangle(cornerRadius: 64)
                .stroke(Color.black, lineWidth: 3)
            )
    }
}

struct LogoutButton: View {
    var ImageText: String
    
    var body: some View {

            VStack{
                Image(systemName: ImageText)
                Text("Log Out")
            }
            .font(.system(size: 22))
            .buttonStyle(.bordered)
    }
}

struct LandingViewLoginButton1: View {

    var body: some View {

        Text("Login")
        .frame(width: 130, height: 30)
        .background(
            RoundedRectangle(cornerRadius: 10,style:.continuous)
                .fill(.white)
        )
        .clipShape(Capsule())
        .fontWeight(.bold)
        .foregroundColor(.blue)

    }
}
struct LandingViewLoginButton2: View {

    var body: some View {

        Text("Login")
            .frame(width: 130, height: 30)
            .background(
                RoundedRectangle(cornerRadius: 10,style:.continuous)
                    .fill(.white)
            )
            .clipShape(Capsule())
        
            .fontWeight(.bold)
            .foregroundColor(.gray)

    }
}


struct HamburgerMenu: View {    
    var body: some View {
        
        Image(systemName: "line.3.horizontal")
            .addMyHambugerMenuStyler()
            .font(.system(size: 30))
            .frame(width: 50, height :50)
            .padding(.trailing,25)
    }
}



struct FlagImage: View {
    var ImageText: String
    
    var body: some View {
        Image(ImageText)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 50)
    }
}



/*-----------------------------------------------------------------------------------------------------/
 //Views/Scenes                Views/Scenes                 Views/Scenes                     Views/Scenes
 //                     Views/Scenes                                             Views/Scenes
 //     Views/Scenes        Views/Scenes      Views/Scenes         Views/Scenes                 Views/Scenes
 //             Views/Scenes               Views/Scenes                        Views/Scenes
 //    Views/Scenes         Views/Scenes         Views/Scenes         Views/Scenes         Views/Scenes
 /------------------------------------------------------------------------------------------------------*/


struct CustomScene: Scene {
    
    struct ViewItem: Identifiable, Hashable {
        let name: String
        let id = NSUUID().uuidString
    }
    
    let views: [ViewItem] = [
        //Login/Register
        .init(name: "LandingPageView"),
        .init(name: "RegistrationView"),
//        .init(name: "LoginView"),
        .init(name: "ResetPasswordView"),
        
        .init(name: "UserHomeView"),
        .init(name: "ScanQRView"),
        .init(name: "ScooterListView"),
        .init(name: "ScootMapView"),
        .init(name: "MyScootsView"),
        .init(name: "UserProfile_SettingsView"),
        .init(name: "WalletView"),
        //Admin.....
        .init(name: "AdminUserHomeView"),
        .init(name: "AdminScooterManagerView"),
        .init(name: "AdminUserManagerView"),
        .init(name: "AdminFindScooterView")
            
    ]
    @Environment(\.scenePhase) private var scenePhase
    @State private var navigationPath = [ViewItem]()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationPath){
                ZStack{
//                    NavigationLink("LoginView", destination: ViewForItem(ViewItem(name: "LoginView")))

                }.navigationDestination(for: ViewItem.self){ view in
                    VStack{
                        ViewForItem(view)
                    }
                }.navigationBarBackButtonHidden(true)
            }
        }
        .onChange(of: scenePhase) { newScenePhase in
            if newScenePhase != .active {
                DispatchQueue.main.async {

                }
            }
        }
    }
    //update the view to the navigationstack path variable
    func ViewForItem(_ view: ViewItem) -> AnyView {
        switch view.name {
        case "LandingPageView":
            return AnyView(LandingPageView())
//        case "LoginView":
//            return AnyView(LoginView())
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
//TODO: Awaiting vinnies implementation of mapview
//        case "ScootMapView":
//            return AnyView(ScootMapView())
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
}

/*-----------------------------------------------------------------------------------------------------/
 //Backgrounds                Backgrounds                 Backgrounds                     Backgrounds
 //                     Backgrounds                                             Backgrounds
 //     Backgrounds        Backgrounds      Backgrounds         Backgrounds                 Backgrounds
 //             Backgrounds               Backgrounds                        Backgrounds
 //    Backgrounds         Backgrounds         Backgrounds         Backgrounds         Backgrounds
 /------------------------------------------------------------------------------------------------------*/


extension View {
    func MakeRoundedSquareBackground() -> some View {
        modifier(SquareBackground())
    }
}


struct LoginView_Background_Style: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.linearGradient(colors: [.pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: 1000, height: 300)
            .rotationEffect(.degrees(135))
            .offset(y: -440)
    }
}
extension View {
    func MakeLoginView_Background_Style() -> some View {
        modifier(LoginView_Background_Style())
    }
}


struct mySquareBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 350, height: 500)
            .background(.thickMaterial)
//            .background(Color.secondary)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(5)
    }
}
extension View {
    func MakeMyBackground() -> some View {
        modifier(mySquareBackground())
    }
}

struct SquareBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: UIScreen.main.bounds.width-50, maxHeight: 200)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(5)
    }
}


/*------------------------------------------------------------------------------------------------------/
 //Images                              Images                 Images                     Images
 //                     Images                                             Images
 //     Images            Images              Images         Images                 Images
 //             Images               Images                                Images
 //    Images         Images         Images         Images         Images                  Images
 /------------------------------------------------------------------------------------------------------*/

struct myHamburgerStyler: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20))
            .scaleEffect(x: 2, y: 3)
            .padding(.trailing,30)
            .foregroundColor(Color.red)
            .bold()
            .shadow(color: .black, radius: 5, x: 6, y: 8)
    }
}
extension View {
    func addMyHambugerMenuStyler() -> some View {
        modifier (myHamburgerStyler())
    }
}

struct LEDMaker: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width:20,height:20,alignment: .center).scaleEffect(x: 0.7, y: 0.7, anchor: .center)
    }
}
extension View {
    func MakeLED() -> some View {
        modifier(LEDMaker())
    }
}





/*------------------------------------------------------------------------------------------------------/
 //Buttons                              Buttons                 Buttons                     Buttons
 //                     Buttons                                             Buttons
 //     Buttons            Buttons              Buttons         Buttons                 Buttons
 //             Buttons               Buttons                                Buttons
 //    Buttons         Buttons         Buttons         Buttons         Buttons                  Buttons
 /------------------------------------------------------------------------------------------------------*/
struct LoginView_Login_ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
        
            .frame(width: 150, height: 30)
            .background(
                RoundedRectangle(cornerRadius: 10,style:.continuous)
                    .fill(.white)
            )
            .clipShape(Capsule())
        
            .fontWeight(.bold)
            .foregroundColor(.red)
    }
}
extension View {
    func Add_LoginView_ButtonStyle() -> some View {
        modifier(LoginView_Login_ButtonStyle())
    }
}

struct AddMyButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 180, height: 50)
            .background(Color.black)
            .background(RoundedRectangle(cornerRadius: 10,style:.continuous))
            .clipShape(Capsule())
            .font(.title3).fontWeight(.bold)
            .foregroundColor(.red)
    }
}
extension View {
    func AddMy_ButtonStyle() -> some View {
        modifier(AddMyButtonStyle())
    }
}

struct addMyForEach_HomeViewButtonStyler2: ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(width: 100, height: 100)
            .background(Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 20, style:.continuous))
            .shadow(color: .black, radius: 7, x: 8, y: 9)
    }
}
extension View {
    func myForEach_HomeViewButtonStyler2() -> some View {
        modifier (addMyForEach_HomeViewButtonStyler2())
    }
}


struct addMyUIButtonStyler: ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(width: 100, height: 100)
            .background(Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 20, style:.continuous))
            .shadow(color: .black, radius: 7, x: 8, y: 9)
    }
}
extension View {
    func myUIButtonStyler() -> some View {
        modifier (addMyUIButtonStyler())
    }
}

struct RegisterAccountButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 300,height: 50)
            .background(Color.white)
            .cornerRadius(10)
            .clipShape(Capsule())
            .padding(15)
        
    }
}
extension View {
    func AddRegisterAccountButton() -> some View {
        modifier (RegisterAccountButton())
    }
}

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
        
            .frame(width: 150, height: 50)
            .background(Color.white)
            .background(RoundedRectangle(cornerRadius: 10,style:.continuous))
            .clipShape(Capsule())
        
            .font(.title2).fontWeight(.bold)
            .foregroundColor(.red)
            .padding(20)
    }
}
extension View {
    func Add_ButtonSytle() -> some View {
        modifier(ButtonStyle())
    }
}


 /*-----------------------------------------------------------------------------------------------------/
  //TextObjects                TextObjects                 TextObjects                     TextObjects
  //                     TextObjects                                             TextObjects
  //     TextObjects        TextObjects      TextObjects         TextObjects                 TextObjects
  //             TextObjects               TextObjects                        TextObjects
  //    TextObjects         TextObjects         TextObjects         TextObjects         TextObjects
  /------------------------------------------------------------------------------------------------------*/
struct LandingFieldText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .bold()
            .foregroundColor(.white)
    }
}
extension View {
    func AddLandingFieldText() -> some View {
        modifier(LandingFieldText())
    }
}



  struct MyTextEntryField: ViewModifier {
      func body(content: Content) -> some View {
          content
              .padding(20)
              .frame(width: 320, height: 50, alignment: .center)
              .border(.black)
              .shadow(color: .red,radius: 30)
              .background(Color.white)
              .clipShape(RoundedRectangle(cornerRadius: 0))
              .font(.title2)
              .textFieldStyle(.plain)
              .padding(10)
      }
  }
  extension View {
      func AddMyTextFieldEntry() -> some View {
          modifier(MyTextEntryField())
      }
  }

struct MyEmailEntryField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .keyboardType(.emailAddress)
            .autocorrectionDisabled().padding(5)
            .textInputAutocapitalization(.never)
            .submitLabel(.next)
    }
}
extension View {
    func AddMyEmailFieldEntry() -> some View {
        modifier(MyEmailEntryField())
    }
}

struct MyPasswordEntryField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textInputAutocapitalization(.never)
            .submitLabel(.done)
    }
}
extension View {
    func AddMyPasswordFieldEntry() -> some View {
        modifier(MyPasswordEntryField())
    }
}



struct TextEntryField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(20)
            .frame(width: 350, height: 50, alignment: .center)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .font(.title2)
            .textFieldStyle(.plain)
            .padding(10)
    }
}
extension View {
    func MakeTextFieldEntry() -> some View {
        modifier(TextEntryField())
    }
}
  
  
  
  
  /*------------------------------------------------------------------------------------------------------/
 //Objects                              Objects                 Objects                     Objects
 //                     Objects                                             Objects
 //     Objects            Objects              Objects         Objects                 Objects
 //             Objects               Objects                                Objects
 //    Objects         Objects         Objects         Objects         Objects                  Objects
 /------------------------------------------------------------------------------------------------------*/



struct myDivider: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 380, height: 5)
            .foregroundColor(.white)
            .padding(15)
        
    }
}
extension View {
    func AddMyDivider() -> some View {
        modifier(myDivider())
    }
}

















/*-----------------------------END>---Custom Styling---<END--------------------------*/







