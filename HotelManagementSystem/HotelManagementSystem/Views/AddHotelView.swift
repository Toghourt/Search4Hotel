//
//  AddHotelView.swift
//  HotelManagementSystem
//
//  Created by 童存善 on 2022/5/29.
//

import CoreData
import SwiftUI

struct AddHotelView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @FetchRequest(sortDescriptors: [], predicate: nil) var hotels: FetchedResults<Hotel>
    
    @State private var country = ""
    @State private var area = ""
    @State private var name = ""
    @State private var hostName = ""
    @State private var price = 3
    @State private var minimumNights = 3
    @State private var rating = 3
    
    let Countrys = ["America", "Australia", "Britain", "China", "Japan"]
    let AmericaAreas = ["Austin", "New York", "Los Angeles", "Chicago"]
    let AustraliaAreas = ["Canberra", "Sydney", "Melbourne", "Perth"]
    let BritainAreas = ["London", "Liverpool", "Birmingham", "Manchester"]
    let ChinaAreas = ["Beijing", "Shanghai", "Hangzhou", "Hongkong"]
    let JapanAreas = ["Tokyo", "Nara-ken", "Osaka", "Yokohama"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Country", selection: $country) {
                        ForEach(Countrys, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Area", selection: $area) {
                        if country == "America" {
                            ForEach(AmericaAreas, id: \.self) {
                                Text($0)
                            }
                        } else if country == "Australia" {
                            ForEach(AustraliaAreas, id: \.self) {
                                Text($0)
                            }
                        } else if country == "Britain" {
                            ForEach(BritainAreas, id: \.self) {
                                Text($0)
                            }
                        } else if country == "China" {
                            ForEach(ChinaAreas, id: \.self) {
                                Text($0)
                            }
                        } else if country == "Japan" {
                            ForEach(JapanAreas, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    TextField("Hotel's name", text: $name)
                    TextField("Host's name", text: $hostName)
                    Picker("Hotel's price", selection: $price) {
                        ForEach(0..<1000) {
                            Text(String($0))
                        }
                    }
                    Picker("Minimum nights", selection: $minimumNights) {
                        ForEach(0..<1000) {
                            Text(String($0))
                        }
                    }
                    Section {
                        RatingView(rating: $rating)
                    } header: {
                        Text("Rating it!")
                    }
                }

                Section {
                    Button("Save") {
                        // add the hotel
                        let newHotel = Hotel(context: moc)
                        newHotel.id = UUID()
                        newHotel.country = country
                        newHotel.area = area
                        newHotel.name = name
                        newHotel.hostName = hostName
                        newHotel.price = Int16(price)
                        newHotel.minimumNights = Int16(minimumNights)
                        newHotel.rating = Int16(rating)

                        try? moc.save()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Hotel")
        }
    }
}

struct AddHotelView_Previews: PreviewProvider {
    static var previews: some View {
        AddHotelView()
    }
}
