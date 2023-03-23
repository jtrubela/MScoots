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
        .init(name: "LoginView"),
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
                    NavigationLink("LoginView", destination: ViewForItem(ViewItem(name: "LoginView")))

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
struct ScooterMaker: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaleEffect(x:0.3,y:0.3)
                .frame(width:120,height:40,alignment: .center ).padding(.bottom,5)
    }
}
extension View {
    func MakeScooter() -> some View {
        modifier(ScooterMaker())
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
        
            .frame(width: 150, height: 50)
            .background(
                RoundedRectangle(cornerRadius: 10,style:.continuous)
                    .fill(.white)
            )
            .clipShape(Capsule())
        
            .fontWeight(.bold)
            .foregroundColor(.red)
            .padding(20)
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
    func AddMy_ButtonSytle() -> some View {
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







