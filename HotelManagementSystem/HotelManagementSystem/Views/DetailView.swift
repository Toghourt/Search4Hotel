//
//  DetailView.swift
//  HotelManagementSystem
//
//  Created by 童存善 on 2022/5/29.
//

import CoreData
import SwiftUI

struct DetailView: View {
    let hotel: Hotel
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    func deleteBook() {
        moc.delete(hotel)

        // uncomment this line if you want to make the deletion permanent
        // try? moc.save()
        dismiss()
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(hotel.name ?? "noPic")
                    .resizable()
                    .scaledToFit()

                Text(hotel.name?.uppercased() ?? "Unknown Name")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            Text(hotel.hostName ?? "Unknown Host")
                .font(.title)
                .foregroundColor(.secondary)

            RatingView(rating: .constant(Int(hotel.rating)))
                .font(.largeTitle)
            Divider()
            VStack{
                HStack {
                    Text("Located in")
                    Text(hotel.area ?? "Unknown city").fontWeight(.bold).foregroundColor(Color.black)
                    Text(",")
                    Text(hotel.country ?? "Unknown country").fontWeight(.bold).foregroundColor(Color.black)
                }.font(.title2)
//                Text("Located in \(hotel.area), \(hotel.country)")
                Text("Price = \(hotel.price) $")
                Text("Minimum Nights = \(hotel.minimumNights)")
            }
            .foregroundColor(.secondary)
            .font(.title)
        }
        .navigationTitle(hotel.name ?? "Unknown Hotel")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delete this book", systemImage: "trash")
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

    static var previews: some View {
        let hotel = Hotel(context: moc)
        hotel.country = "America"
        hotel.area = "Austin"
        hotel.name = "Skylit Midtown Castle"
        hotel.hostName = "Jennifer"
        hotel.price = 150
        hotel.minimumNights = 30
        hotel.rating = 3

        return NavigationView {
            DetailView(hotel: hotel)
        }
    }
}

