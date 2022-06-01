//
//  ListingView.swift
//  HotelManagementSystem
//
//  Created by 童存善 on 2022/5/29.
//

import SwiftUI
import CoreData

struct ListingView: View {
    @State private var showingAddScreen = false
    
    @EnvironmentObject var viewModel: ViewModel
    
    let areaName: String
    var body: some View {
        NavigationView {
            VStack {
                FilteredList(filter: areaName)
                    .navigationTitle("PageViewer")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                showingAddScreen.toggle()
                            } label: {
                                Label("Add Hotel", systemImage: "plus")
                            }
                        }
                        ToolbarItem(placement: .navigationBarLeading) {
                            //EditButton()
                            Button("Back") {
                                viewModel.toggleToListing()
                            }
                        }
                        
                    }
                    .sheet(isPresented: $showingAddScreen) {
                        AddHotelView()
                    }
                /*Button("Back") {
                    viewModel.toggleToListing()
                }*/
            }
        }
    }
    
    /*func deleteHotels(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our fetch request
            let hotel = hotels[offset]

            // delete it from the context
            moc.delete(hotel)
        }

        // save the context
        if moc.hasChanges {
            try? moc.save()
        }
    }*/
    
}

struct ListingView_Previews: PreviewProvider {
    static var previews: some View {
        ListingView(areaName: "Hangzhou")
    }
}
