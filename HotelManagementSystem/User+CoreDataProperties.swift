//
//  User+CoreDataProperties.swift
//  HotelManagementSystem
//
//  Created by 童存善 on 2022/5/30.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var username: String?

    var wrappedEmail: String {
        email ?? "Unknown"
    }
    var wrappedPassword: String {
        password ?? "Unknown"
    }
    var wrappedUsername: String {
        username ?? "Unknown"
    }
}

extension User : Identifiable {

}
