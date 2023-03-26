//
//  ScooterListView.swift
//  MScoots
//
//  Created by Justin Trubela on 3/3/23.
//

import SwiftUI

struct ScooterListView: View {
    
    @State var scootAvailable = true
    @State var canReserve = true
    
 

    var body: some View {
        NavigationView{
            ZStack{
//TODO: Add Battery images
                        List{
                                ForEach(scooters){scooter in
                                    Rectangle().size(width: 400, height: 3)
                                    HStack{


                                        ScooterListItemView()

                                        
                                        //TODO: Add logic for reserving a scooter
                                        Button{}label:{
                                            Text("Reserve")}.buttonStyle(.borderedProminent)

                                        //TODO: add logic so that if anwhere on the list item some more details are provided about the scooter

                                        
                                        Spacer()
                                        let LEDcheck = checkScooterAvail(scooterAvail: scooter.isAvailable)
                                        if LEDcheck == 1{
                                            Image("LED ON")
                                        }
                                        else if LEDcheck == 0 && LEDcheck == -1 {
                                            Image("LED OFF")
                                        }
                                        else {
                                            Image("LED OFF")
                                        }
                                        Spacer()
                                        
                                        //                                        //TODO: Add logic for reserving a scooter
                                        
                                    }
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        Color.white
                                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                            .ignoresSafeArea()
                                    )
                                }

                        }.listStyle(InsetListStyle())

                
            }.navigationTitle("Scoots")
        }.ignoresSafeArea()
    }
    
}

struct ScooterListView_Previews: PreviewProvider {
    static var previews: some View {
        ScooterListView()
    }
}

struct ScooterMaker: ViewModifier {
    func body(content: Content) -> some View {
        content
//            .frame(width:120,height:20,alignment: .center ).border(.purple)
    }
}
extension View {
    func MakeScooter() -> some View {
        modifier(ScooterMaker())
    }
}
