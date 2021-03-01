//
//  Car+CoreDataClass.swift
//  CoreDataPro (iOS)
//
//  Created by Daniel on 27.02.2021.
//
//

import Foundation
import CoreData

@objc(Car)
public class Car: NSManagedObject, Codable {
    
    enum CodingKeys: CodingKey {
        case id, name, owner
     }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
          throw DecoderConfigurationError.missingManagedObjectContext
        }

        self.init(context: context)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.owner = try container.decode(Person.self, forKey: .owner)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(owner, forKey: .owner)
    }
}
