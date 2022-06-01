//
//  Model.swift
//  HotelManagementSystem
//
//  Created by 童存善 on 2022/5/29.
//

import Foundation

struct Model {
    private(set) var isJump: Bool = false
    
    private(set) var toListing: Bool = false
    
    private(set) var toView: String = "Register"
    
    private(set) var areaFilter: String = "Hangzhou"
    
    
    mutating func toSignIn() {
        toView = "SignIn"
    }
    
    mutating func toRegister() {
        toView = "Register"
    }
    
    mutating func toIndex() {
        toView = "Index"
    }
    
    mutating func toggleIsJump() {
        isJump.toggle()
    }
    
    mutating func toggletoListing() {
        toListing.toggle()
    }
    
    mutating func choseArea(area: String) {
        areaFilter = area
    }
}
