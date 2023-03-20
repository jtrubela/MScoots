////
////  SwiftUIView.swift
////  MScoots
////
////  Created by Justin Trubela on 3/17/23.
////
//
//import SwiftUI
//
//
//struct CarBrand: Identifiable, Hashable {
//    let name: String
//    let id = NSUUID().uuidString
//}
//
//struct Car: Identifiable, Hashable {
//    let id = NSUUID().uuidString
//    let make: String
//    let model: String
//    let year: Int
//
//    var description: String {
//        return "\(year) \(make) \(model)"
//    }
//
//}
//
//struct SwiftUIView: View {
//    
//    let brands: [CarBrand] = [
//        .init(name: "Ferarri"),
//        .init(name: "Lamborghini"),
//        .init(name: "Mercedes"),
//        .init(name: "Aston Martin"),
//    ]
//    
//    let cars: [Car] = [
//        .init(make: "Ferarri",model: "488", year: 2022),
//        .init(make: "Lamborghini",model: "Aventador", year: 2021),
//        .init(make: "Mercedes",model: "AMG 63", year: 2019),
//        .init(make: "Aston Martin",model: "Vantage", year: 2016)
//    ]
//    
//    @State private var path = [CarBrand]()
//    @State private var showFullStack = false
//    
//    var body: some View {
//        
//        NavigationStack(path: $path){
//            VStack{
//                List{
//                    Section("Manufacturers"){
//                        ForEach(brands) { brand in
//                            //value based navigation requires hashable protocol
//                            NavigationLink(value: brand){
//                                Text(brand.name)
//                            }
//                        }
//                    }
//                    
//                    Section("Cars"){
//                        ForEach(cars) { car in
//                            //value based navigation requires hashable protocol
//                            NavigationLink(value: car){
//                                Text(car.description)
//                            }
//                        }
//                    }
//                }
//                .navigationDestination(for: CarBrand.self) { brand in
//                    VStack{
//                        ViewForBrand(brand)
//                        
//                        Button {
//                            path = []
//                        } label: {
//                            Text("Go to root")
//                        }
//                        
//                    }
//                    
//                    ViewForBrand(brand)
//                }
//                .navigationDestination(for: Car.self) { car in
//                    Color(.systemRed)
//                }
//                
//                //Customize views for specific users
//                Button {
//                    showFullStack.toggle()
//                    if showFullStack {
//                        path = brands
//                    } else {
//                        path = [brands[0], brands[2], brands[1]]
//                    }
//                } label: {
//                    Text("View All")
//                }
//                
//                
//            }
//        }
//    }
//    
//    func ViewForBrand(_ brand: CarBrand) -> AnyView {
//        switch brand.name {
//        case "Ferrari":
//            return AnyView(LoginView())
//        case "Lamborghini":
//            return AnyView(Color(.systemBlue))
//        case "Mercedes":
//            return AnyView(Color(.systemYellow))
//        case "Aston Martin":
//            return AnyView(Color(.systemGreen))
//        default:
//            return AnyView(Color(.systemBlue))
//        }
//        
//    }
//}
//        
//    
//    struct SwiftUIView_Previews: PreviewProvider {
//        static var previews: some View {
//            SwiftUIView()
//        }
//    }
//
