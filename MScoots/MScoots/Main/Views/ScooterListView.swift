//
//  ScooterListView.swift
//  MScoots
//
//  Created by Justin Trubela on 3/3/23.
//

import SwiftUI

struct ScooterListView: View {
    @State var ledON = true

    var body: some View {
        
        ZStack{
//Image("Scooter List").scaleEffect(x: 4, y: 2, anchor: .center)
            
            ScrollView{
                    ForEach(1..<25){scooter in
                        Rectangle().size(width: 400, height: 3)
                        HStack{
                            Text("LOT \(60)").font(.title2).padding(.bottom,25)
                            Spacer()
                            Section{
/* Image("LED ON").MakeLED() */          Button{
/*   if (scooter % Int(2) != 0 {*/                  ledON.toggle()
/*      Image("LED ON").MakeLED()*/      }label: {
/*     } else {*/                  Image("scooter").MakeScooter()}
/*Image("LED OFF").MakeLED()*/     }
/*                            }*/  Image(scooter%2 != 0 && ledON == true ? "LED ON" : "LED OFF")


                            }.scaleEffect( y: 0.7, anchor: .center)
                        }.padding(.leading,15).padding(.trailing,30)
                        Rectangle().size(width: 400, height: 3)
                    }
                }.scaleEffect(x:0.9,y:0.9)
        }
    }

struct ScooterListView_Previews: PreviewProvider {
    static var previews: some View {
        ScooterListView()
    }
}
