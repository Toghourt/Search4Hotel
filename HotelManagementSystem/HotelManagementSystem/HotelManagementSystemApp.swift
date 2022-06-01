//
//  HotelManagementSystemApp.swift
//  HotelManagementSystem
//
//  Created by 童存善 on 2022/5/28.
//

import SwiftUI

@main
struct HotelManagementSystemApp: App {
    @StateObject private var dataController = DataController()
    @ObservedObject var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            IndexView()
            //RegisterView()
            //UserView()
            //ListingView(areaName: "Hangzhou")
                .environment(\.managedObjectContext, dataController.container.viewContext)
            //RegisterView()
            
        }
    }
}
