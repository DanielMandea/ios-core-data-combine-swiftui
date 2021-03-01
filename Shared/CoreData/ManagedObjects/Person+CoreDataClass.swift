//
//  Person+CoreDataClass.swift
//  CoreDataPro (iOS)
//
//  Created by Daniel on 27.02.2021.
//
//

import Foundation
import CoreData

@objc(Person)
public class Person: NSManagedObject, Codable {
    enum CodingKeys: CodingKey {
        case id, name, age, cars
     }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
          throw DecoderConfigurationError.missingManagedObjectContext
        }

        self.init(context: context)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.age = try container.decode(Int64.self, forKey: .age)
        self.cars = try? container.decode(Set<Car>.self, forKey: .cars) as NSSet?
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age)
        try container.encode(cars as! Set<Car>, forKey: .cars)
    }
}
