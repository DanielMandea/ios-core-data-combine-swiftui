//
//  CoreDataProApp.swift
//  Shared
//
//  Created by Daniel on 27.02.2021.
//

import SwiftUI

@main
struct CoreDataProApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
