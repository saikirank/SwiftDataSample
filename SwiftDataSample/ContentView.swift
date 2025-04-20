//
//  ContentView.swift
//  SwiftDataSample
//
//  Created by Saikiran K on 18/04/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var destinations: [Destination]
    @State var path: [Destination] = []
    var body: some View {
        NavigationStack(path: $path, root: {
            List {
                
                ForEach(destinations) { destination in
                   
                    NavigationLink(value: destination) {
                        VStack (alignment: .leading, content: {
                            Text(destination.name)
                                .font(.headline)
                            Text(destination.date.formatted(date: .long, time: .shortened))
                        })
                    }

                }.onDelete(perform: { indexSet in
                    deleteDestination(indexSet)
                })
            }            .navigationBarTitle("Destinations")
                .toolbar {
                    Button("Add Samples", action: addSampleDestination)
                    Button("Add", action: add)
                }
                .navigationDestination(for: Destination.self) { destination in
                    EditDestination(destination: destination)
                }
        })
    }
    
    func addSampleDestination() {
        let dest1 = Destination(name: "Rameshwaram")
        let dest2 = Destination(name: "Arunachalam")
        let dest3 = Destination(name: "Tirupati")
        modelContext.insert(dest1)
        modelContext.insert(dest2)
        modelContext.insert(dest3)

    }
    
    func add() {
        let destnation = Destination()
        modelContext.insert(destnation)
        path = [destnation]
    }
    
    func deleteDestination(_ indexSet: IndexSet) {
        
        for index in indexSet {
            modelContext.delete(destinations[index])
        }
        
    }
}

#Preview {
    ContentView()
}
