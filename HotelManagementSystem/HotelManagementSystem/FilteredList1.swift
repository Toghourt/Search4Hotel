//
//  FilteredList.swift
//  HotelManagementSystem
//
//  Created by 童存善 on 2022/5/29.
//  use for User

import SwiftUI

struct FilteredList1: View {
    
    @FetchRequest var fetchRequest: FetchedResults<User>
    
    @State private var correct = false
    @State private var wrong = false

    @ObservedObject var viewModel = ViewModel()
    
    var pswd: String = ""
    
    init(filter: String, password: String) {
        _fetchRequest = FetchRequest<User>(sortDescriptors: [], predicate: NSPredicate(format: "email LIKE %@", filter))
        pswd = password
    }
    var body: some View {
        let user = fetchRequest.first
        
        ZStack{
            Rectangle()
                .fill(Color(hue: 0.34, saturation: 0.404, brightness: 0.638))
                .frame(width: UIScreen.main.bounds.size.width-40, height: 50)
            Button("Sign In") {
                if user?.password == pswd {
                    correct = true
                } else {
                    wrong = true
                }
            }
                .foregroundColor(.white)
                .alert("wrong email or password", isPresented: $wrong) {
                    Button("OK", role: .cancel) { }
                }
                .alert("Sign In success", isPresented: $correct) {
                    Button("OK", role: .cancel) { }
                }

        }
        .padding(.vertical, 10)
    }
}

