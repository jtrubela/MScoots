//
//  SwiftUIView.swift
//  MScoots
//
//  Created by Vincent Cavallaro on 4/15/23.
//

import SwiftUI
import _MapKit_SwiftUI

 struct mapView: View {
     @StateObject private var viewModel = mapViewModel()


     var body: some View {
         Map(coordinateRegion: $viewModel.region)
             .ignoresSafeArea(edges: .all)
             .accentColor(Color(.systemRed))
             .onAppear{
                 viewModel.checkIfLocationSerivcesIsEnabled()
             }
     }
 }

 struct mapView_Previews: PreviewProvider {
     static var previews: some View {
         mapView()
     }
 }

 
