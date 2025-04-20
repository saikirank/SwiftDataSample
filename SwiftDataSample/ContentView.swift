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
    @State var path: [Destination] = []
    @State private var sortOrder = SortDescriptor(\Destination.name)
    @State private var searchText: String = ""
    var body: some View {
        NavigationStack(path: $path, root: {
            DestinationListView(sort: sortOrder, searchText: searchText)
            .navigationBarTitle("Destinations")
            .searchable(text: $searchText)
                .toolbar {
                    Button("Add", systemImage: "plus", action: add)
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name").tag(SortDescriptor(\Destination.name))
                            Text("Priority")
                                .tag(SortDescriptor(\Destination.priority, order: .reverse))
                            Text("Date").tag(SortDescriptor(\Destination.date))
                        }.pickerStyle(.inline)
                    }
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
    
    
}

#Preview {
    ContentView()
}
