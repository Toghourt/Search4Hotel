//
//  FilteredList.swift
//  HotelManagementSystem
//
//  Created by 童存善 on 2022/5/29.
//  use for Hotel

import SwiftUI

struct FilteredList: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var hotels: FetchedResults<Hotel>
    @FetchRequest var fetchRequest: FetchedResults<Hotel>
    
    init(filter: String) {
        _fetchRequest = FetchRequest<Hotel>(sortDescriptors: [], predicate: NSPredicate(format: "area LIKE %@", filter))
    }
    
    var body: some View {
        List(fetchRequest, id: \.self) { hotel in
            NavigationLink {
                DetailView(hotel: hotel)
            } label: {
                HStack {
                    EmojiRatingView(rating: hotel.rating)
                        .font(.largeTitle)

                    VStack(alignment: .leading) {
                        Text(hotel.name ?? "Unknown Name")
                            .font(.headline)
                        Text(hotel.hostName ?? "Unknown Host")
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
}

