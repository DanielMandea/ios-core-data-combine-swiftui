//
//  CoreDataPublishing.swift
//  CoreDataPro (iOS)
//
//  Created by Daniel on 01.03.2021.
//

import Foundation
import CoreData
import Combine

protocol CoreDataPublishing {
    func publisher<T>(jsonDecoder: JSONDecoder, data: Data) -> CoreDataPublisher<T> where T: NSManagedObject, T: Codable
    func publisher<T>(context: NSManagedObjectContext, data: Data) -> CoreDataPublisher<T> where T: NSManagedObject, T: Codable
}
