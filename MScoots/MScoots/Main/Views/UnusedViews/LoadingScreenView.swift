//
//  LoadingScreenView.swift
//  MScoots
//
//  Created by Justin Trubela on 3/17/23.
//

import SwiftUI

struct LoadingScreenView: View {
    
    var body: some View {
        ZStack{
            VStack {
                Text("Hello, World!")
                Image("scooter")
            }
        }
    }
}

struct LoadingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreenView()
    }
}
