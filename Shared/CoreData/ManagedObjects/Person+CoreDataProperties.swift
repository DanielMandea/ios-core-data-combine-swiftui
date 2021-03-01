//
//  Person+CoreDataProperties.swift
//  CoreDataPro (iOS)
//
//  Created by Daniel on 27.02.2021.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var age: Int64
    @NSManaged public var cars: NSSet?

}

// MARK: Generated accessors for cars
extension Person {

    @objc(addCarsObject:)
    @NSManaged public func addToCars(_ value: Car)

    @objc(removeCarsObject:)
    @NSManaged public func removeFromCars(_ value: Car)

    @objc(addCars:)
    @NSManaged public func addToCars(_ values: NSSet)

    @objc(removeCars:)
    @NSManaged public func removeFromCars(_ values: NSSet)

}

extension Person : Identifiable {

}
