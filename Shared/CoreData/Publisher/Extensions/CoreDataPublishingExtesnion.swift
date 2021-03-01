//
//  CoreDataPublishingExtesnion.swift
//  CoreDataPro (iOS)
//
//  Created by Daniel on 01.03.2021.
//

import Foundation
import CoreData

extension CoreDataPublishing {
    func publisher<T>(jsonDecoder: JSONDecoder, data: Data) -> CoreDataPublisher<T> {
        CoreDataPublisher(decoder: jsonDecoder, data: data)
    }

    func publisher<T>(context: NSManagedObjectContext, data: Data) -> CoreDataPublisher<T> {
        let decoder = JSONDecoder()
        decoder.userInfo[CodingUserInfoKey.managedObjectContext] = context
        return publisher(jsonDecoder: decoder, data: data)
    }
}
