//
//  LoadingScreenView.swift
//  MScoots
//
//  Created by Justin Trubela on 3/17/23.
//

import SwiftUI

struct LoadingScreenView: View {
    @State private var NewScreen = false
    
    var body: some View {
        ZStack{
            Color.orange.edgesIgnoringSafeArea(.all )
            
            VStack {
                    
                Button{
                    NewScreen.toggle()
                } label: {
                    Text("Go to Screen").foregroundColor(.black)
                    font(.largeTitle)
                }
                
                Spacer()
                    
                        
                }
            
        }.sheet(isPresented: $NewScreen, content: { MScoots.NewScreen()})
    }
}



struct LoadingScreenView_Previews: PreviewProvider {
    static var previews: some View {
//        NewScreen()
        LoadingScreenView()

    }
}

struct NewScreen: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack (alignment: .topLeading){
            Color.purple.edgesIgnoringSafeArea(.all)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
                
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            }
                   
            )
        }
    }
}


struct showNewScreen: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack (alignment: .topLeading){
            Color.purple.edgesIgnoringSafeArea(.all)
            
            Button(action: {
                
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            }
                   
            )
        }
    }
}
