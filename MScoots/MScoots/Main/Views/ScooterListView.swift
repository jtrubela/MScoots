//
//  ScooterListView.swift
//  MScoots
//
//  Created by Justin Trubela on 3/3/23.
//

import SwiftUI

struct ScooterListView: View {
    
    //create an verification for ledColor to represent available/unavailable
    //  AVAIALBLE = GREEN
    //  UNAVAILABLE = GREY
    @State var scootAvailable = true

    var body: some View {
        NavigationView{
            ZStack{
                //ScrollView Stack for all scooters avaiable to be shown on the list
                ScrollView{
                    //Stack for all elements
                    VStack{
                        //Stack for the list item titles
                        HStack{
                            Text("Location")
                            Spacer()
                            Text("Battery")
                            Spacer()
                            Text("Scooter")
                            Spacer()
                            Text("Status")
                        }
                        //Stack for the individual scooters
                        ForEach(1..<25){scooter in
                            Rectangle().size(width: 400, height: 3)
                            HStack{
                                Button{
                                    
                                }label: {
                                    Text("LOT \(60)").font(.title2).padding(.bottom,25).foregroundColor(.black)
                                    Spacer()
                                    Section{
                                        Button{
                                            scootAvailable.toggle()
                                        }label: {
                                            Image("scooter").MakeScooter()}
                                    }
                                    //if scooter is available turn green light on, otherwise turn grey light on
                                    Image(scootAvailable ? "LED ON" : "LED OFF")
                                }
                                
                            }.scaleEffect( y: 0.7, anchor: .center)
                        }.padding(.leading,15).padding(.trailing,30)
                        Rectangle().size(width: 400, height: 3)
                    }
                }
            }.navigationTitle("Scoots")
                .scaleEffect(x:0.9,y:0.9)
        }
    }
}

struct ScooterListView_Previews: PreviewProvider {
    static var previews: some View {
        ScooterListView()
    }
}
