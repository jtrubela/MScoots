//
//  RegistrationView.swift
//  crud-demo
//
//  Created by Justin Trubela on 2/19/23.
//

import SwiftUI
import Firebase

struct RegistrationView: View {
    
    @ObservedObject var model = ViewModel()
    @State var userHome = UserHomeView()
    
    @State var CWID = ""
    @State var first_name = ""
    @State var last_name = ""
    
    @State var email = ""
    @State var password = ""
    @State var password2 = ""

    @State var newUserStatusMessage = ""

    @State var shouldShowImagePicker = false
    @State var goToHomeUserView = UserHomeView()
    
    @State var image: UIImage?
    
    var body: some View {
        NavigationView{
            VStack {
                List{
                    Section("Profile Image"){
                        
                        Button {
                            shouldShowImagePicker.toggle()
                        } label: {
                            
                            
                            VStack {
                                
                                
                                if let image = self.image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 90, height: 90)
                                        .cornerRadius(64)
                                } else {
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 64))
                                        .padding()
                                        .foregroundColor(Color(.label))
                                }
                            }
                            .overlay(RoundedRectangle(cornerRadius: 64)
                                .stroke(Color.black, lineWidth: 3)
                            )
                        }

                        .navigationViewStyle(StackNavigationViewStyle())
                        .fullScreenCover(
                            isPresented: $shouldShowImagePicker, onDismiss: nil) {
                                ImagePicker(image: $image)
                            }
//                            .frame(height: 120)
                    }
                    
                    
                    
                                        Section("Name") {
                                            TextField("First Name",text: $first_name)
                                            TextField("Last Name", text: $last_name)
                                        }
                    
                    
                                        Section("Campus Wide ID"){
                                            TextField("CWID", text: $CWID)
                                        }
                    
                    
                    Section("Email and Password"){
                        TextField("Email Address", text: $email)
                        
                        SecureField("Password",text: $password)
                        SecureField("Re-Enter Password", text: $password2)
                        
                    }
                    
                    
                    
                    
                    
                    
//                    Button{} label: {}
                }.toolbarColorScheme(.dark, for: .bottomBar).ignoresSafeArea().padding(10).navigationBarBackButtonHidden(false)
                Button {
                                        newUserStatusMessage = model.createNewAccount(email: email, password: password)
                    
                    
                                        //                        createNewAccount(email: email, password: password)
                                        //Switch to UserHomeView
                                        //UserHomeView()
                    //maybe???
                                        
                                    } label: {
                                        Text("Register")
                                    }.AddMy_ButtonSytle()
                
                Text(self.newUserStatusMessage).foregroundColor(.red)
                
            }
        }
    }
//
 /*
        func persistImageToStorage() {
    //        let filename = UUID().uuidString
            
            guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
            
            let ref = FirebaseManager.shared.storage.reference(withPath: uid)
            guard let imageMeta = self.image?.jpegData(compressionQuality: 0.5) else { return }
            ref.putData(imageMeta, metadata: nil) { metadata, err in
                if let error = err {
                    self.newUserStatusMessage = "Failed to push image to Storage: \(error)"
                    print(error )
                    return
                }
                
                ref.downloadURL { url, err in
                    if let err = error {
                        self.newUserStatusMessage = "Failed to retrieve downloadURL: \(err)"
                        print(error)
                        return
                    }
                    
                    self.newUserStatusMessage = "Successfully stored image with url: \(url?.absoluteString ?? "unwrap success")"
                    //store the url in the user
                    
                    model.UpdateUserData(user: model.User?, email: "new user status", imageProfileUrl: url)
                    
//                    print(url?.absoluteString ?? "Success. Not working")
                }
            }
        }*/
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(newUserStatusMessage: "")
    }
}
