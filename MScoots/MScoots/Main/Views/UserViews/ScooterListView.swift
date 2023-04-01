//
//  ScooterListView.swift
//  MScoots
//
//  Created by Justin Trubela on 3/3/23.
//

import SwiftUI
import Firebase


struct ScooterListView: View {
    
    @State var user = FirebaseManager.shared.auth.currentUser?.email
    @State var scootAvailable = true
    @State var canReserve = true
    @State var LED = ""
    @State var isAvailableScooters = [[Scooter]]()
    @State var availableScooters: [Scooter] = [Scooter]()
    @State var unavailableScooters: [Scooter] = [Scooter]()
    
    var body: some View {
        NavigationView{
            
            VStack{

                //                //TODO: Add Battery images
                //                //TODO: Add logic for reserving a scooter
                //
                //                //TODO: add logic so that if anwhere on the list item some more details are provided about the scooter
                //
                //                //TODO: Add logic for reserving a scooter

  
                
                
                
                //            NavigationView{
                List{
                    //                    ForEach (scooters, id: \.self) { scooter in
                    ForEach(scooters) { scooter in
                        
                        
                        HStack{
                            
                            //                                GroupBox(label: Label("", systemImage: "")
                            //                                    {
                            //                                    Spacer()
                            
                            //                            ScooterListItemView(scooters: isAvailableScooters, Scooter: scooter, ImageText: "scooterList", imageNum: checkScooterAvail(scooterAvail: scooter.isAvailable), _ImageName: LED)
                            //                                    Spacer()
                            
                            //                                }
                            //                                .shadow(color: .black, radius: 15, x: 5, y: 5)
                            //                                .groupBoxStyle(DefaultGroupBoxStyle())
                            
                            Button{
                                
                            }label:{
                                HStack{
                                    Text(scooter.location).frame(width: 130, height: 80).border(.black).font(Font.system(size: 16))
                                    Spacer()

                                    HStack{
                                        HStack{
                                            Image("scooterList").scaledToFill()
                                            
                                            //                                    Spacer()
                                            //TODO: Add logic for availability
                                            //if scooter is available turn green light on, otherwise turn grey light on

                                        }
                                    }
                                }
                                .indexViewStyle(.page(backgroundDisplayMode: .automatic))
                                
                            }
                            
                            
                            
                            .listStyle(GroupedListStyle())
                        }
                        
                    }.onDelete(perform: delete)
                    
                }.toolbar {
                    EditButton()
                    
                }.navigationBarTitle("Scoots")
            }
            .padding(.bottom, 120)
            
        }
    }
    
    
}
struct ScooterListView_Previews: PreviewProvider {
    static var previews: some View {
        ScooterListView()
    }
}



//
//  ScooterListView.swift
//  MScoots
//
//  Created by Justin Trubela on 3/3/23.
//


struct ScooterListView2: View {
    
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

struct ScooterListView2_Previews: PreviewProvider {
    static var previews: some View {
        ScooterListView2()
    }
}
