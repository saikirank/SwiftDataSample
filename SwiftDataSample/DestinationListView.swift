//
//  DestinationListView.swift
//  SwiftDataSample
//
//  Created by Saikiran K on 20/04/25.
//

import SwiftUI
import SwiftData

struct DestinationListView: View {
    @Query(sort: [SortDescriptor(\Destination.priority, order: .reverse)]) var destinations: [Destination]
    @Environment(\.modelContext) var modelContext


    init(sort: SortDescriptor<Destination>) {
        _destinations = Query(sort: [sort])
    }
    var body: some View {
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
        }
    }
    func deleteDestination(_ indexSet: IndexSet) {
        
        for index in indexSet {
            modelContext.delete(destinations[index])
        }
        
    }
}

#Preview {
    DestinationListView(sort: SortDescriptor(\Destination.name))
}
