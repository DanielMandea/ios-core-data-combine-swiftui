//
//  ContentView.swift
//  Shared
//
//  Created by Daniel on 27.02.2021.
//

import SwiftUI
import CoreData
import Combine

struct ContentView: View, CoreDataPublishing {
    
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: Car.entity(), sortDescriptors: []) var items: FetchedResults<Car>
    
    var body: some View {
        VStack {
            List {
                ForEach(items) { item in
                    VStack {
                        Text("Car: \(item.name ?? "")")
                        Text("Owner: \(item.owner?.name ?? "")")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            Button(action: addItem) {
                Label("Add Item", systemImage: "plus")
            }
        }
    }
    
    private func addItem() {
        withAnimation {
            let x: CoreDataPublisher<Car> = publisher(context: viewContext, data: JSONLoader.loadFile(with: "cars")!)
            let _ = x.sink { completion in
                print(completion)
            } receiveValue: { value in
                print(value)
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
