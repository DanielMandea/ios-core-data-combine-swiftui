//
//  Car+CoreDataProperties.swift
//  CoreDataPro (iOS)
//
//  Created by Daniel on 27.02.2021.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var owner: Person?

}

extension Car : Identifiable {

}
