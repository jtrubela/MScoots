//
//  utilityStyling.swift
//  MScoots
//
//  Created by Justin Trubela on 2/27/23.
//

import Foundation
import SwiftUI


struct SquareBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: UIScreen.main.bounds.width-50, maxHeight: 200)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(5)
    }
}
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



struct myNavigationViewStyler: ViewModifier {
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
    func AddMyNavigationViewStyler() -> some View {
        modifier (myNavigationViewStyler())
    }
}


struct myNavigationViewStyler2: ViewModifier{
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
    func AddMyNavigationViewStyler2() -> some View {
        modifier (myNavigationViewStyler2())
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



/*-----------------------------END>---Custom Styling---<END--------------------------*/


struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}




