//
//  Hotel+CoreDataProperties.swift
//  HotelManagementSystem
//
//  Created by 童存善 on 2022/5/29.
//
//

import Foundation
import CoreData


extension Hotel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Hotel> {
        return NSFetchRequest<Hotel>(entityName: "Hotel")
    }

    @NSManaged public var area: String?
    @NSManaged public var country: String?
    @NSManaged public var hostName: String?
    @NSManaged public var id: UUID?
    @NSManaged public var minimumNights: Int16
    @NSManaged public var name: String?
    @NSManaged public var price: Int16
    @NSManaged public var rating: Int16
    
    var wrappedCountry: String {
        country ?? "Unknown"
    }
    var wrappedArea: String {
        area ?? "Unknown"
    }
    var wrappedHostName: String {
        hostName ?? "Unknown"
    }
    var wrappedId: UUID {
        UUID()
    }
    var wrappedName: String {
        name ?? "Unknown"
    }
    var wrappedprice: Int16 {
        price
    }
    var wrappedrating: Int16 {
        rating
    }
    var wrappedMinimumNights: Int16 {
        minimumNights
    }

}

extension Hotel : Identifiable {

}
