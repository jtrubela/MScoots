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
        VStack{
            Text("Load and go to LandingViewHome")
        }
    }
}



struct LoadingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreenView()
    }
}
