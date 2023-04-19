//
//  ScooterListView.swift
//  MScoots
//
//  Created by Justin Trubela on 3/3/23.
//
import SwiftUI
import Firebase


struct ScooterListView: View {
    @ObservedObject var Firestore = Firebase_Firestore()

    var body: some View {
        NavigationView{
            ZStack{
                //TODO: Add Battery images
                List{
                    ForEach(Firestore.Scoot_list){scooter in
                        HStack{

                            VStack{
                                
                                Rectangle().size(width: 400, height: 3)

                                HStack{
                                    
                                    Text(scooter.location)
                                        .frame(width: 80, height: 80, alignment: .leading)
                                        .font(Font.system(size: 16)).multilineTextAlignment(.leading)
                                    
                                    Spacer()
                                    
                                    Image("scooterList")                                        .frame(width: 80, height: 80, alignment: .leading)

                                   
                                    /*
                                     if scooter status comes back as a
                                        Near         1 return the green image
                                        Close        0 retrun the yellow image
                                        Far         -1 return the red image
                                        No Funds    -2
                                     */
                                    if scooter.isAvailable == "1" {
                                        Image(systemName: "arrowtriangle.up.fill").foregroundColor(.green)
                                    }
                                    else if scooter.isAvailable == "0" {
                                        Image(systemName: "arrowtriangle.up.fill").foregroundColor(.yellow)
                                    }
                                    else if scooter.isAvailable == "-1" {
                                        Image(systemName: "arrowtriangle.down.fill").foregroundColor(.red)
                                    }
                                    else {
                                        Image(systemName: "arrowtriangle.down.fill").foregroundColor(.black)
                                    }
//                                    Text("\(scooter.isAvailable)")
                                    
                                    if scooter.nearestCharger == "Green" {
                                        Image(systemName: "circle.fill").foregroundColor(.green)
                                    }
                                    else if scooter.nearestCharger == "Yellow" {
                                        Image(systemName: "circle.fill").foregroundColor(.yellow)
                                    }
                                    else if scooter.nearestCharger == "Red" {
                                        Image(systemName: "circle.fill").foregroundColor(.red)
                                    }
                                    else if scooter.nearestCharger == "Blue" {
                                        Image(systemName: "circle.fill").foregroundColor(.blue)
                                    }
                                    else if scooter.nearestCharger == "Black" {
                                        Image(systemName: "circle.fill").foregroundColor(.black)
                                    }
                                    else if scooter.nearestCharger == "Pink" {
                                        Image(systemName: "circle.fill").foregroundColor(.pink)
                                    }
                                    else {
                                        Image(systemName: "circle.fill").foregroundColor(.brown)
                                    }
//                                        Text("\(scooter.nearestCharger)")
                                    
                                    
                                    //TODO: Add logic for reserving a scooter
                                    Button{}label:{
                                        Text("Reserve")}.buttonStyle(.borderedProminent)
                                    
                                    
                                }
                            }

                        }
                        .background(
                            Color.white
                                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        )
                    }
 
                }
                .listStyle(InsetListStyle())

            }
            .navigationTitle("Scoots")
        }
        .onAppear(
            perform: Firestore.getScootData
        )
    }

}

struct ScooterListView_Previews: PreviewProvider {
    static var previews: some View {
        ScooterListView()
    }
}
