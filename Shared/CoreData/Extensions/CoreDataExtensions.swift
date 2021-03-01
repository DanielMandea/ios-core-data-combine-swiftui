//
//  CoreDataExtensions.swift
//  CoreDataPro (iOS)
//
//  Created by Daniel on 27.02.2021.
//

import Foundation
import CoreData

extension CodingUserInfoKey {
  static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")!
}

enum DecoderConfigurationError: Error {
  case missingManagedObjectContext
}
