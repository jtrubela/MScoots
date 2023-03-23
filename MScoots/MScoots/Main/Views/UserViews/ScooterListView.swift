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
//TODO: Once the necessary data and objects are created to individually initialize the data we will need to change the ForEach loop
//TODO: Add Battery images
                        ForEach(1..<25){scooter in
                            Rectangle().size(width: 400, height: 3)
                            HStack{
                                Button{
                                    //TODO: add logic so that if anwhere on the list item some more details are provided about the scooter
                                }label: {
                                    //TODO: add variable for current lot it is located in using
                                    Text("LOT \(60)")
                                        .font(.title2)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Section{
                                        Button{
                                            scootAvailable.toggle()
                                        }label: {
                                            Image("scooter").MakeScooter()
                                                .scaleEffect(x:0.8 ,y: 0.8, anchor: .center)
                                        }
                                    }
                                    //TODO: Add logic for availability
                                    //if scooter is available turn green light on, otherwise turn grey light on
                                    Image(scootAvailable ? "LED ON" : "LED OFF")
                                    
                                    Button{
                                        //TODO: Add logic for reserving a scooter
                                    }label:{
                                        Text("Reserve")
                                    }
                                    .scaleEffect( y: 0.7, anchor: .center)
                                    .padding()
                                    .frame(width: 120)
                                    .buttonStyle(.bordered)
                                }
                            }
                            .scaleEffect( y: 0.7, anchor: .center)
                        }
                        Rectangle()
                            .size(width: 400, height: 3)
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
