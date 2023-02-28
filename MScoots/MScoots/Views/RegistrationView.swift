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
    
    
    @State var CWID = ""
    @State var first_name = ""
    @State var last_name = ""
    
    @State var email = ""
    @State var password = ""

    @State var newUserStatusMessage = ""

    @State var shouldShowImagePicker = false
    
    @State var image: UIImage?
    
    var body: some View {
        
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
                                            .frame(width: 128, height: 128)
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
                            .frame(height: 120)
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
                        
                        Section{
                            SecureField("Password",text: $password)
                        }
                    }
                    
                    
                    Button {
                        newUserStatusMessage = model.createNewAccount(email: email, password: password)
                        //Switch to UserHomeView
                    } label: {
                        Text("Register")
                    }
                    
                    
                    
                    Button{
                        newUserStatusMessage = model.createNewAccount(email: email, password: password)
                    } label: {
                        Text("Test Registration Authorization")
                    }
                    Text(newUserStatusMessage).foregroundColor(.blue)
                    
                    
            }
            
            
            Text(self.newUserStatusMessage).foregroundColor(.red)
            
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
