//
//  MyScootsView.swift
//  MScoots
//
import SwiftUI
import Firebase


struct MyScootsView: View {
    
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
                                    Text("Lot 60").font(Font.system(size: 16))
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
                    
                }.navigationBarTitle("Lot 60")
            }
            .padding(.bottom, 120)
            
        }
    }
    
    
}
struct MyScootsView_Previews: PreviewProvider {
    static var previews: some View {
        MyScootsView()
    }
}
