//
//  ViewModel.swift
//  HotelManagementSystem
//
//  Created by 童存善 on 2022/5/29.
//

import Foundation

class ViewModel: ObservableObject {
    @Published private var model = Model()
    
    // MARK: -Access to the model
    
    var toView: String {
        model.toView
    }
    
    var isJump: Bool {
        model.isJump
    }
    
    var toListing: Bool {
        model.toListing
    }
    
    var areaFilter: String {
        model.areaFilter
    }
    // MARK: -Intent(s)
    
    func toSignIn() {
        model.toSignIn()
    }
    
    func toRegister() {
        model.toRegister()
    }
    
    func toIndex() {
        model.toIndex()
    }
    
    func toggleIsJump() {
        model.toggleIsJump()
    }
    
    func toggleToListing() {
        model.toggletoListing()
    }
    
    func choseArea(area: String) {
        model.choseArea(area: area)
    }

}
