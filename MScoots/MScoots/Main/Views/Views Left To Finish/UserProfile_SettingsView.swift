//
//  UserProfile_SettingsView.swift
//  MScoots
//
//  Created by Justin Trubela on 3/21/23.
//

import SwiftUI

struct UserProfile_SettingsView: View {
    
    
    // create image picture verification
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    
    //Get the users name from the database studentUser
    @State var userName: String = "Testing Name"
    @State var userCWID: String = "00000000"
    
    var body: some View {
        
        
        NavigationView{
            VStack{
                
                HStack{
                    Text("Profile")
                        .font(.largeTitle).padding(.leading, 20).padding(.top, 20)
                    Spacer()
                }
                .padding(.bottom, 30)
                
                
                VStack{
                    Button {
                        shouldShowImagePicker.toggle()
                    } label: {
                        VStack {
                            if let image = self.image {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 130, height: 130)
                                    .cornerRadius(64)
                            } else {
                                Image(systemName: "person.fill")
                                    .font(.system(size: 120))
                                    .padding()
                                    .foregroundColor(Color(.label))
                            }
                        }
                        .overlay(Circle()
                            .stroke(Color.black, lineWidth: 3)
                        )
                        
                        .fullScreenCover(
                            isPresented: $shouldShowImagePicker, onDismiss: nil) {
                                ImagePicker(image: $image)
                            }
                        
                    }
                    Button {
                        shouldShowImagePicker.toggle()
                    } label: {
                        Text("Edit Image").font(.caption)
                            .padding(.bottom, 20)
                    }
                }
                
                HStack{
                    VStack{
                        Text("Name:")
                            .padding(.top, 10)
                        Text("CWID:").padding()
                        Text("")
                    }
                    .font(.system(size:20))
                    .italic()
                    .padding(.leading, 30)
                    
                    Spacer()
                    
                    VStack{
                        Text("\(userName)")
                        Text("\(userCWID)").padding()
                    }
                    Spacer()
                }
                .font(.title2)
                .padding()
                Spacer()
                Spacer()
                HStack{
                    Text("Settings")
                        .font(
                            .system(size: 20, weight: .bold, design: .rounded)
                        )
                        .textCase(.uppercase)
                        .foregroundColor(.gray)
                        .padding(.leading, 30)
                    Spacer()
                }
                Divider()
                VStack{
                    HStack{
                        Spacer()
                        Text(" Wallet")
                        Spacer()
                        Spacer()
                        Spacer()
                        Button{
                            
                        } label: {
                            Image(systemName: "arrow.right")
                        }.font(.system(size:40))
                        Spacer()
                    }
                    
                    
                    Divider()
                    
                    HStack{
                        Spacer()
                        Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                            Text("Verified")
                        }.padding(.trailing, 57)
                    }.padding(.leading,50)
                    Divider()

                    Spacer()
                }.font(
                    .system(size: 25, weight: .none, design: .rounded)
                )
            }
        }
    }
}

struct UserProfile_SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile_SettingsView()
    }
}

    
    /*--------------------------------------------------------*/
    //
    //User profile information
    //  Add Profile Image
    //
    //  Store the users selected image
    //
    /*--------------------------------------------------------*/
    struct ImagePicker: UIViewControllerRepresentable {
        
        @Binding var image: UIImage?
        
        private let controller = UIImagePickerController()
        
        func makeCoordinator() -> Coordinator {
            return Coordinator(parent: self)
        }
        
        class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
            
            let parent: ImagePicker
            
            init(parent: ImagePicker) {
                self.parent = parent
            }
            
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                parent.image = info[.originalImage] as? UIImage
                picker.dismiss(animated: true)
            }
            
            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                picker.dismiss(animated: true)
            }
            
        }
        
        func makeUIViewController(context: Context) -> some UIViewController {
            controller.delegate = context.coordinator
            return controller
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
        
    }
