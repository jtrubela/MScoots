//
//  LoginView.swift
//  crud-demo
//
//  Created by Justin Trubela on 2/21/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var user = studentUser(id: "", CWID: "", Email: "", first_name: "", last_name: "", Password: "")
    //    @State var user = User(FirstName: "", LastName: "", CWID: "", EmailAddress: "", Password: "", Password_ReEntered: "")
//     @EnvironmentObject var userAuth: UserAuth
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.black.ignoresSafeArea()
                
                
                VStack{
                    
                    Rectangle()
                        .MakeLoginView_Background_Style()
                }
                
                
                VStack{
                    
                    Text("MS Scoots")
                        .foregroundColor(.white)
                        .font(.system(size: 70, weight: .bold, design: .rounded))
                    Spacer()
                    
                    VStack{
                        VStack{
                            Image("scooter").animation(.easeIn)
                            
                            TextField("Email Address",text: $user.Email)
                                .MakeTextFieldEntry()
                            SecureField("Password",text: $user.Password)
                                .MakeTextFieldEntry()
                        }
                        VStack{
                            Divider()
                            Rectangle()
                                .frame(width: 380, height: 5)
                                .foregroundColor(.white)
                                .padding(15)
                            
                            
                            Button{
//                                login(user: user)
                            } label: {
                                Text("Log In")
                                    .Add_LoginView_ButtonStyle()
                                    .shadow(color: .red, radius: 30)
                            }
                            VStack{
                                Text("Don't have an account?")
                                    .bold()
                                    .foregroundColor(.white)
                                NavigationLink("Create an account", destination: RegistrationView())
                                    .frame(width: 300,height: 50)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .clipShape(Capsule())
                                    .padding(15)
                            }
                        }
                    }
                }
            }
        }
    }
}

/*------------------------------------Custom Styling---------------------------------*/
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
/*-----------------------------END>---Custom Styling---<END--------------------------*/

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
